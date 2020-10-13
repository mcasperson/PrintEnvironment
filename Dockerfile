FROM maven:3.6.3-jdk-11 AS build-env
WORKDIR /app

COPY pom.xml ./
RUN mvn dependency:go-offline

COPY . ./
RUN mvn package

FROM openjdk:11-jre
EXPOSE 8080
WORKDIR /app

COPY --from=build-env /app/target/demo-0.0.1-SNAPSHOT.jar ./demo-0.0.1-SNAPSHOT.jar
CMD ["-jar", "/app/demo-0.0.1-SNAPSHOT.jar"]
ENTRYPOINT [ "java" ]