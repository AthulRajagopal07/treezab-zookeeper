# --- Build Stage ---
FROM maven:3.9.7-eclipse-temurin-17 AS builder
WORKDIR /app
COPY . .
RUN mvn clean package -DskipTests

# --- Run Stage ---
FROM eclipse-temurin:17-jdk
WORKDIR /app
# Copy the shaded JAR (with all dependencies and the main manifest)
COPY --from=builder /app/zookeeper-server/target/*shaded.jar ./zookeeper-server.jar

# [Optional] Copy default config directory (not needed if using ConfigMap in K8s)
# COPY --from=builder /app/conf ./conf

# Expose official ZooKeeper ports for client and quorum/leader traffic
EXPOSE 2181 2888 3888

# Start ZooKeeper using shaded jar and external config file
ENTRYPOINT ["java", "-jar", "zookeeper-server.jar", "/app/conf/zoo.cfg"]
