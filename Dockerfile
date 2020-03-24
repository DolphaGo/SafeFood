FROM openjdk:8-jre
COPY target/SafeFood-*.war app.war
ENTRYPOINT ["java","-jar","app.war"]
