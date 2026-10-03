/**
 * Cloudflare Worker - Luarmor-style Key System Backend for EsclipseScriptHub
 * 
 * Features:
 * - Web Admin Dashboard (/admin):
 *   * Dark-mode executive dashboard with authentication (ADMIN_SECRET)
 *   * Real-time metrics: Total keys, Active devices, Expired keys, Lifetime VIPs
 *   * 1-Click Key Generator: 24h, 7 Days, 30 Days, Lifetime or Custom VIP keys
 *   * Keys Explorer Table: Live search, filter, 1-click HWID reset, 1-click delete, 1-click copy
 *   * System & Anti-Bypass health monitor
 * - Anti-Bypass Shield Level 3 (Fort Knox Protection):
 *   1. LootLabs Official AES-256 Dynamic URL Encryptor (Blocks third-party bypassers/bots)
 *   2. Time-Delta Verification: Rejects completions faster than 12 seconds (Anti-Bot)
 *   3. Cryptographic One-Time Nonce Tokens: Single-use, auto-expiring in 10 minutes (Anti-Replay)
 *   4. Sequential Anti-Skip Enforcement: Step 2 cannot be unlocked without Step 1
 *   5. Physical HWID Device Binding: Keys locked to 1 device; shared keys are rejected
 * - 2-Step Checkpoint Monetization (LootLabs & Work.ink ready)
 * - Progress Memory: Saves completed steps in KV (1 hour) so users don't repeat Step 1 on refresh
 * - Auto-Detection: Existing active keys are displayed without repeating checkpoints
 * - CORS-enabled for Roblox executors
 */

// =========================================================================
// 1. MONETIZATION & ANTI-BYPASS CONFIGURATION
// =========================================================================
const MONETIZATION_CONFIG = {
  // Active provider: "lootlabs" | "workink" | "direct"
  provider: "lootlabs",

  // LootLabs Settings (lootlabs.gg) - 2 Checkpoints
  lootlabs: {
    links: [
      "https://lootdest.org/s?pIJgULG5", // Checkpoint 1
      "https://lootdest.org/s?y70bzNYg", // Checkpoint 2
    ],

    // LootLabs Official API Token (AES-256 Dynamic Anti-Bypass Encryptor)
    apiToken: "9f0d737c8263b53bc03174b280979b2a5e22de88f64558fed1f79c3496167fb4",
  },

  // Work.ink Settings (work.ink) - Ready for future activation
  workink: {
    links: [
      "PASTE_WORKINK_LINK_1_HERE",
      "PASTE_WORKINK_LINK_2_HERE",
    ],
  },

  // Key duration in hours after completing checkpoints (24h standard)
  keyDurationHours: 24,

  // Anti-Bypass: Minimum elapsed seconds required between clicking link & completion (12s)
  minCompletionSeconds: 12,

  // Maximum valid lifetime of a one-time checkpoint token (10 minutes)
  tokenTimeoutSeconds: 600,

  // Time in seconds to remember Step 1 completion before it expires (1 hour)
  stepTimeoutSeconds: 3600,
};

// =========================================================================
// 2. HELPER UTILITIES & CRYPTO NONCES
// =========================================================================
const corsHeaders = {
  "Access-Control-Allow-Origin": "*",
  "Access-Control-Allow-Methods": "GET, POST, OPTIONS",
  "Access-Control-Allow-Headers": "Content-Type, Authorization, X-Admin-Secret",
};

function jsonResponse(data, status = 200) {
  return new Response(JSON.stringify(data), {
    status,
    headers: {
      "Content-Type": "application/json",
      ...corsHeaders,
    },
  });
}

function generateRandomKey() {
  const chars = "ABCDEFGHJKLMNPQRSTUVWXYZ23456789";
  const segment = (len) => {
    let res = "";
    for (let i = 0; i < len; i++) {
      res += chars.charAt(Math.floor(Math.random() * chars.length));
    }
    return res;
  };
  return `ESCLIPSE-${segment(4)}-${segment(4)}-${segment(4)}`;
}

function generateRandomToken(prefix = "chk") {
  const randomBytes = new Uint8Array(16);
  crypto.getRandomValues(randomBytes);
  const hex = Array.from(randomBytes)
    .map((b) => b.toString(16).padStart(2, "0"))
    .join("");
  return `${prefix}_${hex}`;
}

function getCookie(request, name) {
  const cookieHeader = request.headers.get("Cookie");
  if (!cookieHeader) return null;
  const match = cookieHeader.match(new RegExp("(^|;\\s*)" + name + "=([^;]*)"));
  return match ? decodeURIComponent(match[2]) : null;
}

function getClientIp(request) {
  return (
    request.headers.get("CF-Connecting-IP") ||
    request.headers.get("X-Forwarded-For") ||
    "0.0.0.0"
  );
}

/**
 * LootLabs AES-256 Dynamic URL Encryptor
 */
async function encryptLootlabsUrl(destUrl, apiToken) {
  if (!apiToken || apiToken.length < 10) return null;

  try {
    let res = await fetch("https://creators.lootlabs.gg/api/public/url_encryptor", {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
        Authorization: `Bearer ${apiToken}`,
      },
      body: JSON.stringify({ destination_url: destUrl }),
    });

    if (!res.ok) {
      res = await fetch(
        `https://creators.lootlabs.gg/api/public/url_encryptor?destination_url=${encodeURIComponent(
          destUrl
        )}&api_token=${encodeURIComponent(apiToken)}`
      );
    }

    if (res.ok) {
      const data = await res.json();
      const enc =
        data.encrypted_url ||
        data.message_encrypted_url ||
        data.data ||
        (typeof data.message === "string" && data.message.length > 15 ? data.message : null);
      if (enc) return enc;
    }
  } catch (err) {
    console.error("Lootlabs Encryptor API Error:", err);
  }
  return null;
}

// =========================================================================
// 3. USER CHECKPOINT HTML RENDERERS
// =========================================================================

const sharedUserStyles = `
  * { box-sizing: border-box; margin: 0; padding: 0; }
  body {
    background: #0d0d12;
    color: #e2e8f0;
    font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Helvetica, Arial, sans-serif;
    display: flex;
    justify-content: center;
    align-items: center;
    min-height: 100vh;
    padding: 20px;
    overflow-x: hidden;
  }
  .card {
    background: #15151c;
    border: 1px solid #282834;
    border-radius: 16px;
    padding: 34px 26px;
    max-width: 450px;
    width: 100%;
    text-align: center;
    box-shadow: 0 20px 40px rgba(0, 0, 0, 0.6), 0 0 1px 1px rgba(99, 102, 241, 0.1);
    position: relative;
    z-index: 10;
  }
  .badge-icon {
    width: 50px;
    height: 50px;
    background: linear-gradient(135deg, #6366f1, #4f46e5);
    border-radius: 14px;
    display: flex;
    justify-content: center;
    align-items: center;
    margin: 0 auto 16px;
    box-shadow: 0 8px 20px rgba(99, 102, 241, 0.35);
    font-size: 24px;
  }
  h1 { font-size: 22px; font-weight: 700; color: #ffffff; margin-bottom: 6px; }
  .subtitle { font-size: 13px; color: #94a3b8; line-height: 1.5; margin-bottom: 20px; }
  .stepper {
    display: flex;
    align-items: center;
    justify-content: space-between;
    margin-bottom: 22px;
    padding: 10px 14px;
    background: #1a1a24;
    border-radius: 12px;
    border: 1px solid #2b2b3a;
  }
  .step-node {
    display: flex;
    flex-direction: column;
    align-items: center;
    gap: 4px;
    font-size: 11px;
    color: #64748b;
    font-weight: 600;
  }
  .step-node.active { color: #818cf8; }
  .step-node.completed { color: #4ade80; }
  .step-circle {
    width: 28px;
    height: 28px;
    border-radius: 50%;
    background: #252533;
    border: 1.5px solid #3b3b4f;
    display: flex;
    justify-content: center;
    align-items: center;
    font-size: 12px;
    color: #94a3b8;
    transition: all 0.3s ease;
  }
  .step-node.active .step-circle {
    background: #6366f1;
    border-color: #818cf8;
    color: #ffffff;
    box-shadow: 0 0 12px rgba(99, 102, 241, 0.6);
  }
  .step-node.completed .step-circle {
    background: #166534;
    border-color: #22c55e;
    color: #4ade80;
  }
  .step-line {
    flex: 1;
    height: 2px;
    background: #2b2b3a;
    margin: 0 8px;
    margin-bottom: 16px;
    border-radius: 2px;
  }
  .step-line.completed { background: #22c55e; }
  .security-tag {
    display: inline-flex;
    align-items: center;
    gap: 6px;
    background: rgba(99, 102, 241, 0.12);
    border: 1px solid rgba(99, 102, 241, 0.3);
    color: #a5b4fc;
    font-size: 11px;
    font-weight: 600;
    padding: 4px 10px;
    border-radius: 20px;
    margin-bottom: 18px;
  }
  .hwid-box {
    background: #1e1e28;
    border: 1px solid #323242;
    border-radius: 10px;
    padding: 10px 14px;
    margin-bottom: 20px;
    text-align: left;
  }
  .hwid-box .label { font-size: 10px; font-weight: 700; color: #818cf8; text-transform: uppercase; letter-spacing: 0.5px; margin-bottom: 4px; }
  .hwid-box .value { font-family: 'SFMono-Regular', Consolas, 'Liberation Mono', Menlo, monospace; font-size: 11px; color: #cbd5e1; word-break: break-all; }
  .key-display {
    background: #1b1b24;
    border: 2px dashed #6366f1;
    border-radius: 12px;
    padding: 16px;
    margin-bottom: 20px;
    position: relative;
  }
  .key-value {
    font-family: 'SFMono-Regular', Consolas, 'Liberation Mono', Menlo, monospace;
    font-size: 16.5px;
    font-weight: 700;
    color: #a5b4fc;
    letter-spacing: 1px;
    word-break: break-all;
    user-select: all;
  }
  .expiry-tag {
    display: inline-block;
    background: rgba(34, 197, 94, 0.12);
    border: 1px solid rgba(34, 197, 94, 0.3);
    color: #4ade80;
    font-size: 11px;
    font-weight: 600;
    padding: 3px 10px;
    border-radius: 20px;
    margin-top: 8px;
  }
  .btn {
    display: flex;
    justify-content: center;
    align-items: center;
    width: 100%;
    background: #6366f1;
    color: #ffffff;
    border: none;
    padding: 13px 20px;
    border-radius: 10px;
    font-size: 14.5px;
    font-weight: 600;
    cursor: pointer;
    text-decoration: none;
    transition: all 0.2s ease;
    margin-bottom: 12px;
    box-shadow: 0 4px 15px rgba(99, 102, 241, 0.3);
  }
  .btn:hover { background: #4f46e5; transform: translateY(-1px); }
  .btn-warning { background: #f59e0b; box-shadow: 0 4px 15px rgba(245, 158, 11, 0.3); }
  .btn-warning:hover { background: #d97706; }
  .steps-box {
    background: #191922;
    border-radius: 10px;
    padding: 14px;
    margin-bottom: 20px;
    text-align: left;
    font-size: 12px;
    color: #94a3b8;
    border: 1px solid #282834;
  }
  .steps-box ol { padding-left: 20px; line-height: 1.7; }
  .footer { margin-top: 18px; font-size: 11px; color: #64748b; }
  canvas#confetti { position: fixed; top: 0; left: 0; width: 100vw; height: 100vh; pointer-events: none; z-index: 100; }
`;

