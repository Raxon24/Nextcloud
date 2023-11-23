# /bin/bash

# Install Required Packages
sudo apt-get update
sudo apt-get upgrade -y
sudo apt-get install -y software-properties-common curl git tuf htop btop lsb-release apt-transport-https ca-certificates
sudo apt-get install -y apache2 php8.2-fpm
sudo apt-get install -y redis-server
# sudo apt-get install -y mariadb-server && sudo systemctl enable redis-server && sudo systemctl start mariadb-server
# sudo apt-get install -y sudo libapache2-mod-php imagemagick php-imagick memcached libmemcached-tools php-memcached php-apcu php-gd php-mysql php-redis php-curl php-mbstring php-intl php-gmp php-bcmath php-xml php-bz2 php-zip php-ctype php-dom php-json php-posix zip unzip smbclient python3-certbot-apache
sudo apt-get install -y postgresql
sudo apt-get install -y sudo libapache2-mod-php php-pgsql php-pdo_pgsql php-redis imagemagick php-imagick memcached libmemcached-tools php-memcached php-apcu php-gd php-curl php-mbstring php-intl php-gmp php-bcmath php-xml php-bz2 php-zip php-ctype php-dom php-json php-posix zip unzip apc.enable_cli smbclient python3-certbot-apache

# enable services
#sudo systemctl enable mariadb && sudo systemctl start mariadb && sudo systemctl status mariadb
sudo systemctl enable postgresql && sudo systemctl start postgresql && sudo systemctl status postgresql
sleep 5
sudo systemctl enable apache2 && sudo systemctl start apache2 && sudo systemctl status apache2
sleep 5
sudo systemctl enable memcached && sudo systemctl start memcached && sudo systemctl status memcached
sleep 5
sudo systemctl enable php8.2-fpm && sudo systemctl start && sudo systemctl status php8.2-fpm
sleep 5
sudo systemctl enable redis-server && sudo systemctl start redis-server && sudo systemctl status redis-server

# Download apache proxy configurations
sudo wget https://raw.githubusercontent.com/Raxon24/Nextcloud/main/nextcloud.conf -P /etc/apache2/sites-available/
sudo mv /etc/apache2/sites-enabled/000-default.conf /etc/apache2/sites-enabled/000-default.conf.BAK
#sudo wget https://raw.githubusercontent.com/Raxon24/Nextcloud/main/000-default.conf -P /etc/apache2/sites-available/

# Enable apache modules and configurations
sudo a2dismod php8.2
sudo a2enconf php8.2-fpm
sudo a2ensite nextcloud.conf
sudo a2enmod headers rewrite mpm_event http2 mime proxy proxy_fcgi setenvif alias dir env ssl proxy_http proxy_wstunnel
sudo a2dismod mpm_prefork

#  Set UP APCu 
sudo mv /etc/php/8.2/fpm/conf.d/20-apcu.ini /etc/php/8.2/fpm/conf.d/20-apcu.ini.BAK
sudo wget https://raw.githubusercontent.com/Raxon24/Nextcloud/main/20-apcu.ini -P /etc/php/8.2/fpm/conf.d/


# Icrease memory & configure php-fmp
sudo sed -i 's/-m 64/-m 1024/' /etc/memcached.conf
sudo mv /etc/php/8.2/fpm/pool.d/www.conf /etc/php/8.2/fpm/pool.d/www.conf.BAK
sleep 10
sudo wget https://raw.githubusercontent.com/Raxon24/Nextcloud/main/www.conf -P /etc/php/8.2/fpm/pool.d/

# Configure Redis
sudo mv /etc/redis/redis.conf /etc/redis/redis.conf.BAK
sudo wget https://raw.githubusercontent.com/Raxon24/Nextcloud/main/redis.conf -P /etc/redis/
#sudo cp /etc/redis/redis.conf /etc/redis/redis.conf.BAK
#"unix:///var/run/redis/redis-server.sock?persistent=1&weight=1&database=0"
#sudo sed -i 's/# port 0/port 0/' /etc/redis/redis.conf
#sudo sed -i '155,156 s/^#//' /etc/redis/redis.conf
sudo usermod -a -G redis www-data

# setup MariaDB db
#mysql -U

#CREATE USER 'username'@'localhost' IDENTIFIED BY 'password';
#CREATE DATABASE IF NOT EXISTS nextcloud CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
#GRANT ALL PRIVILEGES ON nextcloud.* TO 'username'@'localhost';
#FLUSH PRIVILEGES;
#exit

# Setup postgresql db
#sudo -i -u postgres psql -c "CREATE USER nextcloud WITH PASSWORD 'nextcloud';"
#sudo -i -u postgres psql -c "CREATE DATABASE nextcloud OWNER nextcloud;"
sudo -u postgres psql

## Download Nextcloud latest release
sudo wget https://download.nextcloud.com/server/releases/latest.tar.bz2 -P /var/www/
sudo tar xvfj /var/www/latest.tar.bz2 -C /var/www/ && rm /var/www/latest.tar.bz2
sudo chown -R www-data:www-data /var/www/

cat << EOF >> /var/www/nextcloud/info.php
<?php phpinfo(); ?>
EOF


# restart services for reload configurations
sudo systemctl restart apache2
sudo systemctl restart memcached
sudo systemctl restart php8.2-fpm
#sudo systemctl restart mariadb
sudo systemctl restart postgresql
sudo systemctl restart redis-server




