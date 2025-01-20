# FROM gradle:8.11.1 as build
# WORKDIR /app
# COPY . .

# RUN ./gradlew bootJar
# FROM openjdk:21-jdk
# EXPOSE 8080
# COPY --from=build ./build/libs/spring-render-0.0.1-SNAPSHOT.jar ./app.jar
# ENTRYPOINT java -jar app.jar

#
# Build stage
#
FROM gradle:8.11.1 as build
COPY --chown=gradle:gradle . /home/gradle/src
WORKDIR /home/gradle/src
RUN gradle build --no-daemon

#
# Package stage
#
FROM openjdk:21-jdk
#COPY --from=build /home/gradle/src/build/libs/docker-0.0.1-SNAPSHOT.jar app.jar
COPY --from=build /home/gradle/src/build/libs/spring-render-0.0.1-SNAPSHOT.jar app.jar
ENTRYPOINT ["java","-jar","/app.jar"]