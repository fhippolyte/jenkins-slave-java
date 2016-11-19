# This Dockerfile is used to build an image containing basic stuff to be used as a Jenkins slave build node.

FROM ubuntu:16.10 
MAINTAINER Fabien Hippolyte <fhippolyte@gmail.com>


#### Installs ANT
ENV PATH ${PATH}:/opt/ant/bin:/opt/jdk8/jdk1.8.0_101/bin

#### Define commonly used JAVA_HOME variable
ENV JAVA_HOME /opt/jdk8/jdk1.8.0_101 

#### MAVEN 3
ENV MAVEN_HOME /opt/maven


COPY slave.jar /slave.jar
COPY startJenkinsSlave.sh /startJenkinsSlave.sh


RUN apt-get update \
 && apt-get install \
 && apt-get -y install wget curl git \
#JDK8
 && mkdir /opt/jdk8 \
 && wget --no-check-certificate --no-cookies --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/8u101-b13/jdk-8u101-linux-x64.tar.gz \
 && tar -xvzf jdk-8u101-linux-x64.tar.gz -C /opt/jdk8 \
 && ls /opt/jdk8 \
 && chmod +x -R /opt/jdk8 \
 && rm jdk-8u101-linux-x64.tar.gz \
#MAVEN 3
 && wget --no-verbose -O /tmp/apache-maven-3.2.2.tar.gz http://archive.apache.org/dist/maven/maven-3/3.2.2/binaries/apache-maven-3.2.2-bin.tar.gz \
 && tar xzf /tmp/apache-maven-3.2.2.tar.gz -C /opt/ \
 && ln -s /opt/apache-maven-3.2.2 /opt/maven \
 && ln -s /opt/maven/bin/mvn /usr/local/bin \
 && rm -f /tmp/apache-maven-3.2.2.tar.gz \
#Jenkins slave
 && chmod +x /startJenkinsSlave.sh \
 && chmod +x /slave.jar \
 && mkdir /workspace_jenkins 



CMD /startJenkinsSlave.sh
