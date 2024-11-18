#!/bin/bash

brew install openjdk@17 &&
sudo ln -sfn $(brew --prefix openjdk@17)/libexec/openjdk.jdk /Library/Java/JavaVirtualMachines/openjdk-17.jdk &&
echo 'export PATH="/usr/local/opt/openjdk@17/bin:$PATH"' >> ~/.zprofile &&
echo 'export JAVA_HOME="$(/usr/libexec/java_home -v 17)"' >> ~/.zprofile &&
source ~/.zprofile &&
java --version
