FROM maven:3.8.4-jdk-11-slim AS MAVEN_BUILD
COPY ./ ./
RUN mvn clean package
FROM openjdk:8-jre-alpine3.9
COPY --from=MAVEN_BUILD /kochbase-java-docker/target/spring-boot-web.jar /app.jar
CMD ["java", "-jar", "/app.jar"]