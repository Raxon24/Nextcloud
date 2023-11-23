# Nextcloud
Install NextCloud On Debian 12 or Ubuntu 22.04 LTS – Complete Guide

- Install

      sudo wget -O https://raw.githubusercontent.com/Raxon24/Nextcloud/main/ncpgsql.sh | sudo sh

 - Set Postgesql database user  password replase secret123  for you secret password keep inside sample --> 'youpasswd'

       ALTER ROLE nextcloud WITH PASSWORD 'secret123';
 - i use defauld dadabase name and database user 

  database_name = nextcloud
  
  database_user = nextcloud
  
  database_pwd = password_you _select
