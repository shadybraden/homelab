# Docker compose based homelab

The idea here is a single node server. With more than 40 containers, organization is key. This directory is where the config is. Have a poke around. Inside each folder is a `docker-compose.yml` file. Areas where editing is needed will be marked, but the files should be able to just be ran with `docker compose up -d`

More to come...

Remeber; if there is a file (for example `settings.json`) in the volumes section of any docker-compose.yml, then that file has to already exist.
So make sure to run `touch settings.json` first, or docker will make the *FOLDER* `settings.json` instead of the file.