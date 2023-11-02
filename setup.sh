#!/bin/bash

cd $HOME

# Get necessary packages
apt install wget unzip openjdk-19-jdk android-sdk-platform-tools-common curl -y

# Get node/npm
curl https://raw.githubusercontent.com/creationix/nvm/master/install.sh | bash
. ~/.bashrc
nvm install 20.6.1
nvm use 20.6.1

# Install and set up command line tools
yes | wget https://dl.google.com/android/repository/commandlinetools-linux-10406996_latest.zip
unzip commandlinetools-linux-10406996_latest.zip
mkdir -p android_sdk/cmdline-tools/latest
mv cmdline-tools/* android_sdk/cmdline-tools/latest
sudo usermod -aG plugdev $LOGNAME

# Install platform tools
android_sdk/cmdline-tools/latest/bin/sdkmanager --install "platform-tools;34.0.0"
android_sdk/cmdline-tools/latest/bin/sdkmanager --install "build-tools;34.0.0"

# Link adb and set ANDROID_HOME
ln -sf $HOME/android_sdk/platform-tools/adb /usr/bin/adb
echo "export ANDROID_HOME=$HOME/android_sdk" >> ~/.bashrc

# Install appium
npm install appium@2.1.3 -g
appium driver install uiautomator2

# Get maven
wget https://dlcdn.apache.org/maven/maven-3/3.9.5/binaries/apache-maven-3.9.5-bin.tar.gz
tar -xvf apache-maven-3.9.5-bin.tar.gz
mv apache-maven-3.9.5 /opt/
echo "export PATH=$PATH:/opt/apache-maven-3.9.5/bin" >> ~/.bashrc

. ~/.bashrc
