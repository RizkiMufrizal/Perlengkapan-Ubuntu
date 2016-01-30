#! /bin/sh
#
# programming.sh
# Copyright (C) 2016 Rizki Mufrizal <mufrizalrizki@gmail.com>
#
# Distributed under terms of the MIT license.
#

echo -n "masukkan user linux anda : "
read user

echo "buat folder programming"
mkdir programming

echo "buat folder build tool"
mkdir -p /home/$user/programming/build-tool

echo "install maven"
mkdir -p /home/$user/programming/build-tool/apache-maven
wget http://mirror.wanxp.id/apache/maven/maven-3/3.3.9/binaries/apache-maven-3.3.9-bin.tar.gz
tar -xvzf apache-maven-3.3.9-bin.tar.gz
rm apache-maven-3.3.9-bin.tar.gz
mv apache-maven-3.3.9/* /home/$user/programming/build-tool/apache-maven/
rmdir apache-maven-3.3.9/

echo "install ant"
mkdir -p /home/$user/programming/build-tool/apache-ant
wget http://mirror.wanxp.id/apache//ant/binaries/apache-ant-1.9.6-bin.tar.gz
tar -xvzf apache-ant-1.9.6-bin.tar.gz
rm apache-ant-1.9.6-bin.tar.gz
mv apache-ant-1.9.6/* /home/$user/programming/build-tool/apache-ant/
rmdir apache-ant-1.9.6/

echo "install gradle"
mkdir -p /home/$user/programming/build-tool/gradle
wget https://downloads.gradle.org/distributions/gradle-2.10-all.zip
unzip gradle-2.10-all.zip
rm gradle-2.10-all.zip
mv gradle-2.10/* /home/$user/programming/build-tool/gradle/
rmdir gradle-2.10/

echo "install composer"
mkdir -p /home/$user/programming/build-tool/composer
curl -sS https://getcomposer.org/installer | php
mv composer.phar /home/$user/programming/build-tool/composer/

echo "install play framework"
mkdir -p /home/$user/programming/build-tool/play-framework
wget https://downloads.typesafe.com/typesafe-activator/1.3.7/typesafe-activator-1.3.7-minimal.zip
unzip typesafe-activator-1.3.7-minimal.zip
rm typesafe-activator-1.3.7-minimal.zip
mv activator-1.3.7-minimal/* /home/$user/programming/build-tool/play-framework/
rmdir activator-1.3.7-minimal/

echo "install node js"
wget -qO- https://raw.githubusercontent.com/creationix/nvm/v0.30.2/install.sh | bash

echo "install ruby"
gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
\curl -sSL https://get.rvm.io | bash -s stable --ruby

exec bash --login
