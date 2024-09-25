#!/bin/bash

# Create cron file
sudo touch /var/spool/cron/root
# Cronjob for unattended upgrade 1am Sundays.
echo "0 1 * * 0 /usr/bin/unattended-upgrade -v" | sudo tee -a /var/spool/cron/crontabs/root
