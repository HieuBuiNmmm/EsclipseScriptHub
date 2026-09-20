# ⚡ Esclipse Live 2D Radar & Boss Simulator

Hệ thống mô phỏng 2D Top-Down Radar thời gian thực, kết nối giữa Client Roblox và Web Browser qua giao thức WebSocket (`ws://localhost:8765`).

---

## 🎯 Tính năng nổi bật

1. **Top-Down 2D Radar (60 FPS)**:
   - Hiển thị vị trí thực tế của **Player** (X-Z), góc nhìn (Yaw) và hướng chạy (MoveDirection).
   - Hiển thị chính xác **Hitbox bán kính của Player** (1.8 studs), trạng thái Shield/Bất tử, Trạng thái In Danger và Dash/Dodge.
2. **Boss & Boss Arena**:
   - Vị trí Boss, Tên Boss, Thanh máu (Health Bar), Góc nhìn và Hướng chiêu thức.
   - Vòng giới hạn **Boss Arena** (bán kính cấu hình từ Contextual).
   - Quái thường (Mobs) trong phòng.
3. **Mô phỏng Vùng Nguy Hiểm (Hazard Danger Zones)**:
   - **Đĩa đỏ / Vòng tròn AoE** (Circle Danger Zones): Kích thước và bán kính chính xác.
   - **Hộp OBB xoay theo CFrame** (Box Danger Zones): Mô phỏng các chiêu thức hình khối/mesh xoay.
   - **Wave Chain** (Chuỗi vòng tròn liên hoàn Boss 2): Mô phỏng từng vòng sóng lan tỏa kèm thời gian tan rã.
   - **Lifespan Countdown Timer**: Đếm ngược thời gian còn lại của từng vùng chiêu thức.
4. **Hành lang Quỹ đạo Đạn (Orange Trajectory Corridors)**:
   - Hiển thị dự báo hướng đi của các tia laser, spike seeking, moving beam với chiều dài và bề rộng thực tế.
5. **Điểm An Toàn & Vector Né (Safe Spot & Escape Vector)**:
   - Radar Beacon xanh lá đánh dấu Safe Spot gần nhất.
   - Đường nét đứt nối Player -> Safe Spot kèm khoảng cách (studs).
6. **Simulation Sandbox Mode**:
   - Nút `⚡ Sim` cho phép chạy mô phỏng các đợt tấn công của Boss ngay trên trình duyệt mà không cần vào game.

---

## 🚀 Hướng dẫn khởi động

### Cách 1: Chạy nhanh bằng 1-Click (Khuyên dùng trên Windows)
- Nhấp đúp vào file `run.bat` trong thư mục `tools/live-radar/`.
- File sẽ tự động nhận diện Node.js hoặc Python và mở trình duyệt tại `http://localhost:8765`.

### Cách 2: Chạy bằng Node.js
```bash
node tools/live-radar/server.js
```

### Cách 3: Chạy bằng Python 3
```bash
python tools/live-radar/server.py
```

---

## 🎮 Cách sử dụng trong Game
1. Chạy server relay bằng `run.bat`.
2. Mở game Roblox và Execute script EsclipseHub.
3. Trong giao diện UI, vào tab **Combat** -> mục **Hazard Scanner** (hoặc mở phần **Live 2D Top-Down Radar**).
4. Bật toggle **Enable Live 2D Radar (WebSocket)**.
5. Mở trình duyệt tại `http://localhost:8765` để xem Radar trực tiếp!
