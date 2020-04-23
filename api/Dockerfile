FROM maven:3-jdk-8-slim as builder
WORKDIR /app/code
COPY ./ ./
RUN mvn -DskipTests install
#RUN mvn clean install
ARG JAR_FILE=target/*.jar
RUN cp ${JAR_FILE} /app/app.jar
#EXPOSE 8080
#ENTRYPOINT ["java","-jar","/app/app.jar"]

FROM openjdk
EXPOSE 8080
WORKDIR /app
COPY --from=builder /app/app.jar /app
ENTRYPOINT ["java","-jar","/app/app.jar"]