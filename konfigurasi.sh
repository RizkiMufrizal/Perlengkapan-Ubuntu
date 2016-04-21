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
touch /home/$user/environment
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
sudo cp /home/$user/environment /etc/environment

echo "konfigurasi shortcut"

echo "konfigurasi shortcut android studio"
touch /home/$user/Android\ Studio.desktop
echo "#!/usr/bin/env xdg-open" | tee -a /home/$user/Android\ Studio.desktop
echo "[Desktop Entry]" | tee -a /home/$user/Android\ Studio.desktop
echo "Version=1.0" | tee -a /home/$user/Android\ Studio.desktop
echo "Type=Application" | tee -a /home/$user/Android\ Studio.desktop
echo "Terminal=false" | tee -a /home/$user/Android\ Studio.desktop
echo "Icon[en_US]=/home/$user/programming/IDE/android-studio/bin/studio.png" | tee -a /home/$user/Android\ Studio.desktop
echo "Name[en_US]=Android Studio" | tee -a /home/$user/Android\ Studio.desktop
echo "Name=Android Studio" | tee -a /home/$user/Android\ Studio.desktop
echo "Icon=/home/$user/programming/IDE/android-studio/bin/studio.png" | tee -a /home/$user/Android\ Studio.desktop

echo "konfigurasi shortcut Jaspersoft studio"
touch /home/$user/Jaspersoft\ Studio.desktop
echo "#!/usr/bin/env xdg-open" | tee -a /home/$user/Jaspersoft\ Studio.desktop
echo "[Desktop Entry]" | tee -a /home/$user/Jaspersoft\ Studio.desktop
echo "Version=1.0" | tee -a /home/$user/Jaspersoft\ Studio.desktop
echo "Type=Application" | tee -a /home/$user/Jaspersoft\ Studio.desktop
echo "Terminal=false" | tee -a /home/$user/Jaspersoft\ Studio.desktop
echo "Icon[en_US]=/home/$user/programming/IDE/TIBCOJaspersoftStudio/icon.xpm" | tee -a /home/$user/Jaspersoft\ Studio.desktop
echo "Name[en_US]=Jaspersoft Studio" | tee -a /home/$user/Jaspersoft\ Studio.desktop
echo "Name=Jaspersoft Studio" | tee -a /home/$user/Jaspersoft\ Studio.desktop
echo "Icon=/home/$user/programming/IDE/TIBCOJaspersoftStudio/icon.xpm" | tee -a /home/$user/Jaspersoft\ Studio.desktop

echo "konfigurasi shortcut Spring tools Suite"
touch /home/$user/Spring\ Tool\ Suite.desktop
echo "#!/usr/bin/env xdg-open" | tee -a /home/$user/Spring\ Tool\ Suite.desktop
echo "[Desktop Entry]" | tee -a /home/$user/Spring\ Tool\ Suite.desktop
echo "Version=1.0" | tee -a /home/$user/Spring\ Tool\ Suite.desktop
echo "Type=Application" | tee -a /home/$user/Spring\ Tool\ Suite.desktop
echo "Terminal=false" | tee -a /home/$user/Spring\ Tool\ Suite.desktop
echo "Icon[en_US]=/home/$user/programming/IDE/sts/sts-3.7.2.RELEASE/icon.xpm" | tee -a /home/$user/Spring\ Tool\ Suite.desktop
echo "Name[en_US]=Spring Tool Suite" | tee -a /home/$user/Spring\ Tool\ Suite.desktop
echo "Name=Spring Tool Suite" | tee -a /home/$user/Spring\ Tool\ Suite.desktop
echo "Icon=/home/$user/programming/IDE/sts/sts-3.7.2.RELEASE/icon.xpm" | tee -a /home/$user/Spring\ Tool\ Suite.desktop

sudo mv /home/$user/Android\ Studio.desktop /usr/share/applications/
sudo mv /home/$user/Jaspersoft\ Studio.desktop /usr/share/applications/
sudo mv /home/$user/Spring\ Tool\ Suite.desktop /usr/share/applications/

sudo chmod a+x /usr/share/applications/Android\ Studio.desktop
sudo chmod a+x /usr/share/applications/Jaspersoft\ Studio.desktop
sudo chmod a+x /usr/share/applications/Spring\ Tool\ Suite.desktop

echo "konfigurasi gcc dan g++"
sudo update-alternatives --remove-all gcc
sudo update-alternatives --remove-all g++

sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-5 20
sudo update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-5 20

sudo update-alternatives --config gcc
sudo update-alternatives --config g++