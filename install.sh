#!/bin/bash

# Exit if any of commands fails
set -e

# Update repositories
sudo apt update -y && sudo apt upgrade -y && sudo apt autoremove

# Install dependencies
sudo apt install git cron python3-distutils python3-apt python3-pip curl software-properties-common -y
sudo add-apt-repository ppa:deadsnakes/ppa -y
sudo apt install python3.11 -y

# Clone github repository
git clone https://github.com/Dandead/backup_tool.git

cd backup_tool

DIR=$( pwd )

# Init venv
python3.11 -m venv venv
source ./venv/bin/activate

# Update pip
pip -U pip

# Install project dependencies
pip install -r requirements.txt

deactivate

# Enabale cron
sudo systemctl enable cron
sudo systemctl start cron

# Add cron task
echo 0 4 \*\/3 \* \* bash $DIR/backup.sh > crontask
crontab crontask
rm crontask