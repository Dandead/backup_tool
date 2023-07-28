#!/bin/bash

DIR=$( pwd )

# Update repositories
sudo apt update && sudo apt upgrade && sudo apt autoremove

# Install dependencies
sudo apt install cron python3-distutils python3-apt curl software-properties-common -y
sudo add-apt-repository ppa:deadsnakes/ppa
sudo apt install python3.11 -y

# Enabale cron
sudo systemctl enable cron
sudo systemctl start cron

# Install poetry
curl -sSL https://install.python-poetry.org | python3.11 -

echo export PATH=\"\$HOME/.local/bin:\$PATH\" >> ~/.zshrc
echo export PATH=\"\$HOME/.local/bin:\$PATH\" >> ~/.bashrc

export PATH="$HOME/.local/bin:$PATH"

poetry self update

poetry install

# Add cron task
echo 0 4 \* \* \* bash $DIR/backup.sh > crontask
crontab crontask
rm crontask