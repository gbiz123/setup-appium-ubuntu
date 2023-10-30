#!/bin/bash

cd $HOME

# Get necessary packages
apt install wget unzip openjdk-19-jdk -y

# Install and set up command line tools
wget https://dl.google.com/android/repository/commandlinetools-linux-10406996_latest.zip
unzip commandlinetools-linux-10406996_latest.zip
mkdir -p android_sdk/cmdline-tools/latest
mv cmdline-tools/* android_sdk/cmdline-tools/latest

# Install platform tools
android_sdk/cmdline-tools/latest/bin/sdkmanager --install "platform-tools"

# Link adb and set ANDROID_HOME
ln -sf $HOME/android_sdk/platform-tools/adb /usr/bin/adb
echo "export ANDROID_HOME=$HOME/android_sdk" >> ~/.bashrc
