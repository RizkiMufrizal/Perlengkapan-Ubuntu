#!/bin/sh
#
# perlengkapan.sh
# Copyright (C) 2016 Rizki Mufrizal <mufrizalrizki@gmail.com>
#
# Distributed under terms of the MIT license.
#

echo -n "masukkan user linux anda : "
read user

echo "download netbeans"
wget http://download.netbeans.org/netbeans/8.1/final/bundles/netbeans-8.1-linux.sh

echo "download vagrant"
wget https://releases.hashicorp.com/vagrant/1.8.1/vagrant_1.8.1_x86_64.deb
sudo dpkg -i vagrant_1.8.1_x86_64.deb
rm -rf vagrant_1.8.1_x86_64.deb

echo "download spring tool suite"
mkdir -p /home/$user/programming/IDE/sts/
wget http://dist.springsource.com/release/STS/3.7.3.RELEASE/dist/e4.6/spring-tool-suite-3.7.3.RELEASE-e4.6-linux-gtk-x86_64.tar.gz
tar -xvzf spring-tool-suite-3.7.3.RELEASE-e4.6-linux-gtk-x86_64.tar.gz
mv sts-bundle/* /home/$user/programming/IDE/sts/
rmdir sts-bundle/

echo "download visual studio code"
mkdir -p /home/$user/programming/IDE/VSCode/
wget https://az764295.vo.msecnd.net/stable/fa6d0f03813dfb9df4589c30121e9fcffa8a8ec8/vscode-amd64.deb
sudo dpkg -i vscode-amd64.deb
rm -rf vscode-amd64.deb

echo "download android studio"
mkdir -p /home/$user/programming/IDE/android-studio/
wget https://dl.google.com/dl/android/studio/ide-zips/2.0.0.20/android-studio-ide-143.2739321-linux.zip
unzip android-studio-ide-143.2739321-linux.zip
mv android-studio/* /home/$user/programming/IDE/android-studio/
rmdir android-studio/

echo "download gitbook editor"
wget http://downloads.editor.gitbook.com/download/linux-64-bit?user=$usermufrizal

echo "download phpmyadmin"
wget https://files.phpmyadmin.net/phpMyAdmin/4.6.0/phpMyAdmin-4.6.0-all-languages.zip
mkdir -p /var/www/html/phpmyadmin/
unzip phpMyAdmin-4.6.0-all-languages.zip
mv phpMyAdmin-4.6.0-all-languages/* /var/www/html/phpmyadmin/
rmdir phpMyAdmin-4.6.0-all-languages

echo "download jaspertsoft studio"
mkdir -p /home/$user/programming/IDE/TIBCOJaspersoftStudio/
wget http://tenet.dl.sourceforge.net/project/jasperstudio/JaspersoftStudio-6.2.1/TIBCOJaspersoftStudio-6.2.1.final-linux-x86_64.tgz
tar -xvzf TIBCOJaspersoftStudio-6.2.1.final-linux-x86_64.tgz
mv TIBCOJaspersoftStudio-6.2.1.final/* /home/$user/programming/IDE/TIBCOJaspersoftStudio/

echo "download redis"
mkdir -p /home/$user/programming/database/redis
wget http://download.redis.io/releases/redis-3.0.7.tar.gz
tar xzf redis-3.0.7.tar.gz
mv redis-3.0.7/* /home/$user/programming/database/redis/
cd /home/$user/programming/database/redis/
make
make test
cd
rmdir redis-3.0.7