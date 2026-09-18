---
name: csum
description: Tự động phân tích git diff so với commit gần nhất (HEAD) và tạo commit message / description chi tiết, chuẩn Conventional Commits. Kích hoạt khi người dùng gõ /csum hoặc yêu cầu tóm tắt thay đổi commit.
---

# Commit Summary Generator (`/csum`)

## Mục tiêu
Tự động kiểm tra các thay đổi uncommitted / staged so với commit gần nhất và tạo nội dung tóm tắt commit chuẩn chỉnh để copy vào git commit message / PR description.

## Quy trình thực hiện khi kích hoạt:
1. **Kiểm tra trạng thái git**:
   - Chạy `git status` để xem danh sách các file đã sửa đổi, thêm mới hoặc xóa.
   - Chạy `git diff` (hoặc `git diff --cached`) để đọc nội dung thay đổi chi tiết trong các file code (chú trọng các file trong `src/`, `tabs/`, `core/`, tránh liệt kê vụn vặt các file build tự động như `dist/`).

2. **Phân tích logic thay đổi**:
   - Xác định mục đích chính của thay đổi: tính năng mới (`feat`), sửa lỗi (`fix`), tái cấu trúc (`refactor`), tối ưu hiệu năng (`perf`), v.v.
   - Xác định phạm vi/module bị ảnh hưởng (ví dụ: `PathRecord`, `CombatMaster`, `AutoFarm`, `HazardScanner`, `UI`, v.v.).

3. **Xuất kết quả**:
   - Định dạng trong code block Markdown để người dùng dễ copy:
     - **Header**: `<type>(<scope>): <short description>`
     - **Body**: Danh sách gạch đầu dòng mô tả chi tiết từng thay đổi quan trọng, nguyên nhân và tác động logic.
