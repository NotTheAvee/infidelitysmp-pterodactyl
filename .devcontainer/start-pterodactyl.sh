#!/bin/bash

echo ""
echo "=============================================="
echo " Starting Pterodactyl Panel + Wings..."
echo "=============================================="
echo ""

# Start required services
sudo service mariadb start >/dev/null 2>&1 || true
sudo service php8.3-fpm restart >/dev/null 2>&1 || true
sudo service nginx restart >/dev/null 2>&1 || true

# Stop old Wings if already running
sudo pkill wings >/dev/null 2>&1 || true

# Start Wings in background
sudo wings > ~/wings.log 2>&1 &

sleep 2

# Green success message
echo -e "\033[1;32mYour panel and wings are started, please open another terminal to start Playit server\033[0m"
echo ""
echo -e "\033[1;36mPanel:\033[0m http://127.0.0.1:8000"
echo -e "\033[1;36mWings Log:\033[0m tail -f ~/wings.log"
echo -e "\033[1;36mStart Playit manually:\033[0m cd ~ && ./playit"
echo ""
