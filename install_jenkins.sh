#!/bin/bash

brew install jenkins-lts &&
brew services start jenkins-lts &&
echo "Jenkins is running on http://localhost:8080"
