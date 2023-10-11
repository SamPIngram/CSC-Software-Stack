#!/bin/bash

sudo service postgresql start
sleep 5
sudo service postgresql restart
sudo service supervisor start

sudo a2enmod headers 
sudo a2enmod proxy  
sudo ln -sf /etc/apache2/sites-available/qatrack.conf /etc/apache2/sites-enabled/qatrack.conf
sudo usermod -a -G qat www-data 
sudo rm /etc/apache2/sites-enabled/000-default.conf 
sudo service apache2 restart

cd /home/qat/web/qatrackplus
source /home/qat/venvs/qatrack31/bin/activate
python manage.py createsuperuser2 --username admin --password admin --noinput --email 'blank@email.com'

sleep infinity 