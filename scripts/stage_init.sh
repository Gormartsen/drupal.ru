#!/bin/sh

export DATABASE_PASS=`cat /home/stage/.my.cnf |grep pass|awk -F= '{print$2}'`
#install drupal
sh $ZENCI_DEPLOY_DIR/scripts/init.sh

# revert database and files
mysql -u $DATABASE_USER $DATABASE_PASS $DATABASE_NAME < $HOME/dump/drupal_main.sql
mysql -u $DATABASE_USER $DATABASE_PASS $DATABASE_NAME < $HOME/dump/drupal_main.sphinxmain.sql

cd $DOCROOT
rm -rf files
ln -s ~/files ./files
