#!/bin/bash

DIR=$( pwd )

# Update repositories
sudo apt update && sudo apt upgrade && sudo apt autoremove

# Install dependencies
sudo apt install cron python3 curl

# Enabale cron
sudo systemctl enable cron
sudo systemctl start cron

# Install poetry
curl -sSL https://install.python-poetry.org | python3 -

poetry self update

poetry install

# First run
poetry run python3 -m backup_tool

# Add cron task
echo 0 4 \* \* \* bash $DIR/backup.sh > crontask
crontab crontask
rm crontask