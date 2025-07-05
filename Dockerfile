FROM openjdk:11.0.1-jre-slim-stretch
EXPOSE 8182
#ECHO
#ARG JAR=spring-petclinic-2.7.0-SNAPSHOT.jar
#COPY target/$JAR /app.jar
ARG JAR=spring-petclinic-2.6.0.jar
COPY build/libs/*.jar /app.jar
COPY opentelemetry-javaagent.jar /opentelemetry-javaagent.jar
ENTRYPOINT ["java","-jar","/app.jar"]
#ENTRYPOINT ["java","-javaagent:/opentelemetry-javaagent.jar","-Dotel.exporter.otlp.traces.endpoint=http://agent:4317","-Dotel.service.name=pet-clinic","-Dotel.traces.exporter=otlp","-Djava.util.logging.config.file=logging.properties","-jar","/app.jar"]
