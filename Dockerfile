FROM gradle:8.11.1 as build
WORKDIR /app
COPY . .

RUN ./gradlew bootJar
FROM openjdk:21-jdk
EXPOSE 8080
WORKDIR /app
COPY --from=build /build/libs/spring-render-0.0.1-SNAPSHOT.jar app.jar
ENTRYPOINT java -jar springdeskcurso.jar