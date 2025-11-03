# Use OpenJDK 17 image
FROM eclipse-temurin:17-jdk-alpine

# Set working directory
WORKDIR /app

# Copy Maven wrapper, pom.xml, and .mvn directory
COPY backend/mvnw .
COPY backend/.mvn .mvn
COPY backend/pom.xml .

# Make mvnw executable
RUN chmod +x mvnw

# Copy source code
COPY backend/src ./src

# Install bash and curl for safety
RUN apk add --no-cache bash curl

# Build the application
RUN ./mvnw clean package -DskipTests

# Expose port for Spring Boot
EXPOSE 8080

# Run the JAR
CMD ["java", "-jar", "target/backend-0.0.1-SNAPSHOT.jar"]