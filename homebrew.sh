#!/bin/bash

curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh &&
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile &&
eval "$(/opt/homebrew/bin/brew shellenv)"