const confettiScript = `
  <canvas id="confetti"></canvas>
  <script>
    (function() {
      const c = document.getElementById('confetti');
      const ctx = c.getContext('2d');
      let w = c.width = window.innerWidth;
      let h = c.height = window.innerHeight;
      window.addEventListener('resize', () => { w = c.width = window.innerWidth; h = c.height = window.innerHeight; });
      const pieces = [];
      const colors = ['#6366f1', '#4ade80', '#f43f5e', '#38bdf8', '#fbbf24', '#a855f7'];
      for (let i = 0; i < 90; i++) {
        pieces.push({
          x: w / 2, y: h / 2,
          vx: (Math.random() - 0.5) * 16,
          vy: (Math.random() - 0.8) * 16,
          size: Math.random() * 7 + 4,
          color: colors[Math.floor(Math.random() * colors.length)],
          rotation: Math.random() * 360,
          vRot: (Math.random() - 0.5) * 10,
          opacity: 1
        });
      }
      let frames = 0;
      function render() {
        ctx.clearRect(0, 0, w, h);
        let alive = false;
        for (let p of pieces) {
          p.x += p.vx;
          p.y += p.vy;
          p.vy += 0.35;
          p.vx *= 0.98;
          p.rotation += p.vRot;
          if (frames > 35) p.opacity -= 0.015;
          if (p.opacity > 0) {
            alive = true;
            ctx.save();
            ctx.globalAlpha = Math.max(0, p.opacity);
            ctx.translate(p.x, p.y);
            ctx.rotate(p.rotation * Math.PI / 180);
            ctx.fillStyle = p.color;
            ctx.fillRect(-p.size / 2, -p.size / 2, p.size, p.size * 0.6);
            ctx.restore();
          }
        }
        frames++;
        if (alive && frames < 140) requestAnimationFrame(render);
        else ctx.clearRect(0, 0, w, h);
      }
      requestAnimationFrame(render);
    })();
  </script>
`;

function renderStepper(currentStep) {
  const is1Comp = currentStep > 1;
  const is1Active = currentStep === 1;
  const is2Comp = currentStep > 2;
  const is2Active = currentStep === 2;
  const isKeyComp = currentStep >= 3;

  return `
    <div class="stepper">
      <div class="step-node ${is1Comp ? "completed" : is1Active ? "active" : ""}">
        <div class="step-circle">${is1Comp ? "✓" : "1"}</div>
        <span>Checkpoint 1</span>
      </div>
      <div class="step-line ${is1Comp ? "completed" : ""}"></div>
      <div class="step-node ${is2Comp ? "completed" : is2Active ? "active" : ""}">
        <div class="step-circle">${is2Comp ? "✓" : "2"}</div>
        <span>Checkpoint 2</span>
      </div>
      <div class="step-line ${is2Comp ? "completed" : ""}"></div>
      <div class="step-node ${isKeyComp ? "completed" : ""}">
        <div class="step-circle">${isKeyComp ? "✓" : "🔑"}</div>
        <span>Get Key</span>
      </div>
    </div>
  `;
}

function renderActiveKeyHtml({ hwid, key, timeLeftFormatted }) {
  return `<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Active Key Found • Esclipse Hub</title>
  <style>${sharedUserStyles}</style>
</head>
<body>
  <div class="card">
    <div class="badge-icon">⚡</div>
    <h1>Active Key Found!</h1>
    <p class="subtitle">Your device already has an active key. You do not need to repeat the checkpoints!</p>

    <div class="hwid-box">
      <div class="label">Bound Device (HWID)</div>
      <div class="value">${hwid}</div>
    </div>

    <div class="key-display">
      <div class="key-value" id="keyText">${key}</div>
      <div class="expiry-tag">Valid for: ${timeLeftFormatted}</div>
    </div>

    <button class="btn" id="copyBtn" onclick="copyKey()">📋 Copy Key</button>

    <div class="steps-box">
      <ol>
        <li>Click <strong>Copy Key</strong> above.</li>
        <li>Open Roblox and paste the key into the prompt.</li>
        <li>Click <strong>Submit Key</strong> to access Esclipse Hub.</li>
      </ol>
    </div>

    <div class="footer">Esclipse Hub • Luarmor-style Authentication</div>
  </div>

  <script>
    function copyKey() {
      const text = document.getElementById("keyText").innerText;
      navigator.clipboard.writeText(text).then(() => {
        const btn = document.getElementById("copyBtn");
        btn.innerText = "✅ Copied to Clipboard!";
        btn.style.background = "#22c55e";
        setTimeout(() => {
          btn.innerText = "📋 Copy Key";
          btn.style.background = "#6366f1";
        }, 2000);
      });
    }
  </script>
</body>
</html>`;
}

function renderStep1Html({ hwid, providerName, startUrl, isConfigured }) {
  return `<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Checkpoint 1 of 2 • Esclipse Hub</title>
  <style>${sharedUserStyles}</style>
</head>
<body>
  <div class="card">
    <div class="badge-icon">🛡️</div>
    <h1>Checkpoint 1 of 2</h1>
    <p class="subtitle">Complete 2 quick checkpoints on ${providerName} to unlock your 24-hour key.</p>

    <div class="security-tag">🔒 AES-256 Anti-Bypass Protected</div>

    ${renderStepper(1)}

    <div class="hwid-box">
      <div class="label">Your Device (HWID)</div>
      <div class="value">${hwid}</div>
    </div>

    <div class="steps-box">
      <div style="font-weight: 700; color: #cbd5e1; margin-bottom: 6px;">Instructions:</div>
      <ol>
        <li>Click <strong>Start Checkpoint 1</strong> below.</li>
        <li>Complete the short task on ${providerName}.</li>
        <li>You will automatically advance to Checkpoint 2!</li>
      </ol>
    </div>

    ${
      isConfigured
        ? `<a href="${startUrl}" class="btn">Start Checkpoint 1 (${providerName}) ➔</a>`
        : `<button class="btn" style="background:#475569;" disabled>⚠️ Setup Incomplete</button>`
    }

    <div class="footer">Esclipse Hub • Protected by Anti-Bypass Shield</div>
  </div>

  <script>
    try {
      const hwid = "${hwid}";
      if (hwid && hwid !== "Unknown") {
        localStorage.setItem("esclipse_hwid", hwid);
      }
    } catch (e) {}
  </script>
</body>
</html>`;
}

function renderStep2Html({ hwid, providerName, startUrl, isConfigured }) {
  return `<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Checkpoint 2 of 2 • Esclipse Hub</title>
  <style>${sharedUserStyles}</style>
</head>
<body>
  <div class="card">
    <div class="badge-icon" style="background: linear-gradient(135deg, #10b981, #059669);">✓</div>
    <h1>Checkpoint 1 Complete!</h1>
    <p class="subtitle">Great job! You have verified Checkpoint 1. Complete the final checkpoint to receive your key.</p>

    <div class="security-tag" style="background:rgba(16,185,129,0.12); border-color:rgba(16,185,129,0.3); color:#6ee7b7;">
      🛡️ Step 1 Verified • Ready for Step 2
    </div>

    ${renderStepper(2)}

    <div class="hwid-box">
      <div class="label">Your Device (HWID)</div>
      <div class="value">${hwid}</div>
    </div>

    <div class="steps-box">
      <div style="font-weight: 700; color: #cbd5e1; margin-bottom: 6px;">Final Step:</div>
      <ol>
        <li>Click <strong>Start Final Checkpoint</strong> below.</li>
        <li>Complete the task on ${providerName}.</li>
        <li>Your 24-hour key will be generated immediately!</li>
      </ol>
    </div>

    ${
      isConfigured
        ? `<a href="${startUrl}" class="btn" style="background:#10b981;">Start Final Checkpoint (Step 2/2) ➔</a>`
        : `<button class="btn" style="background:#475569;" disabled>⚠️ Setup Incomplete</button>`
    }

    <div class="footer">Esclipse Hub • Almost there!</div>
  </div>

  <script>
    try {
      const hwid = "${hwid}";
      if (hwid && hwid !== "Unknown") {
        localStorage.setItem("esclipse_hwid", hwid);
      }
    } catch (e) {}
  </script>
</body>
</html>`;
}

function renderBypassWarningHtml({ hwid, elapsedSeconds, minSeconds, retryUrl }) {
  return `<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Anti-Bypass Warning • Esclipse Hub</title>
  <style>${sharedUserStyles}</style>
</head>
<body>
  <div class="card" style="border-color:#f59e0b;">
    <div class="badge-icon" style="background: linear-gradient(135deg, #f59e0b, #d97706); font-size:26px;">⚠️</div>
    <h1 style="color:#fbbf24;">Anti-Bypass Triggered!</h1>
    <p class="subtitle">Suspicious activity detected. The checkpoint was completed unnaturally fast.</p>

    <div class="hwid-box" style="border-color:#78350f; background:#1c1917;">
      <div class="label" style="color:#fbbf24;">Detection Details</div>
      <div style="font-size:12px; color:#d6d3d1; line-height:1.6; margin-top:4px;">
        • Time Elapsed: <strong style="color:#f87171;">${elapsedSeconds} seconds</strong><br>
        • Minimum Required: <strong>${minSeconds} seconds</strong><br>
        • Reason: Automated bypass tools or script skippers detected.
      </div>
    </div>

    <div class="steps-box">
      <div style="font-weight: 700; color: #fde68a; margin-bottom: 6px;">How to resolve:</div>
      <ol>
        <li>Disable any ad-bypass extensions or bypass bots.</li>
        <li>Click <strong>Retry Checkpoint</strong> below.</li>
        <li>Complete the tasks legitimately on the sponsor page.</li>
      </ol>
    </div>

    <a href="${retryUrl}" class="btn btn-warning">🔄 Retry Checkpoint (Legitimate)</a>

    <div class="footer">Esclipse Hub • Security System</div>
  </div>
</body>
</html>`;
}

function renderCompletedHtml({ hwid, key, timeLeftFormatted }) {
  return `<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Access Granted • Esclipse Hub</title>
  <style>${sharedUserStyles}</style>
</head>
<body>
  <div class="card">
    <div class="badge-icon">🎉</div>
    <h1>Access Granted!</h1>
    <p class="subtitle">All checkpoints verified! Your 24-hour key has been generated and bound to your device.</p>

    ${renderStepper(3)}

    <div class="hwid-box">
      <div class="label">Bound Device (HWID)</div>
      <div class="value">${hwid}</div>
    </div>

    <div class="key-display">
      <div class="key-value" id="keyText">${key}</div>
      <div class="expiry-tag">Valid for: ${timeLeftFormatted}</div>
    </div>

    <button class="btn" id="copyBtn" onclick="copyKey()">📋 Copy Key</button>

    <div class="steps-box">
      <ol>
        <li>Click <strong>Copy Key</strong> above.</li>
        <li>Return to Roblox and paste the key into the prompt.</li>
        <li>Click <strong>Submit Key</strong> to start exploiting!</li>
      </ol>
    </div>

    <div class="footer">Esclipse Hub • Thank you for your support!</div>
  </div>

  ${confettiScript}

  <script>
    function copyKey() {
      const text = document.getElementById("keyText").innerText;
      navigator.clipboard.writeText(text).then(() => {
        const btn = document.getElementById("copyBtn");
        btn.innerText = "✅ Copied to Clipboard!";
        btn.style.background = "#22c55e";
        setTimeout(() => {
          btn.innerText = "📋 Copy Key";
          btn.style.background = "#6366f1";
        }, 2000);
      });
    }
  </script>
</body>
</html>`;
}

