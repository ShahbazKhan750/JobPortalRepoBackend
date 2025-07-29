# Use a lightweight JDK 11 image
FROM eclipse-temurin:11-jdk-alpine

# Set JAVA_HOME explicitly (optional, but clear)
ENV JAVA_HOME=/opt/java/openjdk
ENV PATH="${JAVA_HOME}/bin:${PATH}"

# Set working directory
WORKDIR /app

# Copy all project files into the container
COPY . .

# Make the Maven wrapper executable
RUN chmod +x mvnw

# Build the app (skip tests to speed up builds)
RUN ./mvnw clean package -DskipTests

# Run the app using the generated jar
CMD ["sh", "-c", "java -jar target/*.jar"]
