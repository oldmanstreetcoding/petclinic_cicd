# Use a lightweight Java runtime as base image
FROM openjdk:11-jre-slim

# Copy the JAR file into the container
COPY target/spring-petclinic-3.3.0-SNAPSHOT.jar /app/petclinic.jar

# Expose port 8081
EXPOSE 8081

# Run the JAR file
ENTRYPOINT ["java", "-jar", "/app/petclinic.jar", "--server.port=8081"]
