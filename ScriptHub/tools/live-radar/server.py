#!/usr/bin/env python3
"""
Live 2D Radar & Boss Simulator - Relay Server (Python Standalone)
Zero-Dependency Python 3 HTTP & WebSocket Relay Server (Port 8765)
"""

import os
import sys
import json
import base64
import hashlib
import struct
import socket
import select
from http.server import HTTPServer, SimpleHTTPRequestHandler
import threading

PORT = int(os.environ.get("PORT", 8765))
WS_GUID = "258EAFA5-E914-47DA-95CA-C5AB0DC85B11"

clients = set()
clients_lock = threading.Lock()
latest_telemetry = None


class HTTPStaticServer(SimpleHTTPRequestHandler):
    def __init__(self, *args, **kwargs):
        super().__init__(*args, directory=os.path.dirname(os.path.abspath(__file__)), **kwargs)

    def log_message(self, format, *args):
        # Suppress noisy HTTP asset logs
        pass


def make_ws_frame(data, opcode=0x1):
    payload = data.encode('utf-8') if isinstance(data, str) else data
    length = len(payload)
    if length < 126:
        header = struct.pack('!BB', 0x80 | opcode, length)
    elif length < 65536:
        header = struct.pack('!BBH', 0x80 | opcode, 126, length)
    else:
        header = struct.pack('!BBQ', 0x80 | opcode, 127, length)
    return header + payload


def broadcast(data, exclude_sock=None):
    frame = make_ws_frame(data)
    with clients_lock:
        dead = []
        for client_sock in clients:
            if client_sock == exclude_sock:
                continue
            try:
                client_sock.sendall(frame)
            except Exception:
                dead.append(client_sock)
        for d in dead:
            clients.remove(d)
            try:
                d.close()
            except Exception:
                pass


def handle_ws_client(client_sock, client_addr):
    global latest_telemetry
    with clients_lock:
        clients.add(client_sock)
    print(f"[+] Client connected from {client_addr} (Total: {len(clients)})")

    if latest_telemetry:
        try:
            client_sock.sendall(make_ws_frame(latest_telemetry))
        except Exception:
            pass

    try:
        buffer = bytearray()
        while True:
            chunk = client_sock.recv(4096)
            if not chunk:
                break
            buffer.extend(chunk)

            while len(buffer) >= 2:
                first_byte = buffer[0]
                second_byte = buffer[1]

                opcode = first_byte & 0x0F
                is_masked = (second_byte & 0x80) != 0
                payload_len = second_byte & 0x7F
                offset = 2

                if payload_len == 126:
                    if len(buffer) < 4:
                        break
                    payload_len = struct.unpack('!H', buffer[2:4])[0]
                    offset = 4
                elif payload_len == 127:
                    if len(buffer) < 10:
                        break
                    payload_len = struct.unpack('!Q', buffer[2:10])[0]
                    offset = 10

                mask_len = 4 if is_masked else 0
                total_frame = offset + mask_len + payload_len

                if len(buffer) < total_frame:
                    break

                mask_key = buffer[offset:offset+4] if is_masked else None
                raw_payload = buffer[offset+mask_len:total_frame]

                if is_masked and mask_key:
                    unmasked = bytearray(len(raw_payload))
                    for i in range(len(raw_payload)):
                        unmasked[i] = raw_payload[i] ^ mask_key[i % 4]
                    payload = bytes(unmasked)
                else:
                    payload = bytes(raw_payload)

                buffer = buffer[total_frame:]

                if opcode == 0x8:  # Close
                    return
                elif opcode == 0x9:  # Ping -> Pong
                    client_sock.sendall(struct.pack('!BB', 0x8A, 0))
                elif opcode in (0x1, 0x2):  # Text or Binary
                    text_str = payload.decode('utf-8', errors='ignore')
                    try:
                        parsed = json.loads(text_str)
                        if isinstance(parsed, dict) and parsed.get('type') == 'TELEMETRY':
                            latest_telemetry = text_str
                    except Exception:
                        pass
                    broadcast(text_str, client_sock)
    except Exception:
        pass
    finally:
        with clients_lock:
            if client_sock in clients:
                clients.remove(client_sock)
        try:
            client_sock.close()
        except Exception:
            pass
        print(f"[-] Client disconnected from {client_addr} (Remaining: {len(clients)})")


def run_ws_server():
    sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    sock.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)
    sock.bind(('0.0.0.0', PORT))
    sock.listen(10)
    print("====================================================")
    print("🚀 Live 2D Radar & Boss Simulator Relay Server (Python)")
    print(f"🌐 Web UI URL:       http://localhost:{PORT}")
    print(f"📡 WebSocket URL:    ws://localhost:{PORT}")
    print("====================================================")
    print("Waiting for Roblox script & Web browser to connect...\n")

    while True:
        client_sock, client_addr = sock.accept()
        try:
            # Handle handshake (either HTTP upgrade or HTTP static request)
            header_bytes = bytearray()
            while b"\r\n\r\n" not in header_bytes:
                part = client_sock.recv(1024)
                if not part:
                    break
                header_bytes.extend(part)

            header_str = header_bytes.decode('latin1', errors='ignore')
            lines = header_str.split("\r\n")
            first_line = lines[0] if lines else ""

            # Check if WebSocket Upgrade
            if "Upgrade: websocket" in header_str or "upgrade: websocket" in header_str:
                sec_key = None
                for line in lines:
                    if line.lower().startswith("sec-websocket-key:"):
                        sec_key = line.split(":", 1)[1].strip()
                        break

                if sec_key:
                    hash_val = hashlib.sha1((sec_key + WS_GUID).encode('utf-8')).digest()
                    accept_key = base64.b64encode(hash_val).decode('utf-8')
                    resp = (
                        "HTTP/1.1 101 Switching Protocols\r\n"
                        "Upgrade: websocket\r\n"
                        "Connection: Upgrade\r\n"
                        f"Sec-WebSocket-Accept: {accept_key}\r\n\r\n"
                    )
                    client_sock.sendall(resp.encode('utf-8'))
                    threading.Thread(target=handle_ws_client, args=(client_sock, client_addr), daemon=True).start()
                    continue

            # Standard HTTP request: serve static file
            path_part = first_line.split(" ")[1] if len(first_line.split(" ")) > 1 else "/"
            clean_path = path_part.split("?")[0]
            if clean_path == "/":
                clean_path = "/index.html"

            full_path = os.path.join(os.path.dirname(os.path.abspath(__file__)), clean_path.lstrip("/"))
            if not os.path.exists(full_path) or not os.path.isfile(full_path):
                full_path = os.path.join(os.path.dirname(os.path.abspath(__file__)), "index.html")

            with open(full_path, "rb") as f:
                content = f.read()

            content_type = "text/html; charset=utf-8"
            if full_path.endswith(".js"):
                content_type = "application/javascript; charset=utf-8"
            elif full_path.endswith(".css"):
                content_type = "text/css; charset=utf-8"
            elif full_path.endswith(".json"):
                content_type = "application/json"

            resp = (
                f"HTTP/1.1 200 OK\r\n"
                f"Content-Type: {content_type}\r\n"
                f"Content-Length: {len(content)}\r\n"
                f"Connection: close\r\n\r\n"
            ).encode('utf-8') + content

            client_sock.sendall(resp)
            client_sock.close()
        except Exception as e:
            try:
                client_sock.close()
            except Exception:
                pass


if __name__ == "__main__":
    try:
        run_ws_server()
    except KeyboardInterrupt:
        print("\n[Server shutting down...]")
