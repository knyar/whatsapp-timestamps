#!/bin/bash

set -e -u -o pipefail

pip3.10 install https://github.com/KnugiHK/iphone_backup_decrypt/archive/refs/heads/master.zip
pip3.10 install whatsapp-chat-exporter
pip3.10 install requests

id=$(ls "$HOME/Library/Application Support/MobileSync/Backup/" | head -1)

/Library/Frameworks/Python.framework/Versions/3.10/bin/wtsexporter \
  -i -b "$HOME/Library/Application Support/MobileSync/Backup/$id"

python3.10 timestamps.py > output.csv
