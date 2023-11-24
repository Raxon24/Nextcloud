# Nextcloud
### Install NextCloud On Debian 12 or Ubuntu 22.04 LTS – Complete Guide

- Create DATABASE Credentials and Nextcloud web access Login access

 Create DB option 1
 
      export NC_DBUSER=replace_for_DB_user
      export NC_DBPASS=you_DB_password
      export NC_DBNAME=you_DB_name

Set web Login access credential
      
      export NC_WEB_ADMIN_USER=replace_for_web_admin_user
      export NC_WEB_ADMIN_PASS=you_web_admin_password
  

 Create DB options 2

    sudo wget -O - https://raw.githubusercontent.com/Raxon24/Nextcloud/main/credentials.sh | sh

 


- Install

      sudo wget -O - https://raw.githubusercontent.com/Raxon24/Nextcloud/main/ncpgsql.sh | sh
---------------------------------------------------------------------------------------------------------------------------
 - Set Postgesql database user  password replase secret123  for you secret password keep inside sample --> 'youpasswd'

       ALTER ROLE nextcloud WITH PASSWORD 'secret123';
 - i use defauld dadabase name and database user 

  database_name = nextcloud
  
  database_user = nextcloud
  
  database_pwd = password_you _select
