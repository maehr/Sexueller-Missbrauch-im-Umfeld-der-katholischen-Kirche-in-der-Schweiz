#!/bin/bash

# WARNING: THIS SCRIPT IS FOR THE UZH ENVIRONMENT ONLY

# Load environment variables from .env file
if [ ! -f .env ]; then
    echo ".env file not found!"
    exit 1
fi

set -a
source .env
set +a

docker-compose -f docker-compose.prod.yml up -d --build

podman generate systemd --name db -f
mv container-db.service /home/appadm/.config/systemd/user/
systemctl --user daemon-reload
systemctl --user enable container-db.service
systemctl --user start container-db

podman generate systemd --name mediawiki -f
mv container-mediawiki.service /home/appadm/.config/systemd/user/
systemctl --user daemon-reload
systemctl --user enable container-mediawiki.service
systemctl --user start container-mediawiki

podman generate systemd --name caddy -f
mv container-caddy.service /home/appadm/.config/systemd/user/
systemctl --user daemon-reload
systemctl --user enable container-caddy.service
systemctl --user start container-caddy

systemctl --user list-units --type=service