function renderClaimHtml() {
  return `<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Claim Key • Esclipse Hub</title>
  <style>${sharedUserStyles}</style>
</head>
<body>
  <div class="card">
    <div class="badge-icon">🔑</div>
    <h1>Claim Your Key</h1>
    <p class="subtitle">Verifying your checkpoints and device binding...</p>

    <div id="statusMsg" style="font-size: 13px; color: #a5b4fc; margin-bottom: 16px;">
      Checking browser session...
    </div>

    <div id="manualInput" style="display:none;">
      <p style="font-size:12px; color:#94a3b8; margin-bottom:12px;">
        If not detected automatically, please paste your HWID from Roblox:
      </p>
      <input type="text" id="hwidInput" placeholder="Paste your HWID here" style="width:100%; padding:10px 14px; background:#1e1e28; border:1px solid #323242; border-radius:8px; color:#fff; font-family:monospace; font-size:12px; margin-bottom:14px;">
      <button class="btn" onclick="submitHwid()">Claim Key</button>
    </div>

    <div class="footer">Esclipse Hub • Luarmor-style System</div>
  </div>

  <script>
    async function init() {
      let hwid = null;
      try {
        hwid = localStorage.getItem("esclipse_hwid");
      } catch (e) {}

      if (hwid && hwid.length > 5) {
        document.getElementById("statusMsg").innerText = "Generating key for: " + hwid.substring(0, 12) + "...";
        window.location.href = "/api/checkpoint/complete?hwid=" + encodeURIComponent(hwid);
      } else {
        document.getElementById("statusMsg").style.display = "none";
        document.getElementById("manualInput").style.display = "block";
      }
    }

    function submitHwid() {
      const h = document.getElementById("hwidInput").value.trim();
      if (!h) {
        alert("Please enter a valid HWID!");
        return;
      }
      window.location.href = "/api/checkpoint/complete?hwid=" + encodeURIComponent(h);
    }

    init();
  </script>
</body>
</html>`;
}

