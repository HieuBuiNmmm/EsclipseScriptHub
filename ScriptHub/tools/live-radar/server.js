/**
 * Live 2D Radar & Boss Simulator - Relay Server
 * Zero-Dependency Node.js HTTP & WebSocket Server (Port 8765)
 * 
 * Functions:
 * 1. Serves index.html and static files on http://localhost:8765
 * 2. Bridges Roblox client WebSocket connections and Web Browser UI clients
 * 3. Broadcasts real-time telemetry from Roblox to all connected browsers at 60 FPS
 */

const http = require('http');
const fs = require('fs');
const path = require('path');
const crypto = require('crypto');

const PORT = process.env.PORT || 8765;
const clients = new Set();
let latestTelemetry = null;

// ==========================================
// 1. HTTP Static File Server
// ==========================================
const server = http.createServer((req, res) => {
  const urlPath = req.url.split('?')[0];
  let filePath = path.join(__dirname, urlPath === '/' ? 'index.html' : urlPath);

  // Security: prevent directory traversal
  if (!filePath.startsWith(__dirname)) {
    res.writeHead(403);
    return res.end('403 Forbidden');
  }

  const ext = path.extname(filePath).toLowerCase();
  const mimeTypes = {
    '.html': 'text/html; charset=utf-8',
    '.js': 'application/javascript; charset=utf-8',
    '.css': 'text/css; charset=utf-8',
    '.json': 'application/json',
    '.png': 'image/png',
    '.jpg': 'image/jpeg',
    '.svg': 'image/svg+xml',
    '.ico': 'image/x-icon',
  };

  fs.readFile(filePath, (err, data) => {
    if (err) {
      if (err.code === 'ENOENT') {
        // Fallback to index.html for SPA
        fs.readFile(path.join(__dirname, 'index.html'), (err2, indexData) => {
          if (err2) {
            res.writeHead(404, { 'Content-Type': 'text/plain' });
            res.end('404 Not Found');
          } else {
            res.writeHead(200, { 'Content-Type': 'text/html; charset=utf-8' });
            res.end(indexData);
          }
        });
      } else {
        res.writeHead(500, { 'Content-Type': 'text/plain' });
        res.end('500 Internal Server Error');
      }
    } else {
      res.writeHead(200, { 'Content-Type': mimeTypes[ext] || 'application/octet-stream' });
      res.end(data);
    }
  });
});

// ==========================================
// 2. Pure RFC6455 WebSocket Implementation (Zero Dependencies)
// ==========================================
const WS_GUID = '258EAFA5-E914-47DA-95CA-C5AB0DC85B11';

function createWebSocketFrame(data, opcode = 0x1) {
  const payload = Buffer.from(typeof data === 'string' ? data : JSON.stringify(data));
  const length = payload.length;
  let header;

  if (length < 126) {
    header = Buffer.alloc(2);
    header[0] = 0x80 | opcode; // FIN + opcode
    header[1] = length;
  } else if (length < 65536) {
    header = Buffer.alloc(4);
    header[0] = 0x80 | opcode;
    header[1] = 126;
    header.writeUInt16BE(length, 2);
  } else {
    header = Buffer.alloc(10);
    header[0] = 0x80 | opcode;
    header[1] = 127;
    header.writeBigUInt64BE(BigInt(length), 2);
  }

  return Buffer.concat([header, payload]);
}

let packetCounter = 0;
let lastLogTime = Date.now();

function broadcast(data, senderSocket = null) {
  const frame = createWebSocketFrame(data);
  for (const client of clients) {
    if (client.readyState === 'OPEN' && client.socket.writable) {
      if (!senderSocket || client.socket !== senderSocket) {
        try {
          client.socket.write(frame);
        } catch (err) {
          // Socket closed or broken
        }
      }
    }
  }
}

