# --- GIAI ĐOẠN 1: BUILD ---
FROM maven:3.9.11-eclipse-temurin-21 AS builder
WORKDIR /app

# Khôi phục file cấu hình của backend
COPY backend/pom.xml .

# Lấy source code backend
COPY backend/src ./src

# --- BÍ QUYẾT TÍCH HỢP FRONTEND (ALL-IN-ONE) ---
# Copy toàn bộ code frontend (html, pdf, js, css) vào thư mục static của Spring Boot.
# Spring Boot sẽ tự động host nội dung này ở đường dẫn chính http://localhost:8080/
COPY frontend/ ./src/main/resources/static/

# Biên dịch tổng hợp thành file .jar
RUN mvn package -DskipTests

# --- GIAI ĐOẠN 2: RUN ---
FROM eclipse-temurin:21-jre-jammy
WORKDIR /app

# Chỉ lấy file .jar cuối cùng (đã chứa cả frontend lẫn backend)
COPY --from=builder /app/target/*.jar app.jar
EXPOSE 8080

# Chạy ứng dụng duy nhất
ENTRYPOINT ["java", "-jar", "app.jar"]
