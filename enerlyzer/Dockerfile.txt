FROM maven:latest
RUN yum install git -y
RUN mkdir /usr/src/temp \ 
	cd /usr/src/temp \ 
	git clone https://github.com/philippEder/enerlyzer.git \
	cd target
	
RUN mvn clean install

EXPOSE 8080
ADD enerlyzer-0.0.1-SNAPSHOT.jar enerlyzer.jar
ENTRYPOINT ["java", "-jar", "enerlyzer.jar"]