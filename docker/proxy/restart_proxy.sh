#!/bin/bash
cd /home/user/homelab/docker/proxy
docker compose pull
docker compose stop gluetun socks5
docker compose --env-file ../.env -v up -d
sleep 10
COUNTRY=$(curl --socks5 localhost:1080 ifconfig.co/json)
curl \
  -H "Priority: min" \
  -d "proxy ip now in: $COUNTRY" \
  https://ntfy.example.com/topic
