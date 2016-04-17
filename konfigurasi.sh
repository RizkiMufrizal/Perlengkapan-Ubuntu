#!/bin/sh
#
# konfigurasi.sh
# Copyright (C) 2016 Rizki Mufrizal <mufrizalrizki@gmail.com>
#
# Distributed under terms of the MIT license.
#

echo -n "masukkan username github anda : "
read username
echo -n "masukkan email github anda : "
read email
echo -n "masukkan user linux anda : "
read user

echo "install node js"
nvm install stable
npm install -g bower coffeelint coffee-script cordova generator-angular generator-karma grunt-cli gulp http-server ionic jspm lite-server mean-cli mocha nodemon react-native-cli sails typescript webpack webpack-dev-server yo

echo "konfigurasi git"
git config --global user.name "$username"
git config --global user.email "$email"
git config --global color.ui true
ssh-keygen -t rsa -C "$email"

echo "konfigurasi environment"
touch environment
echo "ANT_HOME=/home/$user/programming/build-tool/apache-ant" | tee -a /home/$user/environment
echo "ANDROID_HOME=/home/$user/Android/Sdk" | tee -a /home/$user/environment
echo "M2_HOME=/home/$user/programming/build-tool/apache-maven" | tee -a /home/$user/environment
echo "GRADLE_HOME=/home/$user/programming/build-tool/gradle" | tee -a /home/$user/environment
echo "JAVA_HOME=/usr/lib/jvm/java-8-oracle" | tee -a /home/$user/environment
echo "PLAY_HOME=file:/home/$user/programming/build-tool/play-framework" | tee -a /home/$user/environment
echo "COMPOSER_HOME=/home/$user/programming/build-tool/composer" | tee -a /home/$user/environment
echo "NVM_HOME=/home/$user/.nvm" | tee -a /home/$user/environment
echo "REDIS_HOME=/home/$user/programming/database/redis" | tee -a /home/$user/environment
echo "RVM_HOME=/home/$user/.rvm" | tee -a /home/$user/environment
echo "\nPATH=\"/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/usr/lib/jvm/java-8-oracle/bin:/home/$user/programming/build-tool/apache-ant/bin:/home/$user/programming/build-tool/apache-maven/bin:/home/$user/programming/build-tool/gradle/bin:/home/$user/programming/build-tool/play-framework/bin:/home/$user/programming/build-tool/composer:/home/$user/.nvm:/home/$user/Android/Sdk/platform-tools:/home/$user/Android/Sdk/tools:/home/$user/.rvm/bin:file:/home/$user/programming/database/redis/src\"" | tee -a /home/$user/environment
sudo cp environment /etc/environment

echo "konfigurasi shortcut"
sudo cp shortcut/* /usr/share/applications/
sudo chmod a+x /usr/share/applications/Android\ Studio.desktop
sudo chmod a+x /usr/share/applications/Jaspersoft\ Studio.desktop
sudo chmod a+x /usr/share/applications/Spring\ Tool\ Suite.desktop
sudo chmod a+x /usr/share/applications/Visual\ Studio\ Code.desktop

echo "konfigurasi gcc dan g++"
sudo update-alternatives --remove-all gcc
sudo update-alternatives --remove-all g++

sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-5 20
sudo update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-5 20

sudo update-alternatives --config gcc
sudo update-alternatives --config g++
