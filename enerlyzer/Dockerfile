FROM centos:7
MAINTAINER Philipp Eder


RUN yum -y update
RUN yum install -y maven
RUN yum install -y git

#installing java manually because it seems that there is no yum repository availabe vor v 14
RUN curl -O https://download.java.net/java/GA/jdk14.0.2/205943a0976c4ed48cb16f1043c5c647/12/GPL/openjdk-14.0.2_linux-x64_bin.tar.gz && \
    tar -xvf openjdk-14.0.2_linux-x64_bin.tar.gz && \
    rm -fv openjdk-14.0.2_linux-x64_bin.tar.gz 

ENV JAVA_HOME /jdk-14.0.2
ENV PATH="${JAVA_HOME}/bin:${PATH}"


RUN mkdir /usr/src/temp1 && \ 
	cd /usr/src/temp1 && \ 
	git clone https://github.com/philippEder/enerlyzer.git 
	

RUN cd /usr/src/temp1/enerlyzer && mvn clean install

ADD target/enerlyzer-0.0.1-SNAPSHOT.jar enerlyzer.jar
ENTRYPOINT ["java", "-jar", "enerlyzer.jar"]
