# 🛡️ Hướng dẫn Key System (Kiểu Luarmor) cho EsclipseScriptHub

Hệ thống Key System này được thiết kế tương tự kiến trúc của **Luarmor / Boreas**, bao gồm:
- **Client (Luau Roblox)**: [`ScriptHub/src/core/keySystem.luau`](file:///C:/Users/HieuPC/Documents/GitHub/EsclipseScriptHub/ScriptHub/src/core/keySystem.luau) — Giao diện dark modern, hỗ trợ khóa thiết bị HWID, tự động lưu file cache (`EsclipseHub/key.json`) để đăng nhập không cần nhập lại.
- **Master Entrypoint**: [`ScriptHub/src/main.luau`](file:///C:/Users/HieuPC/Documents/GitHub/EsclipseScriptHub/ScriptHub/src/main.luau) — Tự động chặn và kiểm tra key trước khi cho phép nạp các game (Slop TD, Dungeon Quest,...).
- **Backend (Cloudflare Worker)**: [`KeySystem-Backend/worker.js`](file:///C:/Users/HieuPC/Documents/GitHub/EsclipseScriptHub/KeySystem-Backend/worker.js) — Máy chủ API serverless miễn phí 100k requests/ngày, lưu key vào Cloudflare KV Database.

---

## ⚡ 1. Test thử ngay trên Roblox (Chế độ Demo)

Bạn **chưa cần cài backend ngay** vẫn có thể test thử giao diện và luồng hoạt động:
1. Build script bằng công cụ của bạn (`pcmp` / `darklua` / `rojo`).
2. Inject vào Roblox.
3. Cửa sổ **Esclipse Script Hub Key System** sẽ hiện lên kèm Avatar, Username và HWID của bạn.
4. Nhập key test: `ESCLIPSE-DEV` và bấm **Submit Key**.
5. Giao diện sẽ báo thành công, lưu file `EsclipseHub/key.json` và mở script game.

---

## 🚀 2. Hướng dẫn triển khai Cloudflare Worker (Miễn phí 100%)

### Bước 1: Tạo tài khoản Cloudflare
1. Đăng ký tài khoản miễn phí tại [cloudflare.com](https://dash.cloudflare.com/sign-up).
2. Vào mục **Workers & Pages** ở menu bên trái.

### Bước 2: Tạo KV Namespace (Cơ sở dữ liệu lưu Key)
1. Trong menu **Workers & Pages**, chọn **KV**.
2. Bấm **Create a namespace**, đặt tên là `KEYS_KV`.
3. Bấm **Add**.

### Bước 3: Tạo Worker
1. Chọn **Workers & Pages** -> **Overview** -> **Create application** -> **Create Worker**.
2. Đặt tên worker: ví dụ `esclipse-keysystem` -> Bấm **Deploy**.
3. Bấm **Edit code**:
   - Xóa toàn bộ code mặc định trong editor.
   - Copy toàn bộ nội dung từ file [`KeySystem-Backend/worker.js`](file:///C:/Users/HieuPC/Documents/GitHub/EsclipseScriptHub/KeySystem-Backend/worker.js) và dán vào.
   - Bấm **Deploy**.

### Bước 4: Liên kết KV và Đặt Mật khẩu Admin
1. Quay lại trang cài đặt của Worker vừa tạo -> tab **Settings** -> mục **Variables**.
2. **KV Namespace Bindings**:
   - Bấm **Add binding**.
   - Variable name: `KEYS_KV` (bắt buộc viết hoa chính xác).
   - KV namespace: Chọn `KEYS_KV` vừa tạo ở Bước 2.
3. **Environment Variables**:
   - Bấm **Add variable**.
   - Name: `ADMIN_SECRET`.
   - Value: Nhập mật khẩu quản trị bí mật của bạn (ví dụ: `MySecretAdminKey2026`).
4. Bấm **Save and deploy**.

### Bước 5: Cập nhật URL vào Script Hub
Lấy URL Worker của bạn (ví dụ: `https://esclipse-keysystem.yourname.workers.dev`):
Mở file [`ScriptHub/src/main.luau`](file:///C:/Users/HieuPC/Documents/GitHub/EsclipseScriptHub/ScriptHub/src/main.luau#L17-L25):
```luau
local KEY_SYSTEM_CONFIG = {
	Title = "ESCLIPSE SCRIPT HUB",
	Subtitle = "Key Authentication System",
	ApiUrl = "https://esclipse-keysystem.yourname.workers.dev", -- Đổi thành URL Worker của bạn
	GetKeyUrl = "https://esclipse-keysystem.yourname.workers.dev/getkey",
	DiscordUrl = "https://discord.gg/your-invite",
	SaveFolder = "EsclipseHub",
	SaveFileName = "key.json", -- Lưu tại: EsclipseHub/key.json
	BypassKey = false,
}
```

---

## 🔑 3. Cách tạo Key cho người dùng

Bạn có thể tạo key thông qua lệnh HTTP POST (sử dụng Postman, Webhook, hoặc Terminal):

### Tạo Key 24 Giờ (Mặc định):
```bash
curl -X POST "https://esclipse-keysystem.yourname.workers.dev/api/create-key" \
  -H "Content-Type: application/json" \
  -H "X-Admin-Secret: MySecretAdminKey2026" \
  -d '{"durationHours": 24, "note": "User Discord #1234"}'
```

### Tạo Key 7 Ngày:
```bash
curl -X POST "https://esclipse-keysystem.yourname.workers.dev/api/create-key" \
  -H "Content-Type: application/json" \
  -H "X-Admin-Secret: MySecretAdminKey2026" \
  -d '{"durationHours": 168, "note": "VIP 7 Days"}'
```

### Tạo Key Vĩnh Viễn (Lifetime / Custom Key):
```bash
curl -X POST "https://esclipse-keysystem.yourname.workers.dev/api/create-key" \
  -H "Content-Type: application/json" \
  -H "X-Admin-Secret: MySecretAdminKey2026" \
  -d '{"durationHours": 0, "customKey": "ESCLIPSE-VIP-LIFETIME-001"}'
```

### Reset HWID cho người dùng (nếu họ đổi máy):
```bash
curl -X POST "https://esclipse-keysystem.yourname.workers.dev/api/reset-hwid" \
  -H "Content-Type: application/json" \
  -H "X-Admin-Secret: MySecretAdminKey2026" \
  -d '{"key": "ESCLIPSE-XXXX-XXXX-XXXX"}'
```

---

## 💰 4. Tích hợp Link kiếm tiền (LootLabs / Linkvertise)

Để người chơi khi bấm **"Get Key Link"** được chuyển đến trang vượt link kiếm tiền:
1. Mở [`KeySystem-Backend/worker.js`](file:///C:/Users/HieuPC/Documents/GitHub/EsclipseScriptHub/KeySystem-Backend/worker.js#L68-L76).
2. Tại endpoint `GET /getkey`, bạn có thể chuyển hướng trực tiếp đến link LootLabs/Linkvertise:
```javascript
if (pathname === "/getkey") {
  const hwid = url.searchParams.get("hwid") || "Unknown";
  // Linkvertise hoặc LootLabs dynamic redirect:
  return Response.redirect(`https://loot-link.com/s?xxxx&param=${hwid}`, 302);
}
```
Hoặc cấu hình trực tiếp `GetKeyUrl` trong [`ScriptHub/src/main.luau`](file:///C:/Users/HieuPC/Documents/GitHub/EsclipseScriptHub/ScriptHub/src/main.luau#L21) trỏ thẳng về link Linkvertise của bạn.
