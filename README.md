# mac_software_installations
---
## Install Homebrew
```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" && echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile && eval "$(/opt/homebrew/bin/brew shellenv)"
```
---
## Install git
```bash
brew install git
```
---
## Install java 17
```bash
brew install openjdk@17\n
sudo ln -sfn $(brew --prefix openjdk@17)/libexec/openjdk.jdk /Library/Java/JavaVirtualMachines/openjdk-17.jdk\necho 'export PATH="/usr/local/opt/openjdk@17/bin:$PATH"' >> ~/.zprofile\necho 'export JAVA_HOME="$(/usr/libexec/java_home -v 17)"' >> ~/.zprofile\nsource ~/.zprofile\n
java --version
```
- or
```bash
brew install openjdk@17 && sudo ln -sfn $(brew --prefix openjdk@17)/libexec/openjdk.jdk /Library/Java/JavaVirtualMachines/openjdk-17.jdk && echo 'export PATH="/usr/local/opt/openjdk@17/bin:$PATH"' >> ~/.zprofile && echo 'export JAVA_HOME="$(/usr/libexec/java_home -v 17)"' >> ~/.zprofile && source ~/.zprofile && java --version
```
---
## Install maven
```bash
download apache-maven-3.9.9-bin.tar.gz
tar -zxvf apache-maven-3.9.9-bin.tar.gz
copy the path --> ~/Downloads/apache-maven-3.9.9/bin
export PATH=/Users/tarun/Downloads/apache-maven-3.9.9/bin:$PATH >> .zshrc
mvn --version
```
- or
```bash
curl -O https://dlcdn.apache.org/maven/maven-3/3.9.9/binaries/apache-maven-3.9.9-bin.tar.gz && tar -zxvf apache-maven-3.9.9-bin.tar.gz -C ~/Downloads && echo 'export PATH=~/Downloads/apache-maven-3.9.9/bin:$PATH' >> ~/.zshrc && source ~/.zshrc && mvn --version
```
---
## Install jenkins
- https://www.jenkins.io/download/lts/macos/
```bash
brew install jenkins-lts
brew services start jenkins-lts
```
- `localhost:8080`
- or
```bash
brew install jenkins-lts && brew services start jenkins-lts && echo "Jenkins is running on http://localhost:8080"
```