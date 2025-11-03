# Use OpenJDK 17 image
FROM eclipse-temurin:17-jdk-alpine

# Set working directory
WORKDIR /app

# Copy Maven wrapper and pom.xml
COPY mvnw .mvn pom.xml ./

# Make mvnw executable
RUN chmod +x mvnw

# Copy the rest of the backend source code
COPY backend ./backend

# Build the application
RUN ./mvnw -f backend/pom.xml clean package -DskipTests

# Run the application
CMD ["java", "-jar", "backend/target/*.jar"]
