
# mvn package docker:build :- docker build command
# tcp://localhost:2375 :- Enable the Expose daemon without TLS

#FROM openjdk:11
FROM java:11
EXPOSE 8080
VOLUME /tmp
ADD target/smartcontactmanager.jar smartcontactmanager.jar
#ADD dockerapp-0.0.1-SNAPSHOT.jar app.jar
RUN bash -c 'touch /smartcontactmanager.jar'
# ENTRYPOINT ["java","-jar","/smartcontactmanager.jar"]
ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-jar","/app.jar"]
USER spring:spring
ARG JAR_FILE=target/*.jar

