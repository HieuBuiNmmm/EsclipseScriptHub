# 🛡️ Hướng dẫn Quản trị Key System & Web Admin Dashboard (Giai đoạn 4)

Hệ thống Key System của **EsclipseScriptHub** hiện được tích hợp sẵn một **Web Admin Dashboard** sang trọng, hiện đại, cho phép bạn quản lý cấp phát key mọi lúc mọi nơi từ máy tính hoặc điện thoại di động mà không tốn thêm chi phí server:
- **Địa chỉ Dashboard**: `https://esclipse-keysystem.bhieu4225.workers.dev/admin`
- **Mật khẩu đăng nhập**: `EsclipseSecret2026` (hoặc giá trị trong biến `ADMIN_SECRET` trên Cloudflare).

---

## 🖥️ Các tính năng trên Web Admin Dashboard

### 1. 📊 Bảng thống kê thời gian thực (Real-time Metrics)
- **Total Keys**: Tổng số key đã được tạo và lưu trong database.
- **Active Devices (HWID)**: Số lượng máy/thiết bị đang bị khóa cứng vào key.
- **Lifetime / VIP Keys**: Số lượng key vĩnh viễn (dành cho Admin, bạn bè, khách VIP).
- **24h Checkpoint Keys**: Số lượng key được tạo tự động từ cổng vượt link LootLabs.

### 2. ➕ Tạo Key Nhanh (Key Generator)
- **Thời hạn định sẵn**: 24 Giờ (1 ngày), 7 Ngày (1 tuần), 30 Ngày (1 tháng), Vĩnh viễn (Lifetime), hoặc nhập số giờ tùy ý.
- **Tên Key tùy chỉnh**: Bạn có thể đặt tên key VIP đẹp mắt, ví dụ: `ESCLIPSE-VIP-HIEU`, `ESCLIPSE-MOD-01`...
- **Ghi chú (Note)**: Lưu tên người nhận hoặc tag Discord (ví dụ: `Discord @JohnDoe#1234`).
- **Nút Copy 1-Click**: Tự động copy key vào clipboard ngay sau khi tạo.

### 3. 📋 Bảng quản lý & Khám phá Key (Keys Explorer)
- **Tìm kiếm trực tiếp (Live Search)**: Gõ để tìm kiếm nhanh theo mã Key, tên Ghi chú hoặc mã HWID.
- **Trạng thái trực quan**: 
  - 🟢 **Active**: Key đang còn hạn sử dụng (kèm số giờ còn lại).
  - 🟣 **Lifetime**: Key vĩnh viễn không bao giờ hết hạn.
  - 🔴 **Expired**: Key đã hết hạn.
- **Nút thao tác nhanh trên từng dòng**:
  - 📋 **Copy**: Copy nhanh mã key.
  - 🔄 **Reset HWID**: Mở khóa thiết bị ngay lập tức khi người chơi đổi máy tính/điện thoại.
  - 🗑️ **Delete**: Xóa vĩnh viễn key và thu hồi quyền sử dụng ngay lập tức.

---

## 🚀 Cách Deploy lên Cloudflare Worker

1. Đăng nhập [dash.cloudflare.com](https://dash.cloudflare.com).
2. Vào **Workers & Pages** -> Chọn Worker **`esclipse-keysystem`**.
3. Bấm **Edit code**.
4. Chọn tất cả (Ctrl + A) và dán đè toàn bộ code mới từ file [`KeySystem-Backend/worker.js`](file:///C:/Users/HieuPC/Documents/GitHub/EsclipseScriptHub/KeySystem-Backend/worker.js).
5. Bấm **Deploy**.
6. Truy cập ngay: [https://esclipse-keysystem.bhieu4225.workers.dev/admin](https://esclipse-keysystem.bhieu4225.workers.dev/admin) để trải nghiệm Dashboard quản trị!
