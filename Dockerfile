# Use OpenJDK 17 image
FROM eclipse-temurin:17-jdk-alpine

# Set working directory
WORKDIR /app

# Copy Maven wrapper and pom.xml from the backend folder
COPY backend/mvnw backend/.mvn backend/pom.xml ./

# Make mvnw executable
RUN chmod +x mvnw

# Copy the rest of the backend source code
COPY backend/src ./src

# Build the application
RUN ./mvnw clean package -DskipTests

# Run the application
CMD ["java", "-jar", "target/*.jar"]
