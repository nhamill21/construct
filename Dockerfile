FROM openjdk:11
RUN apt-get update -y && apt-get install -y maven \
    && mkdir -p /tmp/construct/src
COPY ./src/ /tmp/construct/src/
COPY ./Dockerfile /tmp/construct/
COPY ./pom.xml /tmp/construct/
WORKDIR /tmp/construct
EXPOSE 8080
ENTRYPOINT mvn clean install spring-boot:repackage && java -jar target/construct.jar
