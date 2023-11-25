#! /bin/bash
sudo apt update && sudo apt install -y nano sudo curl wget
sudo wget https://raw.githubusercontent.com/Raxon24/Nextcloud/main/ads.sh
sudo wget https://raw.githubusercontent.com/Raxon24/Nextcloud/main/svng.sh
sudo wget https://github.com/Raxon24/Nextcloud/blob/main/db.md
sudo wget https://raw.githubusercontent.com/Raxon24/Nextcloud/main/next.sh
sleep 5
sudo bash ads.sh
cat db.md
sleep 5
sudo nano db.md
cat db.md
read -r -p "Would you like to edit any missed info? <y/N> " prompt
if [[ "${prompt,,}" =~ ^(y|yes)$ ]]; then
  echo "${lightyellow}${bold} Edit Database"
  echo "$normal"
  $STD sudo nano db.md
  echo "${green}${bold} "Edit Complete"
  echo "$normal"
  sleep 3
fi
mv db.md db.sh
bash db.sh
sleep 5
sudo bash svng.sh
sleep 10
sudo bash db.sh
sleep 3
sudo bash next.sh
sleep 10
sudo apt update
sudo rm ads.sh svng.sh db.sh next.sh
#sudo wget -O - https://raw.githubusercontent.com/Raxon24/Nextcloud/main/ncpgsql.sh | sh
