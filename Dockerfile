# --- Build Stage ---
FROM maven:3.8.7-openjdk-17 AS builder
WORKDIR /app
COPY . .
RUN mvn clean package -DskipTests

# --- Run Stage ---
FROM openjdk:17-jdk-slim
WORKDIR /app

# Copy the built jar from the build stage
COPY --from=builder /app/zookeeper-server/target/*.jar ./zookeeper-server.jar

EXPOSE 2181

ENTRYPOINT ["java", "-jar", "zookeeper-server.jar"]
