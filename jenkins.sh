#!/bin/bash   #shebang

#variables
USERID=$(id -u)

#conditions
if [ $? -eq 0]; then
   echo "login as sudo user"
   exit 1
else 
   echo "you need to be root user to execute this script"
fi

yum update -y

if [ $? -eq 0]; then
   echo "yum update is success"
   exit 1
else
   echo "yum update is failed"
fi

##### add the jenkins repo ###
wget -O /etc/yum.repos.d/jenkins.repo \
    https://pkg.jenkins.io/redhat-stable/jenkins.repo

if [ $? -eq 0]; then
   echo "added the jenkins repo successfully"
   exit 1
else
   echo "jenkins repo failed"
fi

#### Import key ###
rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key

if [ $? -ne 0 ]; then
        echo "Imported key failure"
        exit 1
else
        echo "Imported key success"
fi

yum upgrade -y

if [ $? -ne 0 ]; then
        echo "yum upgrade failed"
        exit 1
else
        echo "yum upgrade success"
fi

amazon-linux-extras install java-openjdk11 -y
if [ $? -ne 0 ]; then
        echo "java installation failed"
        exit 1
else
        echo "Java installation success"

fi


yum install jenkins -y

if [ $? -ne 0 ]; then
        echo "jenkins installation failed"
        exit 1
else
        echo "Jenkins installation success"

fi

systemctl start jenkins

if [ $? -ne 0 ]; then
        echo "jenkins start failed"
        exit 1
else
        echo "Jenkins start success"

fi

