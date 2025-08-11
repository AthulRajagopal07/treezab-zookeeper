# --- Build Stage ---
FROM maven:3.9.7-eclipse-temurin-17 AS builder
WORKDIR /app
COPY . .
RUN mvn clean package -DskipTests

# Debug: Show what was produced in the build stage
RUN ls -lh /app/zookeeper-server/target/
RUN jar tf /app/zookeeper-server/target/zookeeper-3.10.0-SNAPSHOT-shaded.jar | grep LoggerFactory || echo "LOGGER NOT FOUND"

# --- Run Stage ---
FROM eclipse-temurin:17-jdk
WORKDIR /app
COPY --from=builder /app/zookeeper-server/target/zookeeper-3.10.0-SNAPSHOT-shaded.jar ./zookeeper-server.jar
EXPOSE 2181 2888 3888
ENTRYPOINT ["java", "-cp", "zookeeper-server.jar", "org.apache.zookeeper.server.quorum.QuorumPeerMain", "/app/conf/zoo.cfg"]
