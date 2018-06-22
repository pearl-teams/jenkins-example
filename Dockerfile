FROM java:8

WORKDIR /

ADD target/jenkins-example.jar jenkins-example.jar
EXPOSE 8080

CMD java - jar jenkins-example-0.0.1.jar