// =========================================================================
// 4. WEB ADMIN DASHBOARD HTML RENDERER
// =========================================================================
function renderAdminDashboardHtml() {
  return `<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Esclipse Script Hub • Executive Admin Console</title>
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@400;500;600;700;800&family=JetBrains+Mono:wght@500;700&display=swap" rel="stylesheet">
  <style>
    :root {
      --bg-base: #08080c;
      --bg-surface: #101017;
      --bg-surface-elevated: #161622;
      --bg-surface-hover: #1c1c2b;
      --border-subtle: rgba(255, 255, 255, 0.07);
      --border-hover: rgba(99, 102, 241, 0.35);
      --text-main: #f8fafc;
      --text-muted: #94a3b8;
      --text-dim: #64748b;
      --primary: #6366f1;
      --primary-glow: rgba(99, 102, 241, 0.25);
      --success: #10b981;
      --success-glow: rgba(16, 185, 129, 0.2);
      --warning: #f59e0b;
      --danger: #ef4444;
      --purple: #a855f7;
    }

    * { box-sizing: border-box; margin: 0; padding: 0; }
    body {
      background: var(--bg-base);
      background-image: 
        radial-gradient(circle at 10% 10%, rgba(99, 102, 241, 0.08) 0%, transparent 40%),
        radial-gradient(circle at 90% 90%, rgba(16, 185, 129, 0.05) 0%, transparent 40%);
      color: var(--text-main);
      font-family: 'Plus Jakarta Sans', -apple-system, BlinkMacSystemFont, sans-serif;
      min-height: 100vh;
      display: flex;
      flex-direction: column;
      -webkit-font-smoothing: antialiased;
    }

    /* Scrollbar */
    ::-webkit-scrollbar { width: 6px; height: 6px; }
    ::-webkit-scrollbar-track { background: var(--bg-base); }
    ::-webkit-scrollbar-thumb { background: #262638; border-radius: 3px; }
    ::-webkit-scrollbar-thumb:hover { background: #383852; }

    /* Top Sticky Navbar */
    .navbar {
      background: rgba(16, 16, 23, 0.75);
      backdrop-filter: blur(16px);
      -webkit-backdrop-filter: blur(16px);
      border-bottom: 1px solid var(--border-subtle);
      padding: 14px 28px;
      display: flex;
      justify-content: space-between;
      align-items: center;
      position: sticky;
      top: 0;
      z-index: 100;
    }
    .brand {
      display: flex;
      align-items: center;
      gap: 12px;
      font-size: 16px;
      font-weight: 800;
      color: #fff;
      letter-spacing: -0.02em;
    }
    .brand-icon {
      width: 34px;
      height: 34px;
      background: linear-gradient(135deg, #6366f1, #4f46e5);
      border-radius: 9px;
      display: flex;
      align-items: center;
      justify-content: center;
      font-size: 17px;
      box-shadow: 0 4px 14px var(--primary-glow);
    }
    .badge-admin {
      background: rgba(99, 102, 241, 0.15);
      border: 1px solid rgba(99, 102, 241, 0.3);
      color: #a5b4fc;
      font-size: 11px;
      font-weight: 700;
      padding: 2px 8px;
      border-radius: 6px;
      letter-spacing: 0.05em;
    }
    .nav-actions {
      display: flex;
      align-items: center;
      gap: 10px;
    }
    .live-status {
      display: inline-flex;
      align-items: center;
      gap: 6px;
      font-size: 11.5px;
      color: #10b981;
      font-weight: 600;
      padding: 4px 10px;
      background: rgba(16, 185, 129, 0.1);
      border: 1px solid rgba(16, 185, 129, 0.25);
      border-radius: 20px;
      margin-right: 8px;
    }
    .pulse-dot {
      width: 6px;
      height: 6px;
      background: #10b981;
      border-radius: 50%;
      box-shadow: 0 0 8px #10b981;
      animation: pulse 2s infinite;
    }
    @keyframes pulse {
      0%, 100% { opacity: 1; transform: scale(1); }
      50% { opacity: 0.4; transform: scale(0.85); }
    }

    /* Container */
    .container {
      max-width: 1240px;
      width: 100%;
      margin: 0 auto;
      padding: 28px 24px;
      flex: 1;
    }

    /* Bento Grid Metrics */
    .bento-grid {
      display: grid;
      grid-template-columns: repeat(auto-fit, minmax(240px, 1fr));
      gap: 16px;
      margin-bottom: 28px;
    }
    .bento-card {
      background: var(--bg-surface);
      border: 1px solid var(--border-subtle);
      border-radius: 14px;
      padding: 20px;
      transition: all 0.25s cubic-bezier(0.16, 1, 0.3, 1);
      position: relative;
      overflow: hidden;
    }
    .bento-card:hover {
      border-color: var(--border-hover);
      transform: translateY(-2px);
      box-shadow: 0 12px 24px -10px rgba(0,0,0,0.5), 0 0 20px -5px var(--primary-glow);
    }
    .bento-card::after {
      content: '';
      position: absolute;
      top: 0;
      right: 0;
      width: 80px;
      height: 80px;
      background: radial-gradient(circle, var(--card-glow, rgba(99,102,241,0.12)) 0%, transparent 70%);
      pointer-events: none;
    }
    .bento-header {
      display: flex;
      justify-content: space-between;
      align-items: center;
      margin-bottom: 12px;
    }
    .bento-label {
      font-size: 11.5px;
      color: var(--text-muted);
      font-weight: 700;
      text-transform: uppercase;
      letter-spacing: 0.06em;
    }
    .bento-icon {
      width: 32px;
      height: 32px;
      border-radius: 8px;
      display: flex;
      align-items: center;
      justify-content: center;
      font-size: 16px;
      background: var(--icon-bg, #1a1a28);
    }
    .bento-value {
      font-size: 32px;
      font-weight: 800;
      color: #fff;
      letter-spacing: -0.03em;
    }
    .bento-subtext {
      font-size: 11.5px;
      color: var(--text-dim);
      margin-top: 4px;
      display: flex;
      align-items: center;
      gap: 4px;
    }

    /* Segmented Navigation Tabs */
    .tab-bar {
      display: flex;
      gap: 6px;
      background: var(--bg-surface);
      border: 1px solid var(--border-subtle);
      padding: 4px;
      border-radius: 12px;
      width: fit-content;
      margin-bottom: 24px;
    }
    .tab-btn {
      padding: 8px 18px;
      font-size: 13px;
      font-weight: 600;
      color: var(--text-muted);
      background: transparent;
      border: none;
      border-radius: 8px;
      cursor: pointer;
      display: flex;
      align-items: center;
      gap: 7px;
      transition: all 0.2s;
    }
    .tab-btn:hover { color: #fff; }
    .tab-btn.active {
      background: var(--bg-surface-elevated);
      color: #fff;
      border: 1px solid rgba(255,255,255,0.08);
      box-shadow: 0 4px 12px rgba(0,0,0,0.3);
    }

    /* Tab Content Layouts */
    .tab-content { display: none; }
    .tab-content.active { display: block; animation: fadeIn 0.25s ease; }
    @keyframes fadeIn {
      from { opacity: 0; transform: translateY(4px); }
      to { opacity: 1; transform: translateY(0); }
    }

    /* Panels & Surfaces */
    .panel {
      background: var(--bg-surface);
      border: 1px solid var(--border-subtle);
      border-radius: 16px;
      padding: 24px;
      box-shadow: 0 8px 30px rgba(0,0,0,0.3);
    }
    .panel-header {
      display: flex;
      justify-content: space-between;
      align-items: center;
      margin-bottom: 20px;
      flex-wrap: wrap;
      gap: 12px;
    }
    .panel-title {
      font-size: 17px;
      font-weight: 700;
      color: #fff;
      display: flex;
      align-items: center;
      gap: 8px;
      letter-spacing: -0.01em;
    }

    /* Generator Grid */
    .generator-grid {
      display: grid;
      grid-template-columns: 1fr 340px;
      gap: 24px;
    }
    @media (max-width: 860px) {
      .generator-grid { grid-template-columns: 1fr; }
    }

    /* Pill Preset Selectors */
    .preset-pills {
      display: flex;
      flex-wrap: wrap;
      gap: 8px;
      margin-bottom: 16px;
    }
    .preset-pill {
      background: var(--bg-surface-elevated);
      border: 1px solid var(--border-subtle);
      color: var(--text-muted);
      padding: 9px 15px;
      border-radius: 10px;
      font-size: 12.5px;
      font-weight: 600;
      cursor: pointer;
      transition: all 0.2s;
    }
    .preset-pill:hover { border-color: rgba(255,255,255,0.2); color: #fff; }
    .preset-pill.active {
      background: rgba(99, 102, 241, 0.15);
      border-color: var(--primary);
      color: #a5b4fc;
      box-shadow: 0 0 12px var(--primary-glow);
    }

    /* Form Fields */
    .form-group { margin-bottom: 18px; }
    .form-label {
      display: block;
      font-size: 12px;
      font-weight: 700;
      color: var(--text-muted);
      text-transform: uppercase;
      letter-spacing: 0.05em;
      margin-bottom: 7px;
    }
    .form-input {
      width: 100%;
      background: #15151e;
      border: 1px solid #282838;
      border-radius: 10px;
      padding: 12px 16px;
      color: #fff;
      font-size: 13.5px;
      font-family: inherit;
      transition: all 0.2s;
    }
    .form-input:focus {
      outline: none;
      border-color: var(--primary);
      box-shadow: 0 0 0 3px var(--primary-glow);
      background: #181822;
    }

    /* Buttons */
    .btn {
      display: inline-flex;
      align-items: center;
      justify-content: center;
      gap: 8px;
      padding: 11px 20px;
      border-radius: 10px;
      font-size: 13.5px;
      font-weight: 600;
      border: none;
      cursor: pointer;
      transition: all 0.2s cubic-bezier(0.16, 1, 0.3, 1);
    }
    .btn:hover { transform: translateY(-1px); }
    .btn:active { transform: translateY(0); }
    .btn-primary {
      background: linear-gradient(135deg, #6366f1, #4f46e5);
      color: #fff;
      box-shadow: 0 4px 16px var(--primary-glow);
    }
    .btn-primary:hover {
      box-shadow: 0 6px 20px rgba(99, 102, 241, 0.45);
    }
    .btn-secondary {
      background: var(--bg-surface-elevated);
      border: 1px solid var(--border-subtle);
      color: var(--text-muted);
    }
    .btn-secondary:hover { background: var(--bg-surface-hover); color: #fff; border-color: rgba(255,255,255,0.15); }
    .btn-sm { padding: 6px 12px; font-size: 12px; border-radius: 7px; }
    .btn-danger { background: rgba(239, 68, 68, 0.15); border: 1px solid rgba(239, 68, 68, 0.3); color: #f87171; }
    .btn-danger:hover { background: #ef4444; color: #fff; }

    /* Key Explorer Filter Chips */
    .filter-chips {
      display: flex;
      gap: 6px;
      flex-wrap: wrap;
    }
    .chip {
      padding: 6px 12px;
      font-size: 12px;
      font-weight: 600;
      border-radius: 8px;
      background: var(--bg-surface-elevated);
      color: var(--text-muted);
      border: 1px solid var(--border-subtle);
      cursor: pointer;
      transition: all 0.2s;
    }
    .chip:hover { color: #fff; }
    .chip.active {
      background: rgba(99, 102, 241, 0.15);
      border-color: var(--primary);
      color: #a5b4fc;
    }

    /* Table Styles */
    .table-wrapper {
      overflow-x: auto;
      border: 1px solid var(--border-subtle);
      border-radius: 12px;
      background: #0d0d14;
    }
    table {
      width: 100%;
      border-collapse: collapse;
      font-size: 13px;
      text-align: left;
    }
    th {
      background: #14141e;
      padding: 13px 18px;
      font-size: 11px;
      font-weight: 700;
      color: var(--text-muted);
      text-transform: uppercase;
      letter-spacing: 0.06em;
      border-bottom: 1px solid var(--border-subtle);
    }
    td {
      padding: 14px 18px;
      border-bottom: 1px solid rgba(255, 255, 255, 0.04);
      vertical-align: middle;
    }
    tr:last-child td { border-bottom: none; }
    tr:hover td { background: rgba(255, 255, 255, 0.02); }

    .key-badge {
      font-family: 'JetBrains Mono', Consolas, monospace;
      font-size: 12.5px;
      font-weight: 700;
      color: #a5b4fc;
      background: #191926;
      border: 1px solid #2d2d42;
      padding: 4px 9px;
      border-radius: 6px;
      letter-spacing: 0.02em;
    }
    .hwid-badge {
      font-family: 'JetBrains Mono', Consolas, monospace;
      font-size: 11.5px;
      color: #cbd5e1;
      background: #14141d;
      padding: 3px 8px;
      border-radius: 5px;
      border: 1px solid #232332;
    }

    /* Status Tags */
    .tag {
      display: inline-flex;
      align-items: center;
      gap: 5px;
      padding: 3px 9px;
      border-radius: 20px;
      font-size: 11px;
      font-weight: 700;
    }
    .tag-active { background: rgba(16, 185, 129, 0.12); color: #34d399; border: 1px solid rgba(16, 185, 129, 0.3); }
    .tag-lifetime { background: rgba(168, 85, 247, 0.12); color: #c084fc; border: 1px solid rgba(168, 85, 247, 0.3); }
    .tag-expired { background: rgba(239, 68, 68, 0.12); color: #f87171; border: 1px solid rgba(239, 68, 68, 0.3); }

    /* Modals & Dialogs */
    .modal-overlay {
      position: fixed;
      top: 0; left: 0; width: 100vw; height: 100vh;
      background: rgba(0, 0, 0, 0.85);
      backdrop-filter: blur(10px);
      -webkit-backdrop-filter: blur(10px);
      display: flex;
      justify-content: center;
      align-items: center;
      z-index: 9999;
      opacity: 0;
      pointer-events: none;
      transition: opacity 0.2s ease;
    }
    .modal-overlay.open { opacity: 1; pointer-events: auto; }
    .modal-card {
      background: var(--bg-surface);
      border: 1px solid #2d2d40;
      border-radius: 18px;
      padding: 32px 28px;
      width: 90%;
      max-width: 440px;
      text-align: center;
      box-shadow: 0 25px 50px -12px rgba(0, 0, 0, 0.8), 0 0 24px -6px var(--primary-glow);
      transform: scale(0.95);
      transition: transform 0.25s cubic-bezier(0.16, 1, 0.3, 1);
    }
    .modal-overlay.open .modal-card { transform: scale(1); }

    /* Toast */
    .toast-container {
      position: fixed;
      bottom: 24px;
      right: 24px;
      display: flex;
      flex-direction: column;
      gap: 10px;
      z-index: 10000;
    }
    .toast {
      background: #1c1c28;
      border: 1px solid #323248;
      color: #fff;
      padding: 12px 18px;
      border-radius: 10px;
      font-size: 13px;
      font-weight: 600;
      box-shadow: 0 10px 25px rgba(0,0,0,0.5);
      display: flex;
      align-items: center;
      gap: 10px;
      animation: slideIn 0.25s ease;
    }
    @keyframes slideIn {
      from { transform: translateX(20px); opacity: 0; }
      to { transform: translateX(0); opacity: 1; }
    }
  </style>
</head>
<body>

  <!-- Login Modal -->
  <div id="loginModal" class="modal-overlay open">
    <div class="modal-card">
      <div style="width:54px; height:54px; background:linear-gradient(135deg, #6366f1, #4f46e5); border-radius:14px; display:flex; align-items:center; justify-content:center; font-size:26px; margin:0 auto 16px; box-shadow:0 8px 24px var(--primary-glow);">
        🛡️
      </div>
      <h2 style="font-size:21px; font-weight:800; color:#fff; margin-bottom:6px; letter-spacing:-0.02em;">Esclipse Hub Console</h2>
      <p style="font-size:13px; color:var(--text-muted); margin-bottom:24px;">Please enter your Admin Secret to authenticate.</p>

      <form onsubmit="handleLogin(event)">
        <div class="form-group" style="text-align:left;">
          <input type="password" id="secretInput" class="form-input" placeholder="Enter ADMIN_SECRET password..." autofocus required>
        </div>
        <button type="submit" class="btn btn-primary" style="width:100%; padding:13px;">Unlock Dashboard ➔</button>
      </form>
      <div id="loginError" style="color:var(--danger); font-size:12px; margin-top:12px; display:none; font-weight:600;">Incorrect Admin Secret password!</div>
    </div>
  </div>

  <!-- Confirm Action Modal -->
  <div id="actionModal" class="modal-overlay">
    <div class="modal-card">
      <div id="modalIcon" style="font-size:32px; margin-bottom:12px;">⚠️</div>
      <h3 id="modalTitle" style="font-size:18px; font-weight:800; color:#fff; margin-bottom:8px;">Confirm Action</h3>
      <p id="modalDesc" style="font-size:13px; color:var(--text-muted); line-height:1.5; margin-bottom:24px;">Are you sure?</p>
      <div style="display:flex; gap:10px;">
        <button class="btn btn-secondary" style="flex:1;" onclick="closeModal()">Cancel</button>
        <button id="modalConfirmBtn" class="btn btn-primary" style="flex:1;">Confirm</button>
      </div>
    </div>
  </div>

  <!-- Top Navbar -->
  <div class="navbar">
    <div class="brand">
      <div class="brand-icon">🛡️</div>
      <span>Esclipse Script Hub</span>
      <span class="badge-admin">ADMIN CONSOLE</span>
    </div>
    <div class="nav-actions">
      <div class="live-status">
        <div class="pulse-dot"></div>
        <span>Cloudflare KV Live</span>
      </div>
      <button class="btn btn-secondary btn-sm" onclick="loadDashboard()" title="Refresh Dashboard">🔄 Refresh</button>
      <button class="btn btn-secondary btn-sm" onclick="logout()">Logout</button>
    </div>
  </div>

  <div class="container">
    
    <!-- Bento Grid Metrics -->
    <div class="bento-grid">
      <div class="bento-card" style="--card-glow: rgba(99,102,241,0.15);">
        <div class="bento-header">
          <span class="bento-label">Total Generated Keys</span>
          <div class="bento-icon" style="background:rgba(99,102,241,0.15); color:#a5b4fc;">🔑</div>
        </div>
        <div class="bento-value" id="statTotal">--</div>
        <div class="bento-subtext">All active & stored keys</div>
      </div>

      <div class="bento-card" style="--card-glow: rgba(16,185,129,0.15);">
        <div class="bento-header">
          <span class="bento-label">Active Devices (HWID)</span>
          <div class="bento-icon" style="background:rgba(16,185,129,0.15); color:#34d399;">💻</div>
        </div>
        <div class="bento-value" id="statBound">--</div>
        <div class="bento-subtext" style="color:#10b981;">● Online locked devices</div>
      </div>

      <div class="bento-card" style="--card-glow: rgba(168,85,247,0.15);">
        <div class="bento-header">
          <span class="bento-label">Lifetime VIP Keys</span>
          <div class="bento-icon" style="background:rgba(168,85,247,0.15); color:#c084fc;">👑</div>
        </div>
        <div class="bento-value" id="statLifetime">--</div>
        <div class="bento-subtext">Permanent access accounts</div>
      </div>

      <div class="bento-card" style="--card-glow: rgba(245,158,11,0.15);">
        <div class="bento-header">
          <span class="bento-label">LootLabs Checkpoints</span>
          <div class="bento-icon" style="background:rgba(245,158,11,0.15); color:#fbbf24;">⚡</div>
        </div>
        <div class="bento-value" id="stat24h">--</div>
        <div class="bento-subtext">2-Step monetized users</div>
      </div>
    </div>

    <!-- Segmented Navigation Tabs -->
    <div class="tab-bar">
      <button class="tab-btn active" onclick="switchTab('explorer')">📋 Keys Explorer</button>
      <button class="tab-btn" onclick="switchTab('generator')">⚡ Key Generator</button>
      <button class="tab-btn" onclick="switchTab('security')">🛡️ Security & Anti-Bypass</button>
    </div>

    <!-- TAB 1: Keys Explorer -->
    <div id="tab-explorer" class="tab-content active">
      <div class="panel">
        <div class="panel-header">
          <div class="panel-title">
            <span>Keys Explorer</span>
            <span id="keysCountBadge" class="badge-admin" style="font-size:11px;">0 Keys</span>
          </div>
          <div style="display:flex; gap:12px; align-items:center; flex-wrap:wrap;">
            <div class="filter-chips">
              <span class="chip active" onclick="setFilter('all', this)">All</span>
              <span class="chip" onclick="setFilter('active', this)">Active</span>
              <span class="chip" onclick="setFilter('lifetime', this)">Lifetime</span>
              <span class="chip" onclick="setFilter('unbound', this)">Unbound</span>
              <span class="chip" onclick="setFilter('expired', this)">Expired</span>
            </div>
            <input type="text" id="searchInput" class="form-input" placeholder="🔍 Search key, HWID, note..." style="width:230px; padding:8px 14px;" oninput="filterTable()">
          </div>
        </div>

        <div class="table-wrapper">
          <table>
            <thead>
              <tr>
                <th>Key Code</th>
                <th>Locked HWID</th>
                <th>Status / Duration</th>
                <th>Note / User</th>
                <th style="text-align:right;">Actions</th>
              </tr>
            </thead>
            <tbody id="keysTableBody">
              <tr>
                <td colspan="5" style="text-align:center; color:var(--text-dim); padding:40px;">
                  Connecting to Cloudflare KV database...
                </td>
              </tr>
            </tbody>
          </table>
        </div>
      </div>
    </div>

    <!-- TAB 2: Key Generator -->
    <div id="tab-generator" class="tab-content">
      <div class="generator-grid">
        
        <!-- Left: Form -->
        <div class="panel">
          <div class="panel-title" style="margin-bottom:18px;">⚡ Generate Customized Key</div>

          <div class="form-group">
            <label class="form-label">Duration Preset</label>
            <div class="preset-pills">
              <span class="preset-pill active" onclick="selectPreset(24, this)">24 Hours</span>
              <span class="preset-pill" onclick="selectPreset(168, this)">7 Days</span>
              <span class="preset-pill" onclick="selectPreset(720, this)">30 Days</span>
              <span class="preset-pill" onclick="selectPreset(0, this)">👑 Lifetime (VIP)</span>
              <span class="preset-pill" onclick="selectPreset('custom', this)">Custom Hours</span>
            </div>
            <input type="number" id="customHoursInput" class="form-input" placeholder="Enter hours (e.g. 48)" style="display:none; margin-top:8px;">
          </div>

          <div class="form-group">
            <label class="form-label">Custom Key String (Optional)</label>
            <input type="text" id="customKeyInput" class="form-input" placeholder="e.g. ESCLIPSE-VIP-OWNER (leave empty for auto random)">
          </div>

          <div class="form-group">
            <label class="form-label">Customer / Admin Note</label>
            <input type="text" id="keyNoteInput" class="form-input" placeholder="e.g. Discord: @Hieu#1234 (VIP Client)">
          </div>

          <button class="btn btn-primary" style="width:100%; padding:13px;" onclick="createKey()">
            ✨ Issue License Key Now
          </button>
        </div>

        <!-- Right: Generated Output Card -->
        <div class="panel" style="display:flex; flex-direction:column; justify-content:center; align-items:center; text-align:center;">
          <div id="outputPlaceholder">
            <div style="font-size:42px; margin-bottom:12px; opacity:0.6;">📦</div>
            <div style="font-weight:700; color:#fff; margin-bottom:6px;">Ready to Generate</div>
            <div style="font-size:12.5px; color:var(--text-dim); max-width:240px; line-height:1.5;">
              Select a preset and click generate to create an instant license key.
            </div>
          </div>

          <div id="outputResult" style="display:none; width:100%;">
            <div style="font-size:32px; margin-bottom:10px;">🎉</div>
            <div style="font-size:12px; font-weight:700; color:#10b981; text-transform:uppercase; letter-spacing:0.05em; margin-bottom:6px;">
              Key Generated Successfully!
            </div>
            <div id="newKeyDisplay" class="key-badge" style="font-size:16px; padding:12px 14px; width:100%; display:block; margin-bottom:14px; word-break:break-all;"></div>
            <button class="btn btn-primary" style="width:100%; margin-bottom:8px;" onclick="copyGeneratedKey()">
              📋 Copy Key to Clipboard
            </button>
            <div id="newKeyMeta" style="font-size:12px; color:var(--text-dim);"></div>
          </div>
        </div>

      </div>
    </div>

    <!-- TAB 3: Security & Anti-Bypass Monitor -->
    <div id="tab-security" class="tab-content">
      <div class="panel">
        <div class="panel-title">🛡️ Security & Anti-Bypass Level 3 Architecture</div>
        <p style="font-size:13px; color:var(--text-muted); margin-bottom:24px; line-height:1.6;">
          Your key monetization is protected by our multi-layered defense shield, ensuring zero bypasses and full advertising credit.
        </p>

        <div style="display:grid; grid-template-columns:repeat(auto-fit, minmax(280px, 1fr)); gap:16px;">
          <div class="bento-card">
            <div style="font-size:18px; margin-bottom:8px;">🔒</div>
            <div style="font-weight:700; color:#fff; font-size:14px; margin-bottom:4px;">AES-256 Dynamic Encryptor</div>
            <div style="font-size:12px; color:var(--text-dim); line-height:1.5;">
              Active with official LootLabs API Token. Destination URLs are dynamically encrypted per-session.
            </div>
            <span class="tag tag-active" style="margin-top:12px;">Active & Encrypted</span>
          </div>

          <div class="bento-card">
            <div style="font-size:18px; margin-bottom:8px;">⏱️</div>
            <div style="font-weight:700; color:#fff; font-size:14px; margin-bottom:4px;">Time-Delta Anti-Bot Threshold</div>
            <div style="font-size:12px; color:var(--text-dim); line-height:1.5;">
              Requires minimum 12 seconds per step. Automated 1-2 second bot requests are rejected immediately.
            </div>
            <span class="tag tag-active" style="margin-top:12px;">12s Minimum Barrier</span>
          </div>

          <div class="bento-card">
            <div style="font-size:18px; margin-bottom:8px;">🎟️</div>
            <div style="font-weight:700; color:#fff; font-size:14px; margin-bottom:4px;">Single-Use Cryptographic Nonce</div>
            <div style="font-size:12px; color:var(--text-dim); line-height:1.5;">
              Unique random tokens generated per attempt that auto-expire upon verification (Anti-Replay).
            </div>
            <span class="tag tag-active" style="margin-top:12px;">Auto-Self-Destruct</span>
          </div>
        </div>
      </div>
    </div>

  </div>

  <div id="toastContainer" class="toast-container"></div>

  <script>
    let adminSecret = sessionStorage.getItem("admin_secret") || "";
    let allKeys = [];
    let currentFilter = "all";
    let selectedDuration = 24;

    function showToast(msg, isError = false) {
      const c = document.getElementById("toastContainer");
      const t = document.createElement("div");
      t.className = "toast";
      t.innerHTML = (isError ? "❌ " : "✅ ") + msg;
      if (isError) t.style.borderColor = "#ef4444";
      c.appendChild(t);
      setTimeout(() => {
        t.style.opacity = "0";
        t.style.transition = "opacity 0.3s";
        setTimeout(() => t.remove(), 300);
      }, 2500);
    }

    async function handleLogin(e) {
      if (e) e.preventDefault();
      const sec = document.getElementById("secretInput").value.trim();
      if (!sec) return;

      const res = await fetch("/api/admin/login", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ secret: sec })
      });

      if (res.ok) {
        adminSecret = sec;
        sessionStorage.setItem("admin_secret", sec);
        document.getElementById("loginModal").classList.remove("open");
        document.getElementById("loginError").style.display = "none";
        loadDashboard();
      } else {
        document.getElementById("loginError").style.display = "block";
      }
    }

    function logout() {
      sessionStorage.removeItem("admin_secret");
      adminSecret = "";
      document.getElementById("loginModal").classList.add("open");
      document.getElementById("secretInput").value = "";
    }

    function switchTab(tabId) {
      document.querySelectorAll(".tab-btn").forEach(b => b.classList.remove("active"));
      document.querySelectorAll(".tab-content").forEach(c => c.classList.remove("active"));

      const targetBtn = Array.from(document.querySelectorAll(".tab-btn")).find(b => b.innerText.toLowerCase().includes(tabId.substring(0, 3)));
      if (targetBtn) targetBtn.classList.add("active");
      
      const targetContent = document.getElementById("tab-" + tabId);
      if (targetContent) targetContent.classList.add("active");
    }

    function selectPreset(val, el) {
      selectedDuration = val;
      document.querySelectorAll(".preset-pill").forEach(p => p.classList.remove("active"));
      el.classList.add("active");
      document.getElementById("customHoursInput").style.display = val === "custom" ? "block" : "none";
    }

    async function loadDashboard() {
      if (!adminSecret) {
        document.getElementById("loginModal").classList.add("open");
        return;
      }

      try {
        const res = await fetch("/api/admin/stats-keys", {
          headers: { "X-Admin-Secret": adminSecret }
        });

        if (res.status === 401) {
          logout();
          return;
        }

        const data = await res.json();
        allKeys = data.keys || [];

        // Update Stat Cards with count-up animation
        document.getElementById("statTotal").innerText = data.stats.total || 0;
        document.getElementById("statBound").innerText = data.stats.bound || 0;
        document.getElementById("statLifetime").innerText = data.stats.lifetime || 0;
        document.getElementById("stat24h").innerText = data.stats.checkpoints || 0;
        document.getElementById("keysCountBadge").innerText = allKeys.length + " Keys";

        renderTable(allKeys);
      } catch (err) {
        showToast("Error connecting to server: " + err.message, true);
      }
    }

    function setFilter(filter, el) {
      currentFilter = filter;
      document.querySelectorAll(".chip").forEach(c => c.classList.remove("active"));
      el.classList.add("active");
      filterTable();
    }

    function renderTable(keys) {
      const tbody = document.getElementById("keysTableBody");
      if (!keys || keys.length === 0) {
        tbody.innerHTML = '<tr><td colspan="5" style="text-align:center; color:var(--text-dim); padding:40px;">No matching keys found.</td></tr>';
        return;
      }

      const now = Date.now();
      let html = "";

      for (const k of keys) {
        let statusBadge = "";
        let expiryText = "";

        if (!k.expiresAt || k.expiresAt === 0) {
          statusBadge = '<span class="tag tag-lifetime">👑 Lifetime</span>';
          expiryText = "Permanent License";
        } else if (k.expiresAt < now) {
          statusBadge = '<span class="tag tag-expired">● Expired</span>';
          expiryText = new Date(k.expiresAt).toLocaleDateString();
        } else {
          const hoursLeft = Math.ceil((k.expiresAt - now) / 3600000);
          statusBadge = '<span class="tag tag-active">● Active</span>';
          expiryText = hoursLeft + "h remaining";
        }

        const hwidDisplay = k.hwid
          ? '<span class="hwid-badge" title="' + k.hwid + '">' + k.hwid.substring(0, 12) + '...</span>'
          : '<span style="color:var(--text-dim); font-size:12px; font-style:italic;">Unbound (First Device Locks)</span>';

        html += \`
          <tr>
            <td>
              <span class="key-badge">\${k.key}</span>
            </td>
            <td>\${hwidDisplay}</td>
            <td>
              \${statusBadge}
              <div style="font-size:11.5px; color:var(--text-dim); margin-top:3px;">\${expiryText}</div>
            </td>
            <td style="color:var(--text-muted); font-size:12.5px;">\${k.note || "-"}</td>
            <td style="text-align:right;">
              <button class="btn btn-secondary btn-sm" onclick="copyText('\${k.key}')" title="Copy Key">📋</button>
              \${k.hwid ? \`<button class="btn btn-secondary btn-sm" onclick="promptResetHwid('\${k.key}')" title="Reset HWID">🔄</button>\` : ''}
              <button class="btn btn-danger btn-sm" onclick="promptDeleteKey('\${k.key}')" title="Revoke Key">🗑️</button>
            </td>
          </tr>
        \`;
      }

      tbody.innerHTML = html;
    }

    function filterTable() {
      const q = document.getElementById("searchInput").value.toLowerCase().trim();
      const now = Date.now();

      let filtered = allKeys.filter(k => {
        // Status filter
        if (currentFilter === "active") {
          return k.expiresAt > now || !k.expiresAt;
        }
        if (currentFilter === "lifetime") {
          return !k.expiresAt || k.expiresAt === 0;
        }
        if (currentFilter === "unbound") {
          return !k.hwid;
        }
        if (currentFilter === "expired") {
          return k.expiresAt && k.expiresAt < now;
        }
        return true;
      });

      if (q) {
        filtered = filtered.filter(k => 
          (k.key && k.key.toLowerCase().includes(q)) ||
          (k.note && k.note.toLowerCase().includes(q)) ||
          (k.hwid && k.hwid.toLowerCase().includes(q))
        );
      }

      renderTable(filtered);
    }

    async function createKey() {
      let duration = selectedDuration;
      if (duration === "custom") {
        duration = Number(document.getElementById("customHoursInput").value) || 24;
      }

      const customKey = document.getElementById("customKeyInput").value.trim();
      const note = document.getElementById("keyNoteInput").value.trim() || "Admin Key";

      const res = await fetch("/api/admin/create-key", {
        method: "POST",
        headers: {
          "Content-Type": "application/json",
          "X-Admin-Secret": adminSecret
        },
        body: JSON.stringify({ durationHours: duration, customKey, note })
      });

      const data = await res.json();
      if (data.success) {
        showToast("Key generated successfully!");
        document.getElementById("outputPlaceholder").style.display = "none";
        document.getElementById("outputResult").style.display = "block";
        document.getElementById("newKeyDisplay").innerText = data.key;
        document.getElementById("newKeyMeta").innerText = (duration === 0 ? "Lifetime VIP" : duration + " Hours") + " • " + note;
        loadDashboard();
      } else {
        showToast(data.message || "Failed to generate key", true);
      }
    }

    function copyGeneratedKey() {
      const k = document.getElementById("newKeyDisplay").innerText;
      copyText(k);
    }

    function copyText(txt) {
      navigator.clipboard.writeText(txt);
      showToast("Copied: " + txt);
    }

    function openModal({ icon, title, desc, onConfirm, isDanger = false }) {
      const modal = document.getElementById("actionModal");
      document.getElementById("modalIcon").innerText = icon || "⚠️";
      document.getElementById("modalTitle").innerText = title;
      document.getElementById("modalDesc").innerText = desc;
      const confirmBtn = document.getElementById("modalConfirmBtn");
      confirmBtn.className = isDanger ? "btn btn-danger" : "btn btn-primary";
      confirmBtn.onclick = () => {
        closeModal();
        onConfirm();
      };
      modal.classList.add("open");
    }

    function closeModal() {
      document.getElementById("actionModal").classList.remove("open");
    }

    function promptResetHwid(key) {
      openModal({
        icon: "🔄",
        title: "Reset Device Binding",
        desc: "Are you sure you want to unbind HWID for key " + key + "? The next player to use it will lock to their device.",
        onConfirm: async () => {
          const res = await fetch("/api/admin/reset-hwid", {
            method: "POST",
            headers: { "Content-Type": "application/json", "X-Admin-Secret": adminSecret },
            body: JSON.stringify({ key })
          });
          const data = await res.json();
          showToast(data.message || "HWID Reset!");
          loadDashboard();
        }
      });
    }

    function promptDeleteKey(key) {
      openModal({
        icon: "🗑️",
        title: "Revoke License Key",
        desc: "Are you sure you want to permanently DELETE key " + key + "? This player will be disconnected immediately.",
        isDanger: true,
        onConfirm: async () => {
          const res = await fetch("/api/admin/delete-key", {
            method: "POST",
            headers: { "Content-Type": "application/json", "X-Admin-Secret": adminSecret },
            body: JSON.stringify({ key })
          });
          const data = await res.json();
          showToast(data.message || "Key Deleted!");
          loadDashboard();
        }
      });
    }

    // Auto load on init if session exists
    if (adminSecret) {
      document.getElementById("loginModal").classList.remove("open");
      loadDashboard();
    }
  </script>
</body>
</html>`;
}

