# A tool to backup my notes ecosystem

This tool backs up folders and moves them one level up

## Installation:

Create directory for backups and tool:
```bash
mkdir backups && cd backups
```
Clone github repository:
```bash
git clone https://github.com/Dandead/backup_tool.git && cd backup_tool
```
Run install script:
```bash
bash install.sh
```
Then, check of existing backup file and crone task:
```bash
crontab -l
```
Create .env file and define variables
```bash
cp .env.dist .env
```
And then, first run the script
```bash
poetry run python3.11 -m backup_tool
```
