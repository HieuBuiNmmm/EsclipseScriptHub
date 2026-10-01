/**
 * Cloudflare Worker - Luarmor-style Key System Backend for EsclipseScriptHub
 * 
 * Features:
 * - Hardware ID (HWID) Device Binding (First device locks key)
 * - Expiration Time Validation (24h, 7 days, Lifetime, etc.)
 * - Admin Key Generator API (Secured with ADMIN_SECRET)
 * - Reset HWID / Delete Key APIs
 * - CORS-enabled for Roblox executors
 */

// Helper: Standard CORS headers
const corsHeaders = {
  "Access-Control-Allow-Origin": "*",
  "Access-Control-Allow-Methods": "GET, POST, OPTIONS",
  "Access-Control-Allow-Headers": "Content-Type, Authorization, X-Admin-Secret",
};

// Helper: JSON Response
function jsonResponse(data, status = 200) {
  return new Response(JSON.stringify(data), {
    status,
    headers: {
      "Content-Type": "application/json",
      ...corsHeaders,
    },
  });
}

// Helper: Random Key Generator (e.g. ESCLIPSE-A9F3-88B1-C42E)
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

export default {
  async fetch(request, env, ctx) {
    // 1. Handle CORS Preflight
    if (request.method === "OPTIONS") {
      return new Response(null, { status: 204, headers: corsHeaders });
    }

    const url = new URL(request.url);
    const pathname = url.pathname;

    // Cloudflare KV Namespace binding
    // Ensure you create KV namespace and bind it as 'KEYS_KV' in Cloudflare dashboard
    const KV = env.KEYS_KV;
    const ADMIN_SECRET = env.ADMIN_SECRET || "CHANGE_THIS_ADMIN_SECRET_123456";

    // -------------------------------------------------------------
    // GET / (Home / Landing Page)
    // -------------------------------------------------------------
    if (pathname === "/" || pathname === "/health") {
      return jsonResponse({
        service: "EsclipseScriptHub Key Authentication API",
        status: "Online",
        version: "1.0.0",
        timestamp: new Date().toISOString(),
      });
    }

    // -------------------------------------------------------------
    // GET /getkey (User Get Key Landing / Checkpoint Page)
    // -------------------------------------------------------------
    if (pathname === "/getkey") {
      const hwid = url.searchParams.get("hwid") || "Unknown";
      
      // Optional: If you use LootLabs / Linkvertise / Work.ink:
      // Replace with your advertising checkpoint link:
      // const checkpointUrl = `https://loot-link.com/s?xxxx&custom=${hwid}`;
      // return Response.redirect(checkpointUrl, 302);

      const html = `<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Esclipse Script Hub • Get Key</title>
  <style>
    body {
      margin: 0; padding: 0; background: #0f0f12; color: #fff;
      font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, sans-serif;
      display: flex; justify-content: center; align-items: center; min-height: 100vh;
    }
    .card {
      background: #18181e; border: 1px solid #2d2d38; border-radius: 12px;
      padding: 32px; max-width: 420px; width: 90%; text-align: center;
      box-shadow: 0 10px 30px rgba(0,0,0,0.5);
    }
    h1 { font-size: 22px; margin-bottom: 8px; color: #fff; }
    p { font-size: 14px; color: #9d9da8; margin-bottom: 24px; line-height: 1.5; }
    .badge {
      display: inline-block; background: #252532; border: 1px solid #3d3d4e;
      padding: 6px 12px; border-radius: 6px; font-family: monospace; font-size: 12px;
      color: #a5b4fc; margin-bottom: 20px; word-break: break-all;
    }
    .btn {
      display: block; width: 100%; box-sizing: border-box; background: #6366f1;
      color: white; border: none; padding: 12px 20px; border-radius: 8px;
      font-size: 15px; font-weight: 600; cursor: pointer; text-decoration: none;
      transition: background 0.2s;
    }
    .btn:hover { background: #4f46e5; }
    .footer { margin-top: 20px; font-size: 12px; color: #626270; }
  </style>
</head>
<body>
  <div class="card">
    <h1>🛡️ Esclipse Script Hub</h1>
    <p>Complete the key checkpoint to unlock access to all features in EsclipseScriptHub.</p>
    <div class="badge">HWID: ${hwid}</div>
    <!-- Replace this href with your LootLabs / Linkvertise link -->
    <a href="#" class="btn" onclick="alert('Connect your Linkvertise or LootLabs link here!')">Complete Checkpoint</a>
    <div class="footer">Esclipse Hub • Protected by Luarmor-style Key System</div>
  </div>
</body>
</html>`;

      return new Response(html, {
        headers: { "Content-Type": "text/html;charset=UTF-8" },
      });
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

      // Fetch key record from Cloudflare KV
      const recordRaw = await KV.get(kvKey);
      if (!recordRaw) {
        return jsonResponse({
          success: false,
          message: "Key does not exist or has expired!",
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
        // Automatically clean up expired key
        await KV.delete(kvKey);
        return jsonResponse({
          success: false,
          message: "This key has expired! Please get a new key.",
        });
      }

      // 2. Check HWID Binding (First time binds, subsequent times validates)
      if (!keyData.hwid) {
        // First device locking
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

      // Save updated state back to KV
      // Set TTL if expiresAt exists
      let ttlSeconds = undefined;
      if (keyData.expiresAt && keyData.expiresAt > now) {
        ttlSeconds = Math.max(60, Math.floor((keyData.expiresAt - now) / 1000));
      }

      await KV.put(kvKey, JSON.stringify(keyData), {
        expirationTtl: ttlSeconds,
      });

      const daysLeft = keyData.expiresAt
        ? Math.ceil((keyData.expiresAt - now) / (1000 * 60 * 60 * 24))
        : "Lifetime";

      return jsonResponse({
        success: true,
        message: "Key verified successfully!",
        expiresAt: keyData.expiresAt,
        daysLeft: daysLeft,
      });
    }

    // -------------------------------------------------------------
    // Admin API Authentication Middleware
    // -------------------------------------------------------------
    const clientSecret = request.headers.get("X-Admin-Secret");
    if (pathname.startsWith("/api/admin/") || pathname === "/api/create-key" || pathname === "/api/reset-hwid") {
      if (!clientSecret || clientSecret !== ADMIN_SECRET) {
        return jsonResponse({ success: false, message: "Unauthorized (Invalid Admin Secret)" }, 401);
      }
    }

    // -------------------------------------------------------------
    // POST /api/create-key (Admin: Generate New Keys)
    // -------------------------------------------------------------
    if (pathname === "/api/create-key" && request.method === "POST") {
      if (!KV) {
        return jsonResponse({ success: false, message: "KV Database not configured" }, 500);
      }

      let body = {};
      try {
        body = await request.json();
      } catch {}

      // durationHours: 0 or null = Lifetime, 24 = 1 day, 168 = 1 week
      const durationHours = body.durationHours !== undefined ? Number(body.durationHours) : 24;
      const note = body.note || "Standard Key";
      const customKey = body.customKey ? String(body.customKey).trim().toUpperCase() : null;
      const key = customKey || generateRandomKey();

      const now = Date.now();
      const expiresAt = durationHours > 0 ? now + durationHours * 3600 * 1000 : 0;

      const keyData = {
        key: key,
        hwid: null, // Free to bind on first use
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
    // POST /api/reset-hwid (Admin: Reset HWID for a Key)
    // -------------------------------------------------------------
    if (pathname === "/api/reset-hwid" && request.method === "POST") {
      if (!KV) return jsonResponse({ success: false, message: "KV missing" }, 500);

      let body = {};
      try { body = await request.json(); } catch {}

      const key = body.key ? String(body.key).trim().toUpperCase() : null;
      if (!key) return jsonResponse({ success: false, message: "Key required" }, 400);

      const kvKey = `key:${key}`;
      const recordRaw = await KV.get(kvKey);
      if (!recordRaw) return jsonResponse({ success: false, message: "Key not found" }, 404);

      const keyData = JSON.parse(recordRaw);
      keyData.hwid = null; // Unbind device

      await KV.put(kvKey, JSON.stringify(keyData));

      return jsonResponse({
        success: true,
        message: `HWID for key ${key} has been reset successfully!`,
      });
    }

    // 404 Fallback
    return jsonResponse({ success: false, message: "Endpoint not found" }, 404);
  },
};
