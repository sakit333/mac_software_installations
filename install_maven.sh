#!/bin/bash

curl -O https://dlcdn.apache.org/maven/maven-3/3.9.9/binaries/apache-maven-3.9.9-bin.tar.gz &&
tar -zxvf apache-maven-3.9.9-bin.tar.gz -C ~/Downloads &&
echo 'export PATH=~/Downloads/apache-maven-3.9.9/bin:$PATH' >> ~/.zshrc &&
source ~/.zshrc &&
mvn --version
