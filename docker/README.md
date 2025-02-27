# Docker compose based homelab

The idea here is a single node server. With more than 40 containers, organization is key. This directory is where the config is. Have a poke around. Inside each folder is a `docker-compose.yml` file. Areas where editing is needed will be marked, but the files should be able to just be ran with `docker compose up -d`

Remeber; if there is a file (for example `settings.json`) in the volumes section of any docker-compose.yml, then that file has to already exist.
So make sure to run `touch settings.json` first, or docker will make the *FOLDER* `settings.json` instead of the file.

![dashy](dashy/dashy.png "dashy")

What is here:

- ADSB
- Ollama + OpenWebUI
- Arr Stack
- AudioBookShelf
- Crafty Controller
- Dashy
- FileBrowser
- ForgeJo
- Glances
- HomeAssistant
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

# TODO:

use env file.
i have a alias: alias dup="sudo docker compose up -d"
what i will have to change that to: `alias dup="sudo docker compose --env-file ../env -v up -d`
the plan it to actually use this repo as the docker host spot.
i.e. go to server's home. `git clone` this repo, then edit the env file as needed. then each service should be all good to go and literally just take running `dup` to work