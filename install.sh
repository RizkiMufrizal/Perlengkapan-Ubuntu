#!/bin/sh
#
# install.sh
# Copyright (C) 2016 Rizki Mufrizal <mufrizalrizki@gmail.com>
#
# Distributed under terms of the MIT license.
#

sudo add-apt-repository -y ppa:saiarcot895/myppa
sudo apt update
sudo apt install -y apt-fast

sudo add-apt-repository -y ppa:no1wantdthisname/ppa
sudo apt-fast update
sudo apt-fast install -y libfreetype6 fontconfig-infinality
sudo rm /etc/fonts/conf.avail/52-infinality.conf
sudo ln -s /etc/fonts/infinality/infinality.conf /etc/fonts/conf.avail/52-infinality.conf

echo "tambah repo java 8"
sudo add-apt-repository -y ppa:no1wantdthisname/openjdk-fontfix
sudo add-apt-repository -y ppa:openjdk-r/ppa

echo "tambah repo git"
sudo add-apt-repository -y ppa:git-core/ppa

echo "tambah repo atom"
sudo add-apt-repository -y ppa:webupd8team/atom

echo "tambah repo chromium browser"
sudo add-apt-repository -y ppa:canonical-chromium-builds/stage

echo "tambah repo firefox developer"
sudo add-apt-repository -y ppa:ubuntu-mozilla-daily/firefox-aurora

echo "tambah repo gimp"
sudo add-apt-repository -y ppa:otto-kesselgulasch/gimp

echo "tambah repo libree office"
sudo add-apt-repository -y ppa:libreoffice/ppa

echo "tambah repo vlc"
sudo add-apt-repository -y ppa:videolan/stable-daily

echo "tambah repo php7"
sudo add-apt-repository -y ppa:ondrej/php

echo "tambah repo apache server"
sudo add-apt-repository -y ppa:ondrej/apache2

echo "tambah repo clementine"
sudo add-apt-repository -y ppa:me-davidsansome/clementine

echo "tambah repo sublime text"
sudo add-apt-repository -y ppa:webupd8team/sublime-text-3

echo "tambah repo gcc"
sudo add-apt-repository -y ppa:ubuntu-toolchain-r/test

echo "tambah repo mariadb"
sudo apt-fast install -y software-properties-common
sudo apt-key adv --recv-keys --keyserver hkp://keyserver.ubuntu.com:80 0xF1656F24C74CD1D8
sudo add-apt-repository 'deb [arch=amd64,i386] http://kartolo.sby.datautama.net.id/mariadb/repo/10.1/ubuntu xenial main'

echo "tambah repo postgresql"
echo "deb http://apt.postgresql.org/pub/repos/apt/ xenial-pgdg main" | sudo tee /etc/apt/sources.list.d/pgdg.list
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | \
sudo apt-key add -

echo "update"
sudo apt-fast update

echo "upgrade"
sudo apt-fast upgrade -y

echo "dist-upgrade"
sudo apt-fast dist-upgrade -y

echo "Konfigurasi Mariadb"
sudo apt-get install -y debconf-utils
echo mariadb-server-10.1 mysql-server/root_password password root | sudo debconf-set-selections
echo mariadb-server-10.1 mysql-server/root_password_again password root | sudo debconf-set-selections

echo "install aplikasi"
sudo apt-fast install -y zsh mariadb-server mariadb-client atom chromium-browser git gimp vlc browser-plugin-vlc openjdk-8-jdk openjdk-8-jre icedtea-8-plugin icedtea-plugin postgresql-9.5 postgresql-contrib libpq-dev pgadmin3 gimp-data gimp-plugin-registry gimp-data-extras apache2 php7.0-cli php7.0-mysql php7.0-fpm php7.0-gd php7.0 libapache2-mod-php7.0 php7.0-mcrypt php7.0-common php7.0-snmp snmp php7.0-curl php7.0-json php7.0-pgsql php7.0-mbstring php7.0-zip php7.0-xmlrpc php7.0-cgi php-pear php7.0-dev php7.0-imap clementine xclip sublime-text-installer vim zip unzip lib32ncurses5 lib32gomp1 lib32z1-dev

echo "konfigurasi php"
sudo chmod 777 -R /var/www/*
echo "<?php phpinfo();" | sudo tee -a /var/www/html/info.php
sudo systemctl restart apache2
