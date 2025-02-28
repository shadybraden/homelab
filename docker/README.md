# Docker compose based homelab

The idea here is a single node server. With more than 40 containers, organization is key. This directory is where the config is. Have a poke around. Inside each folder is a `docker-compose.yml` file. Areas where editing is needed will be marked, but the files should be able to just be ran with `docker compose up -d`

Remember; if there is a file (for example `settings.json`) in the volumes section of any docker-compose.yml, then that file has to already exist.
So make sure to run `touch settings.json` first, or docker will make the *FOLDER* `settings.json` instead of the file.

## My Dashy Dashboard:

![dashy](dashy/dashy.png "dashy")

What is here:

- ADSB
- Ollama + OpenWebUI
- Arr Stack
- AudioBookShelf
- Crafty Controller
- Dashy
- FileBrowser
- Forgejo
- Glances
- Home Assistant
- Pi-Hole
- Immich
- Jellyfin
- Jellyseerr
- Kiwix
- Mealie
- Navidrome
- Nginx
- NetAlertX
- NextCloud
- NTFY
- Paperless-NGX
- Portainer
- Proxy (http, socks5)
- rclone/restic (backups)
- Scrutiny
- StirlingPDF
- Syncthing
- UpTimeKuma
- VaultWarden
- WatchTower
- WireGuard


# How to use this repo:

Clone this repo, then go to the docker folder.
`cp env .env` now use `.env` as your actual env file. 

Run `sudo chmod 600 .env && sudo chown root:root .env` to secure it a bit more. (note that this works with docker and *probably not* podman)

Edit the `.env` file as needed, then run:

`docker compose --env-file ../.env -v up -d`

Now if you want to pull the latest, run `git pull` then compare the latest in `env` to your `.env`.