// =========================================================================
// 5. MAIN WORKER LOGIC
// =========================================================================
export default {
  async fetch(request, env, ctx) {
    if (request.method === "OPTIONS") {
      return new Response(null, { status: 204, headers: corsHeaders });
    }

    const url = new URL(request.url);
    const pathname = url.pathname;
    const KV = env.KEYS_KV;
    const ADMIN_SECRET = env.ADMIN_SECRET || "EsclipseSecret2026";
    const workerOrigin = url.origin;
    const clientIp = getClientIp(request);

    // -------------------------------------------------------------
    // Health / Status API
    // -------------------------------------------------------------
    if (pathname === "/" || pathname === "/health") {
      return jsonResponse({
        service: "EsclipseScriptHub Key Authentication API",
        status: "Online",
        version: "3.0.0",
        provider: MONETIZATION_CONFIG.provider,
        adminDashboard: `${workerOrigin}/admin`,
        antiBypass: "Level 3 (AES-256 + Time-Delta + Single-Use Nonce)",
        timestamp: new Date().toISOString(),
      });
    }

    // -------------------------------------------------------------
    // GET /admin (Serve Web Admin Dashboard)
    // -------------------------------------------------------------
    if (pathname === "/admin") {
      return new Response(renderAdminDashboardHtml(), {
        headers: { "Content-Type": "text/html;charset=UTF-8" },
      });
    }

    // -------------------------------------------------------------
    // POST /api/admin/login (Verify Admin Password)
    // -------------------------------------------------------------
    if (pathname === "/api/admin/login" && request.method === "POST") {
      let body = {};
      try { body = await request.json(); } catch {}
      if (body.secret === ADMIN_SECRET) {
        return jsonResponse({ success: true, message: "Authorized" });
      }
      return jsonResponse({ success: false, message: "Invalid secret" }, 401);
    }

    // -------------------------------------------------------------
    // GET /getkey (User Get Key Landing / Checkpoint Page)
    // -------------------------------------------------------------
    if (pathname === "/getkey") {
      const hwid = url.searchParams.get("hwid") || "Unknown";

      // 1. If valid HWID is passed, check if they ALREADY have an active key
      if (KV && hwid && hwid !== "Unknown") {
        const existingKey = await KV.get(`hwid:${hwid}`);
        if (existingKey) {
          const recordRaw = await KV.get(`key:${existingKey}`);
          if (recordRaw) {
            try {
              const keyData = JSON.parse(recordRaw);
              const now = Date.now();
              if (!keyData.expiresAt || keyData.expiresAt > now) {
                // Key is active! Display existing key directly
                const hoursLeft = keyData.expiresAt
                  ? Math.max(1, Math.ceil((keyData.expiresAt - now) / 3600000)) + " hours"
                  : "Lifetime";

                return new Response(
                  renderActiveKeyHtml({
                    hwid,
                    key: existingKey,
                    timeLeftFormatted: hoursLeft,
                  }),
                  { headers: { "Content-Type": "text/html;charset=UTF-8" } }
                );
              }
            } catch (e) {}
          }
        }

        // 2. Check if user already finished Step 1 and is on Step 2
        const progress = await KV.get(`progress:${hwid}`);
        if (progress === "1") {
          const providerDisplayName =
            MONETIZATION_CONFIG.provider === "lootlabs"
              ? "LootLabs"
              : MONETIZATION_CONFIG.provider === "workink"
              ? "Work.ink"
              : "Direct";

          const link2 =
            MONETIZATION_CONFIG.provider === "lootlabs"
              ? MONETIZATION_CONFIG.lootlabs.links[1]
              : MONETIZATION_CONFIG.workink.links[1];

          const isConfigured =
            MONETIZATION_CONFIG.provider === "direct" ||
            (link2 && !link2.includes("PASTE_"));

          const startUrl = `/api/checkpoint/start?step=2&hwid=${encodeURIComponent(hwid)}`;

          return new Response(
            renderStep2Html({
              hwid,
              providerName: providerDisplayName,
              startUrl,
              isConfigured,
            }),
            { headers: { "Content-Type": "text/html;charset=UTF-8" } }
          );
        }
      }

      // 3. User is on Step 1
      const provider = MONETIZATION_CONFIG.provider;
      const isLootlabs = provider === "lootlabs";
      const isWorkink = provider === "workink";
      const isDirect = provider === "direct";

      const link1 = isLootlabs
        ? MONETIZATION_CONFIG.lootlabs.links[0]
        : isWorkink
        ? MONETIZATION_CONFIG.workink.links[0]
        : "direct";

      const isConfigured =
        isDirect || (link1 && !link1.includes("PASTE_"));

      const providerDisplayName = isLootlabs
        ? "LootLabs"
        : isWorkink
        ? "Work.ink"
        : "Direct";

      const startUrl = `/api/checkpoint/start?step=1&hwid=${encodeURIComponent(hwid)}`;

      return new Response(
        renderStep1Html({
          hwid,
          providerName: providerDisplayName,
          startUrl,
          isConfigured,
        }),
        { headers: { "Content-Type": "text/html;charset=UTF-8" } }
      );
    }

    // -------------------------------------------------------------
    // GET /api/checkpoint/start (Generates Nonce, Starts Timer, Redirects to LootLabs)
    // -------------------------------------------------------------
    if (pathname === "/api/checkpoint/start") {
      const hwid = url.searchParams.get("hwid") || "Unknown";
      const step = Number(url.searchParams.get("step") || 1);
      const provider = MONETIZATION_CONFIG.provider;

      if (!KV) return new Response("KV missing", { status: 500 });

      // Generate a cryptographic single-use nonce for this checkpoint attempt
      const nonceToken = generateRandomToken(`step${step}`);
      const startTime = Date.now();

      // Store nonce and start timestamp in KV (Expires in 10 minutes)
      const noncePayload = JSON.stringify({
        hwid,
        step,
        startedAt: startTime,
        clientIp,
      });

      await KV.put(`nonce:${nonceToken}`, noncePayload, {
        expirationTtl: MONETIZATION_CONFIG.tokenTimeoutSeconds || 600,
      });
      await KV.put(`start_time:${hwid}:${step}`, startTime.toString(), {
        expirationTtl: 600,
      });
      await KV.put(`temp_ip:${clientIp}`, hwid, { expirationTtl: 3600 });

      const cookieHeader = `esclipse_hwid=${encodeURIComponent(
        hwid
      )}; Path=/; Max-Age=7200; SameSite=Lax; Secure`;

      // Option A: Direct bypass for developer testing
      if (provider === "direct") {
        const nextUrl =
          step === 1
            ? `${workerOrigin}/api/checkpoint/step/1?hwid=${encodeURIComponent(
                hwid
              )}&token=${nonceToken}`
            : `${workerOrigin}/api/checkpoint/complete?hwid=${encodeURIComponent(
                hwid
              )}&token=${nonceToken}`;

        return new Response(null, {
          status: 302,
          headers: {
            Location: nextUrl,
            "Set-Cookie": cookieHeader,
          },
        });
      }

      // Option B: LootLabs with Dynamic AES-256 Anti-Bypass
      if (provider === "lootlabs") {
        const { links, apiToken } = MONETIZATION_CONFIG.lootlabs;
        const targetLink = step === 1 ? links[0] : links[1];

        if (!targetLink || targetLink.includes("PASTE_")) {
          return new Response(
            `LootLabs Link for Checkpoint ${step} is not configured yet!`,
            { status: 400 }
          );
        }

        // Destination URL includes HWID, step and single-use cryptographic nonce
        const destinationUrl =
          step === 1
            ? `${workerOrigin}/api/checkpoint/step/1?hwid=${encodeURIComponent(
                hwid
              )}&token=${nonceToken}`
            : `${workerOrigin}/api/checkpoint/complete?hwid=${encodeURIComponent(
                hwid
              )}&token=${nonceToken}`;

        // Encrypt destination URL via LootLabs Official API
        const encryptedData = await encryptLootlabsUrl(destinationUrl, apiToken);

        if (encryptedData) {
          const secureTarget = `${targetLink}${
            targetLink.includes("?") ? "&" : "?"
          }data=${encodeURIComponent(encryptedData)}`;

          return new Response(null, {
            status: 302,
            headers: {
              Location: secureTarget,
              "Set-Cookie": cookieHeader,
            },
          });
        }

        // Fallback
        const fallbackTarget = `${targetLink}${
          targetLink.includes("?") ? "&" : "?"
        }puid=${encodeURIComponent(hwid)}&token=${nonceToken}`;

        return new Response(null, {
          status: 302,
          headers: {
            Location: fallbackTarget,
            "Set-Cookie": cookieHeader,
          },
        });
      }

      // Option C: Work.ink
      if (provider === "workink") {
        const { links } = MONETIZATION_CONFIG.workink;
        const targetLink = step === 1 ? links[0] : links[1];
        return new Response(null, {
          status: 302,
          headers: {
            Location: targetLink,
            "Set-Cookie": cookieHeader,
          },
        });
      }

      return new Response("Unknown provider configuration", { status: 400 });
    }

    // -------------------------------------------------------------
    // GET /api/checkpoint/step/1 (Destination URL of Checkpoint 1)
    // -------------------------------------------------------------
    if (pathname === "/api/checkpoint/step/1") {
      if (!KV) return new Response("KV missing", { status: 500 });

      let hwid = url.searchParams.get("hwid") || url.searchParams.get("puid");
      const token = url.searchParams.get("token");

      if (!hwid || hwid === "Unknown") {
        hwid = getCookie(request, "esclipse_hwid");
      }
      if (!hwid || hwid === "Unknown") {
        hwid = await KV.get(`temp_ip:${clientIp}`);
      }

      if (!hwid || hwid === "Unknown") {
        return new Response(renderClaimHtml(), {
          headers: { "Content-Type": "text/html;charset=UTF-8" },
        });
      }

      const now = Date.now();
      const minSeconds = MONETIZATION_CONFIG.minCompletionSeconds || 12;

      // Time-Delta Anti-Bypass Check
      let startedAt = 0;
      if (token) {
        const nonceRaw = await KV.get(`nonce:${token}`);
        if (nonceRaw) {
          try {
            const parsed = JSON.parse(nonceRaw);
            startedAt = parsed.startedAt || 0;
            await KV.delete(`nonce:${token}`);
          } catch (e) {}
        }
      }

      if (!startedAt) {
        const fallbackStart = await KV.get(`start_time:${hwid}:1`);
        if (fallbackStart) startedAt = Number(fallbackStart);
      }

      if (startedAt > 0) {
        const elapsedSeconds = (now - startedAt) / 1000;
        if (elapsedSeconds < minSeconds && MONETIZATION_CONFIG.provider !== "direct") {
          return new Response(
            renderBypassWarningHtml({
              hwid,
              elapsedSeconds: elapsedSeconds.toFixed(1),
              minSeconds,
              retryUrl: `/api/checkpoint/start?step=1&hwid=${encodeURIComponent(hwid)}`,
            }),
            { headers: { "Content-Type": "text/html;charset=UTF-8" }, status: 403 }
          );
        }
      }

      await KV.put(`progress:${hwid}`, "1", {
        expirationTtl: MONETIZATION_CONFIG.stepTimeoutSeconds || 3600,
      });
      await KV.delete(`start_time:${hwid}:1`);

      const providerDisplayName =
        MONETIZATION_CONFIG.provider === "lootlabs"
          ? "LootLabs"
          : MONETIZATION_CONFIG.provider === "workink"
          ? "Work.ink"
          : "Direct";

      const link2 =
        MONETIZATION_CONFIG.provider === "lootlabs"
          ? MONETIZATION_CONFIG.lootlabs.links[1]
          : MONETIZATION_CONFIG.workink.links[1];

      const isConfigured =
        MONETIZATION_CONFIG.provider === "direct" ||
        (link2 && !link2.includes("PASTE_"));

      const startUrl = `/api/checkpoint/start?step=2&hwid=${encodeURIComponent(hwid)}`;

      return new Response(
        renderStep2Html({
          hwid,
          providerName: providerDisplayName,
          startUrl,
          isConfigured,
        }),
        { headers: { "Content-Type": "text/html;charset=UTF-8" } }
      );
    }

    // -------------------------------------------------------------
    // GET /api/checkpoint/complete (Destination URL of Checkpoint 2)
    // -------------------------------------------------------------
    if (pathname === "/api/checkpoint/complete") {
      if (!KV) {
        return new Response("KV database binding missing", { status: 500 });
      }

      let hwid = url.searchParams.get("hwid") || url.searchParams.get("puid");
      const token = url.searchParams.get("token");

      if (!hwid || hwid === "Unknown") {
        hwid = getCookie(request, "esclipse_hwid");
      }
      if (!hwid || hwid === "Unknown") {
        hwid = await KV.get(`temp_ip:${clientIp}`);
      }

      if (!hwid || hwid === "Unknown") {
        return new Response(renderClaimHtml(), {
          headers: { "Content-Type": "text/html;charset=UTF-8" },
        });
      }

      // Anti-Bypass Check 1: Enforce Step 1 was completed
      if (MONETIZATION_CONFIG.provider !== "direct") {
        const progress = await KV.get(`progress:${hwid}`);
        if (progress !== "1") {
          return Response.redirect(`${workerOrigin}/getkey?hwid=${encodeURIComponent(hwid)}`, 302);
        }
      }

      const now = Date.now();
      const minSeconds = MONETIZATION_CONFIG.minCompletionSeconds || 12;

      // Anti-Bypass Check 2: Time-Delta Check for Step 2
      let startedAt = 0;
      if (token) {
        const nonceRaw = await KV.get(`nonce:${token}`);
        if (nonceRaw) {
          try {
            const parsed = JSON.parse(nonceRaw);
            startedAt = parsed.startedAt || 0;
            await KV.delete(`nonce:${token}`);
          } catch (e) {}
        }
      }

      if (!startedAt) {
        const fallbackStart = await KV.get(`start_time:${hwid}:2`);
        if (fallbackStart) startedAt = Number(fallbackStart);
      }

      if (startedAt > 0) {
        const elapsedSeconds = (now - startedAt) / 1000;
        if (elapsedSeconds < minSeconds && MONETIZATION_CONFIG.provider !== "direct") {
          return new Response(
            renderBypassWarningHtml({
              hwid,
              elapsedSeconds: elapsedSeconds.toFixed(1),
              minSeconds,
              retryUrl: `/api/checkpoint/start?step=2&hwid=${encodeURIComponent(hwid)}`,
            }),
            { headers: { "Content-Type": "text/html;charset=UTF-8" }, status: 403 }
          );
        }
      }

      const durationHours = MONETIZATION_CONFIG.keyDurationHours || 24;
      const ttlSeconds = durationHours * 3600;

      // Check if this HWID already has an active key
      const existingKey = await KV.get(`hwid:${hwid}`);
      let keyToAward = existingKey;
      let expiresAt = 0;

      if (existingKey) {
        const recordRaw = await KV.get(`key:${existingKey}`);
        if (recordRaw) {
          try {
            const keyData = JSON.parse(recordRaw);
            if (!keyData.expiresAt || keyData.expiresAt > now) {
              keyToAward = existingKey;
              expiresAt = keyData.expiresAt;
            } else {
              keyToAward = null;
            }
          } catch (e) {
            keyToAward = null;
          }
        } else {
          keyToAward = null;
        }
      }

      // If no active key exists, generate a brand new one pre-bound to this HWID!
      if (!keyToAward) {
        keyToAward = generateRandomKey();
        expiresAt = now + durationHours * 3600 * 1000;

        const keyData = {
          key: keyToAward,
          hwid: hwid,
          createdAt: now,
          expiresAt: expiresAt,
          durationHours: durationHours,
          note: `2-Step Anti-Bypass Key (${MONETIZATION_CONFIG.provider})`,
          timesUsed: 0,
        };

        await KV.put(`key:${keyToAward}`, JSON.stringify(keyData), {
          expirationTtl: ttlSeconds,
        });
        await KV.put(`hwid:${hwid}`, keyToAward, {
          expirationTtl: ttlSeconds,
        });

        await KV.delete(`progress:${hwid}`);
        await KV.delete(`start_time:${hwid}:2`);
      }

      const hoursLeft = expiresAt
        ? Math.max(1, Math.ceil((expiresAt - now) / 3600000)) + " hours"
        : "24 hours";

      return new Response(
        renderCompletedHtml({
          hwid,
          key: keyToAward,
          timeLeftFormatted: hoursLeft,
        }),
        { headers: { "Content-Type": "text/html;charset=UTF-8" } }
      );
    }

    // -------------------------------------------------------------
    // POST /api/verify (Roblox Client Key Verification)
    // -------------------------------------------------------------
    if (pathname === "/api/verify" && request.method === "POST") {
      if (!KV) {
        return jsonResponse(
          { success: false, message: "KV Database not configured on worker" },
          500
        );
      }

      let body;
      try {
        body = await request.json();
      } catch (err) {
        return jsonResponse({ success: false, message: "Invalid JSON body" }, 400);
      }

      const rawKey = body.key;
      const hwid = body.hwid;
      const username = body.username || "Unknown";
      const userId = body.userId || 0;

      if (!rawKey || typeof rawKey !== "string" || !hwid) {
        return jsonResponse(
          { success: false, message: "Key and HWID are required" },
          400
        );
      }

      const key = rawKey.trim().toUpperCase();
      const kvKey = `key:${key}`;

      const recordRaw = await KV.get(kvKey);
      if (!recordRaw) {
        return jsonResponse({
          success: false,
          message: "Key does not exist or has expired! Please get a new key.",
        });
      }

      let keyData;
      try {
        keyData = JSON.parse(recordRaw);
      } catch {
        return jsonResponse({ success: false, message: "Corrupted key data" }, 500);
      }

      const now = Date.now();

      // 1. Check Expiration
      if (keyData.expiresAt && keyData.expiresAt > 0 && now > keyData.expiresAt) {
        await KV.delete(kvKey);
        if (keyData.hwid) await KV.delete(`hwid:${keyData.hwid}`);
        return jsonResponse({
          success: false,
          message: "This key has expired! Please get a new key.",
        });
      }

      // 2. Check HWID Binding
      if (!keyData.hwid) {
        keyData.hwid = hwid;
        keyData.boundAt = now;
        keyData.firstUser = `${username} (${userId})`;
      } else if (keyData.hwid !== hwid) {
        return jsonResponse({
          success: false,
          message: "Key is already bound to a different device (HWID mismatch)!",
        });
      }

      // 3. Update usage stats
      keyData.timesUsed = (keyData.timesUsed || 0) + 1;
      keyData.lastUsed = now;
      keyData.lastUser = `${username} (${userId})`;

      let ttlSeconds = undefined;
      if (keyData.expiresAt && keyData.expiresAt > now) {
        ttlSeconds = Math.max(60, Math.floor((keyData.expiresAt - now) / 1000));
      }

      await KV.put(kvKey, JSON.stringify(keyData), {
        expirationTtl: ttlSeconds,
      });
      await KV.put(`hwid:${hwid}`, key, {
        expirationTtl: ttlSeconds,
      });

      const daysLeft = keyData.expiresAt
        ? Math.ceil((keyData.expiresAt - now) / (1000 * 60 * 60 * 24))
        : "Lifetime";

      // 4. Fetch script payload from KV (Secure delivery)
      let scriptPayload = null;
      if (body.returnPayload !== false) {
        scriptPayload = await KV.get("script:payload");
      }

      return jsonResponse({
        success: true,
        message: "Key verified successfully!",
        expiresAt: keyData.expiresAt,
        daysLeft: daysLeft,
        payload: scriptPayload,
      });
    }

    // -------------------------------------------------------------
    // Admin API Authentication Middleware
    // -------------------------------------------------------------
    const clientSecret = request.headers.get("X-Admin-Secret");
    const isAdminPath =
      pathname.startsWith("/api/admin/") ||
      pathname === "/api/create-key" ||
      pathname === "/api/reset-hwid";

    // Allow login endpoint without prior secret
    if (isAdminPath && pathname !== "/api/admin/login") {
      if (!clientSecret || clientSecret !== ADMIN_SECRET) {
        return jsonResponse(
          { success: false, message: "Unauthorized (Invalid Admin Secret)" },
          401
        );
      }
    }

    // -------------------------------------------------------------
    // GET /api/admin/stats-keys (Fetch Metrics & All Keys for Dashboard)
    // -------------------------------------------------------------
    if (pathname === "/api/admin/stats-keys" && request.method === "GET") {
      if (!KV) return jsonResponse({ success: false, message: "KV missing" }, 500);

      // List keys from KV
      const list = await KV.list({ prefix: "key:", limit: 100 });
      const keysList = [];
      let boundCount = 0;
      let lifetimeCount = 0;
      let checkpointCount = 0;

      for (const k of list.keys) {
        const raw = await KV.get(k.name);
        if (raw) {
          try {
            const data = JSON.parse(raw);
            keysList.push(data);
            if (data.hwid) boundCount++;
            if (!data.expiresAt || data.expiresAt === 0) lifetimeCount++;
            if (data.note && data.note.includes("Checkpoint")) checkpointCount++;
          } catch (e) {}
        }
      }

      // Sort newest first
      keysList.sort((a, b) => (b.createdAt || 0) - (a.createdAt || 0));

      return jsonResponse({
        success: true,
        stats: {
          total: keysList.length,
          bound: boundCount,
          lifetime: lifetimeCount,
          checkpoints: checkpointCount,
        },
        keys: keysList,
      });
    }

    // -------------------------------------------------------------
    // POST /api/admin/create-key (Admin: Generate New Keys)
    // -------------------------------------------------------------
    if (
      (pathname === "/api/create-key" || pathname === "/api/admin/create-key") &&
      request.method === "POST"
    ) {
      if (!KV) return jsonResponse({ success: false, message: "KV missing" }, 500);

      let body = {};
      try { body = await request.json(); } catch {}

      const durationHours = body.durationHours !== undefined ? Number(body.durationHours) : 24;
      const note = body.note || "Admin Key";
      const customKey = body.customKey ? String(body.customKey).trim().toUpperCase() : null;
      const key = customKey || generateRandomKey();

      const now = Date.now();
      const expiresAt = durationHours > 0 ? now + durationHours * 3600 * 1000 : 0;

      const keyData = {
        key: key,
        hwid: null,
        createdAt: now,
        expiresAt: expiresAt,
        durationHours: durationHours,
        note: note,
        timesUsed: 0,
      };

      const kvKey = `key:${key}`;
      let ttlSeconds = undefined;
      if (expiresAt > now) {
        ttlSeconds = Math.max(60, Math.floor((expiresAt - now) / 1000));
      }

      await KV.put(kvKey, JSON.stringify(keyData), {
        expirationTtl: ttlSeconds,
      });

      return jsonResponse({
        success: true,
        message: "Key generated successfully!",
        key: key,
        expiresAt: expiresAt,
        durationHours: durationHours,
        note: note,
      });
    }

    // -------------------------------------------------------------
    // POST /api/admin/reset-hwid (Admin: Reset HWID for a Key)
    // -------------------------------------------------------------
    if (
      (pathname === "/api/reset-hwid" || pathname === "/api/admin/reset-hwid") &&
      request.method === "POST"
    ) {
      if (!KV) return jsonResponse({ success: false, message: "KV missing" }, 500);

      let body = {};
      try { body = await request.json(); } catch {}

      const key = body.key ? String(body.key).trim().toUpperCase() : null;
      if (!key) return jsonResponse({ success: false, message: "Key required" }, 400);

      const kvKey = `key:${key}`;
      const recordRaw = await KV.get(kvKey);
      if (!recordRaw) return jsonResponse({ success: false, message: "Key not found" }, 404);

      const keyData = JSON.parse(recordRaw);
      const oldHwid = keyData.hwid;
      keyData.hwid = null;

      await KV.put(kvKey, JSON.stringify(keyData));
      if (oldHwid) await KV.delete(`hwid:${oldHwid}`);

      return jsonResponse({
        success: true,
        message: `HWID for key ${key} has been reset successfully!`,
      });
    }

    // -------------------------------------------------------------
    // POST /api/admin/delete-key (Admin: Revoke / Delete a Key)
    // -------------------------------------------------------------
    if (pathname === "/api/admin/delete-key" && request.method === "POST") {
      if (!KV) return jsonResponse({ success: false, message: "KV missing" }, 500);

      let body = {};
      try { body = await request.json(); } catch {}

      const key = body.key ? String(body.key).trim().toUpperCase() : null;
      if (!key) return jsonResponse({ success: false, message: "Key required" }, 400);

      const kvKey = `key:${key}`;
      const recordRaw = await KV.get(kvKey);
      if (recordRaw) {
        try {
          const keyData = JSON.parse(recordRaw);
          if (keyData.hwid) await KV.delete(`hwid:${keyData.hwid}`);
        } catch (e) {}
      }

      await KV.delete(kvKey);

      return jsonResponse({
        success: true,
        message: `Key ${key} has been permanently deleted!`,
      });
    }

    // -------------------------------------------------------------
    // POST /api/admin/upload-script (Admin: Upload/Update Script Payload)
    // -------------------------------------------------------------
    if (pathname === "/api/admin/upload-script" && request.method === "POST") {
      if (!KV) return jsonResponse({ success: false, message: "KV missing" }, 500);

      let scriptText = "";
      const contentType = request.headers.get("content-type") || "";
      if (contentType.includes("application/json")) {
        try {
          const body = await request.json();
          scriptText = body.script || body.payload || "";
        } catch {
          return jsonResponse({ success: false, message: "Invalid JSON" }, 400);
        }
      } else {
        scriptText = await request.text();
      }

      if (!scriptText || scriptText.trim().length === 0) {
        return jsonResponse({ success: false, message: "Script payload is empty" }, 400);
      }

      const now = Date.now();
      await KV.put("script:payload", scriptText);
      const meta = {
        size: scriptText.length,
        sizeFormatted: `${(scriptText.length / 1024).toFixed(2)} KB`,
        updatedAt: now,
        updatedAtIso: new Date(now).toISOString(),
      };
      await KV.put("script:meta", JSON.stringify(meta));

      return jsonResponse({
        success: true,
        message: "Script payload uploaded successfully!",
        meta,
      });
    }

    // -------------------------------------------------------------
    // GET /api/admin/script-info (Admin: Get Script Payload Metadata)
    // -------------------------------------------------------------
    if (pathname === "/api/admin/script-info" && request.method === "GET") {
      if (!KV) return jsonResponse({ success: false, message: "KV missing" }, 500);

      const metaRaw = await KV.get("script:meta");
      let meta = null;
      if (metaRaw) {
        try { meta = JSON.parse(metaRaw); } catch {}
      }

      return jsonResponse({
        success: true,
        hasScript: meta !== null,
        meta: meta || { size: 0, updatedAt: 0 },
      });
    }

    // 404 Fallback
    return jsonResponse({ success: false, message: "Endpoint not found" }, 404);
  },
};
