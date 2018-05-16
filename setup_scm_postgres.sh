#!/bin/bash
service postgresql start

#Cloudera Manager
sudo -u postgres psql -c "CREATE ROLE scm LOGIN PASSWORD 'scm'"
sudo -u postgres psql -c "CREATE DATABASE scm OWNER scm ENCODING 'UTF8' TEMPLATE template0"
/usr/share/cmf/schema/scm_prepare_database.sh postgresql scm scm scm

#Activity Monitor
sudo -u postgres psql -c "CREATE ROLE amon LOGIN PASSWORD 'amon'"
sudo -u postgres psql -c "CREATE DATABASE amon OWNER amon ENCODING 'UTF8' TEMPLATE template0"

#Reports Manager
sudo -u postgres psql -c "CREATE ROLE rman LOGIN PASSWORD 'rman'"
sudo -u postgres psql -c "CREATE DATABASE rman OWNER rman ENCODING 'UTF8' TEMPLATE template0"

#Hive Metastore Server
sudo -u postgres psql -c "CREATE ROLE hive LOGIN PASSWORD 'hive'"
sudo -u postgres psql -c "CREATE DATABASE metastore OWNER hive ENCODING 'UTF8' TEMPLATE template0"

#Sentry Server
sudo -u postgres psql -c "CREATE ROLE sentry LOGIN PASSWORD 'sentry'"
sudo -u postgres psql -c "CREATE DATABASE sentry OWNER sentry ENCODING 'UTF8' TEMPLATE template0"

#Cloudera Navigator Audit Server
sudo -u postgres psql -c "CREATE ROLE nav LOGIN PASSWORD 'nav'"
sudo -u postgres psql -c "CREATE DATABASE nav OWNER nav ENCODING 'UTF8' TEMPLATE template0"

#Cloudera Navigator Metadata Server
sudo -u postgres psql -c "CREATE ROLE navms LOGIN PASSWORD 'navms'"
sudo -u postgres psql -c "CREATE DATABASE navms OWNER navms ENCODING 'UTF8' TEMPLATE template0"

#Hue
sudo -u postgres psql -c "CREATE ROLE hue_u LOGIN PASSWORD 'hue'"
sudo -u postgres psql -c "CREATE DATABASE hue_d OWNER hue_u ENCODING 'UTF8' TEMPLATE template0"

#oozie
sudo -u postgres psql -c "CREATE ROLE oozie LOGIN PASSWORD 'oozie'"
sudo -u postgres psql -c "CREATE DATABASE oozie OWNER oozie ENCODING 'UTF8' TEMPLATE template0"


