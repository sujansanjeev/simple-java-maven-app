# Start with an official Maven image to build the application
FROM maven:3.8.4-openjdk-11 AS build

# Set the working directory in the container
WORKDIR /SIMPLE-JAVA-MAVEN-APP

# Copy the pom.xml file and download dependencies
COPY pom.xml .
RUN mvn dependency:resolve

# Copy the rest of the application source code
COPY src ./src

# Build the application
RUN mvn clean package

# Start a new image with JDK to run the application
FROM openjdk:11-jre-slim

# Set the working directory in the new container
WORKDIR /app

# Copy the JAR file from the build image
COPY --from=build /app/target/*.jar app.jar

# Expose the port the app runs on
EXPOSE 8080

# Command to run the app
CMD ["java", "-jar", "app.jar"]
