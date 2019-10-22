FROM java:8-jdk

MAINTAINER Mallikarjuna Mudiam <mallikarjuna.mudiam@gmail.com>

ENV WIREMOCK_VERSION 2.23.2

#Grab wiremock standalone jar
RUN mkdir -p /var/wiremock/lib/ \
  && wget https://repo1.maven.org/maven2/com/github/tomakehurst/wiremock-standalone/${WIREMOCK_VERSION}/wiremock-standalone-$WIREMOCK_VERSION.jar \
    -O /var/wiremock/lib/wiremock-standalone.jar
RUN mkdir /home/wiremock
RUN cp /var/wiremock/lib/wiremock-standalone.jar /home/wiremock/

WORKDIR /home/wiremock

COPY docker-entrypoint.sh /
COPY mocks/** __files/
COPY mappings/** mappings/

EXPOSE 8080

ENTRYPOINT ["java", "-jar", "wiremock-standalone.jar" ,"--global-response-templating"]
