FROM maven:3.8.4-jdk-11-slim AS MAVEN_BUILD
COPY ./ ./
RUN mvn clean package
FROM adoptopenjdk/openjdk11:alpine-jre
COPY --from=MAVEN_BUILD /target/spring-boot-web.jar /app.jar
CMD ["java", "-jar", "/app.jar"]