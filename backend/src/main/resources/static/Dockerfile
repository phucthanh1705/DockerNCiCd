# --- GIAI ĐOẠN 1: SERVE ---
# Sử dụng Nginx siêu nhẹ để làm Web Server
FROM nginx:alpine

# Copy toàn bộ nội dung của folder frontend (chứa file html, css, pdf) vào Document Root của Nginx
COPY . /usr/share/nginx/html

# Expose port mặc định của Nginx để cho phép traffic vào web
EXPOSE 80

# Chạy Nginx ở chế độ foreground giúp Docker không bị thoát sau khi chạy
CMD ["nginx", "-g", "daemon off;"]
