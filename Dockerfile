# Use OpenJDK 17 image
FROM eclipse-temurin:17-jdk-alpine

# Set working directory
WORKDIR /app

# Copy Maven wrapper, configuration, and pom.xml
COPY backend/mvnw backend/.mvn backend/pom.xml ./
RUN chmod +x mvnw

# Copy Maven wrapper's internal files (important!)
COPY backend/.mvn ./backend/.mvn

# Copy source code
COPY backend/src ./src

# Install bash and curl for safety
RUN apk add --no-cache bash curl

# Build the application
RUN ./mvnw clean package -DskipTests

# Expose port for Spring Boot
EXPOSE 8080

# Run the JAR
CMD ["java", "-jar", "target/*.jar"]
