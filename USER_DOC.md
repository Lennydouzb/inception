*User documentation for Inception by ldesboui*

This document explains the services included (nginx, WordPress, MariaDB, Adminer, Redis), how to use the `Makefile` targets that manage the Docker infrastructure, how to create your `.env` file from the example, and how to check running containers.

# Table of Contents
    - [Services](#services)
    - [Usage](#usage)

# Services

## Nginx

    Nginx is a web server (in this case self SSL signed) which serve static files, is open on port 443 and redirects php pages to wordpress service.
    Nginx and Wordpress are linked together at this place on your machine /home/ldesboui/data/wordpress.

## MariaDB

    MariaDB is a Database management system that permits to stock wordpress site information that should stay between sessions. It uses sql as query language

## Wordpress
    
    Wordpress is a content management system, which is a web application used to manage and create websites. This service is what you will see the most as the main interface and the main objective of this infrastructure. It relies on Nginx and mariadb.

## Redis

    Redis is a server that permits to store wordpress data directly in the RAM so the wordpress doesnt have to query the DB for everyone. It makes everything faster.
    It's coupled with the plugin redis-cache in wordpress.

## Adminer

    Adminer is a web application used to manage the database without having to go in command line inside the docker container. It's an interface to manage the Database in an easier and more accessible way.

# Usage

## Installation and setup

To use this project first clone it from github:
```bash
git clone https://github.com/Lennydouzb/inception.git
cd inception
```

Once you're in it you can create your environment variables by copying srcs/example_env to srcs/.env.
this command will create srcs/.env , it's up to you to modify it. This file is the only point of credentials.

```bash
cp srcs/example_env srcs/.env
```

Then, this command must start everything, it might take some time, don't worry.
```bash
make
```
## Other commands
| Command       |Description                                                                   |
|---------------|------------------------------------------------------------------------------|
| `make`        | Creates data directories and starts all containers in detached mode          |
|---------------|------------------------------------------------------------------------------|
| `make stop`   | Stops and removes containers (`docker compose down`), keeps volumes          |
|---------------|------------------------------------------------------------------------------|
| `make clean`  | Calls `stop` then deletes the `/home/LOGIN/data` directory                   |
|---------------|------------------------------------------------------------------------------|
| `make fclean` | Calls `clean` then runs `docker system prune -af` (removes images, networks) |
|---------------|------------------------------------------------------------------------------|
| `make re`     | Calls `fclean` then `all` — full teardown and fresh restart                  |
|---------------|------------------------------------------------------------------------------|

when a container is laucnhed you can use those commands

|---------------------------------------------|----------------------------------------------------|
| `docker exec -it <container name> <command>`| Executes interactively the command in the container|
|---------------------------------------------|----------------------------------------------------|
| `docker ps`                                 | Displays running containers                        |
|---------------------------------------------|----------------------------------------------------|

## Access web services

To access your running website you can use $DOMAIN_NAME:9000 and to access its administration panel go to $DOMAIN_NAME:9000/wp-admin