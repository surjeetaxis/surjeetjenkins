FROM openjdk:11
EXPOSE 8081
ADD target/surjeetjenkins-0.0.1-SNAPSHOT.jar surjeetjenkins-0.0.1-SNAPSHOT.jar
ENTRYPOINT ["java","-jar","/surjeetjenkins-0.0.1-SNAPSHOT.jar"]