server.on('upgrade', (req, socket, head) => {
  const key = req.headers['sec-websocket-key'];
  if (!key) {
    socket.destroy();
    return;
  }

  const acceptKey = crypto
    .createHash('sha1')
    .update(key + WS_GUID)
    .digest('base64');

  const responseHeaders = [
    'HTTP/1.1 101 Switching Protocols',
    'Upgrade: websocket',
    'Connection: Upgrade',
    `Sec-WebSocket-Accept: ${acceptKey}`,
  ].join('\r\n') + '\r\n\r\n';

  socket.write(responseHeaders);

  const client = {
    socket: socket,
    readyState: 'OPEN',
    buffer: head && head.length > 0 ? Buffer.from(head) : Buffer.alloc(0),
    isRoblox: false,
    remoteAddress: socket.remoteAddress,
  };

  clients.add(client);
  console.log(`[+] Client connected (${clients.size} total active clients) [${socket.remoteAddress}]`);

  // Send latest cached state immediately upon connecting so browser doesn't wait
  if (latestTelemetry) {
    try {
      socket.write(createWebSocketFrame(latestTelemetry));
    } catch (e) {}
  }

  socket.on('data', (chunk) => {
    client.buffer = Buffer.concat([client.buffer, chunk]);

    while (client.buffer.length >= 2) {
      const firstByte = client.buffer[0];
      const secondByte = client.buffer[1];

      const fin = (firstByte & 0x80) !== 0;
      const opcode = firstByte & 0x0F;
      const isMasked = (secondByte & 0x80) !== 0;
      let payloadLength = secondByte & 0x7F;
      let headerOffset = 2;

      if (payloadLength === 126) {
        if (client.buffer.length < 4) break;
        payloadLength = client.buffer.readUInt16BE(2);
        headerOffset = 4;
      } else if (payloadLength === 127) {
        if (client.buffer.length < 10) break;
        payloadLength = Number(client.buffer.readBigUInt64BE(2));
        headerOffset = 10;
      }

      const maskLength = isMasked ? 4 : 0;
      const totalFrameSize = headerOffset + maskLength + payloadLength;

      if (client.buffer.length < totalFrameSize) {
        break; // Wait for full frame
      }

      let maskKey = null;
      if (isMasked) {
        maskKey = client.buffer.slice(headerOffset, headerOffset + 4);
      }

      const rawPayload = client.buffer.slice(
        headerOffset + maskLength,
        headerOffset + maskLength + payloadLength
      );

      // Unmask payload if masked (RFC6455 client-to-server)
      let payload = Buffer.alloc(rawPayload.length);
      if (isMasked && maskKey) {
        for (let i = 0; i < rawPayload.length; i++) {
          payload[i] = rawPayload[i] ^ maskKey[i % 4];
        }
      } else {
        payload = rawPayload;
      }

      // Advance buffer
      client.buffer = client.buffer.slice(totalFrameSize);

      // Handle Opcodes
      if (opcode === 0x8) {
        // Connection Close Frame
        client.readyState = 'CLOSED';
        socket.end();
        break;
      } else if (opcode === 0x9) {
        // Ping -> Pong
        if (socket.writable) {
          const pongFrame = Buffer.alloc(2);
          pongFrame[0] = 0x8A; // FIN + Pong opcode 0xA
          pongFrame[1] = 0;
          socket.write(pongFrame);
        }
      } else if (opcode === 0x1 || opcode === 0x2) {
        // Text or Binary Frame
        const textData = payload.toString('utf8');
        try {
          const parsed = JSON.parse(textData);
          if (parsed && parsed.type === 'TELEMETRY') {
            latestTelemetry = textData;
            client.isRoblox = true;
            packetCounter++;

            const now = Date.now();
            if (now - lastLogTime >= 5000) {
              const hCount = parsed.hazards ? parsed.hazards.length : 0;
              const eCount = parsed.enemies ? parsed.enemies.length : 0;
              const dName = parsed.dungeon || 'Lobby';
              const rNum = parsed.room || 0;
              const pName = parsed.player ? parsed.player.name : 'Unknown';
              console.log(`[⚡ Telemetry] User: ${pName} | Map: ${dName} (Room ${rNum}) | Enemies: ${eCount} | Hazards: ${hCount} | Relayed #${packetCounter} packets`);
              lastLogTime = now;
            }
          }
        } catch (e) {
          // Not JSON or partial
        }

        // Broadcast to all other web/client sockets
        broadcast(textData, socket);
      }
    }
  });

  const cleanup = () => {
    client.readyState = 'CLOSED';
    clients.delete(client);
    console.log(`[-] Client disconnected (${clients.size} remaining)`);
  };

  socket.on('close', cleanup);
  socket.on('error', (err) => {
    cleanup();
  });
});

server.listen(PORT, '0.0.0.0', () => {
  console.log('====================================================');
  console.log(`🚀 Live 2D Radar & Boss Simulator Relay Server`);
  console.log(`🌐 Web UI URL:       http://localhost:${PORT}`);
  console.log(`📡 WebSocket URL:    ws://localhost:${PORT}`);
  console.log('====================================================');
  console.log('Waiting for Roblox script & Web browser to connect...\n');
});
