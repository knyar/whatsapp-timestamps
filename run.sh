#!/bin/bash

set -e -u -o pipefail

pip3.10 install git+https://github.com/KnugiHK/iphone_backup_decrypt
pip3.10 install whatsapp-chat-exporter

id=$(ls "$HOME/Library/Application Support/MobileSync/Backup/" | head -1)

wtsexporter -i -b "$HOME/Library/Application Support/MobileSync/Backup/$id"

python3.10 timestamps.py > output.csv
