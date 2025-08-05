# --- Build Stage ---
FROM maven:3.9.7-eclipse-temurin-17 AS builder
WORKDIR /app
COPY . .
RUN mvn clean package -DskipTests

# --- Run Stage ---
FROM eclipse-temurin:17-jdk
WORKDIR /app
COPY --from=builder /app/zookeeper-server/target/*.jar ./zookeeper-server.jar

EXPOSE 2181

ENTRYPOINT ["java", "-cp", "zookeeper-server.jar", "org.apache.zookeeper.server.quorum.QuorumPeerMain", "/app/conf/zoo.cfg"]
