#!/bin/bash

cd $HOME

# Get necessary packages
apt install wget unzip openjdk-19-jdk android-sdk-platform-tools-common -y

# Get node
mkdir -p /etc/apt/keyrings
curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key | gpg --dearmor -o /etc/apt/keyrings/nodesource.gpg
echo "deb [signed-by=/etc/apt/keyrings/nodesource.gpg] https://deb.nodesource.com/node_21.x nodistro main" | tee /etc/apt/sources.list.d/nodesource.list
apt update
apt install nodejs npm -y

# Install and set up command line tools
wget https://dl.google.com/android/repository/commandlinetools-linux-10406996_latest.zip
unzip commandlinetools-linux-10406996_latest.zip
mkdir -p android_sdk/cmdline-tools/latest
mv cmdline-tools/* android_sdk/cmdline-tools/latest
sudo usermod -aG plugdev $LOGNAME

# Install platform tools
android_sdk/cmdline-tools/latest/bin/sdkmanager --install "platform-tools"

# Link adb and set ANDROID_HOME
ln -sf $HOME/android_sdk/platform-tools/adb /usr/bin/adb
echo "export ANDROID_HOME=$HOME/android_sdk" >> ~/.bashrc

# Install appium
npm install appium -g
appium driver install uiautomator2

# Get maven
wget https://dlcdn.apache.org/maven/maven-3/3.9.5/binaries/apache-maven-3.9.5-bin.tar.gz
tar -xvf apache-maven-3.9.5-bin.tar.gz
mv apache-maven-3.9.5 /opt/
echo "export PATH=$PATH:/opt/apache-maven-3.9.5/bin"

. ~/.bashrc
