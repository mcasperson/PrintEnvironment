FROM maven:3.6.3-jdk-11 AS build-env
WORKDIR /app

COPY pom.xml ./
RUN mvn dependency:go-offline

COPY . ./
RUN mvn package -DfinalName=app

FROM openjdk:11-jre
EXPOSE 8080
WORKDIR /app

COPY --from=build-env /app/target/app.jar ./app.jar
CMD ["/usr/bin/java", "-jar", "/app/app.jar"]