#!/bin/bash
sudo apt update && sudo apt install -y nano sudo curl wget
sudo wget https://raw.githubusercontent.com/Raxon24/Nextcloud/main/ads.sh
sudo wget https://raw.githubusercontent.com/Raxon24/Nextcloud/main/svng.sh
sudo wget https://raw.githubusercontent.com/Raxon24/Nextcloud/main/db.sh
sudo wget https://raw.githubusercontent.com/Raxon24/Nextcloud/main/next.sh
sleep 5
sudo bash ads.sh && sudo nano db.sh
#sleep 5
#sudo nano db.sh
sudo bash svng.sh
sleep 10
sudo bash db.sh
sleep 3
sudo bash next.sh
sleep 10
sudo apt update
sudo rm ads.sh svng.sh db.sh next.sh
#sudo wget -O - https://raw.githubusercontent.com/Raxon24/Nextcloud/main/ncpgsql.sh | sh
