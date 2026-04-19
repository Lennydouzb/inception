_This project has been created as part of the 42 curriculum by ldesboui._

# Description

Inception is a docker project in which a simple command as "make" provides an entire infrastructure with a DataBase,
a NGINX web server and a Wordpress site entirely configured and ready to use (+ other service with bonus).
This project permits us to understand the usage of docker and its power as a devops tool.

# Instructions
To use this project first:
```bash
git clone https://github.com/Lennydouzb/inception.git
cd inception
cp srcs/example_env srcs/.env
```

You have to modify srcs/.env variables and ./Makefile LOGIN as you with in order
to have your own account and password.

Then, this command must start everything
```bash
make
```
## Other commands
|---------------|------------------------------------------------------------------------------|
| Command       | Description                                                                  |
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

when a container is laucnhed you can use somthing like that

|---------------------------------------------|----------------------------------------------------|
| `docker exec -it <container name> <command>`| Executes interactively the command in the container|
|---------------------------------------------|----------------------------------------------------|
# Resources
https://github.com/TFHD/Inception/blob/main/README.md
https://docs.docker.com/compose/
# Project Description
In this project docker is used to create an infrastructure for a website creation using wordpress nignx and mariadb.
I used .env to store my credentials.

For the purpose of this exercice no made up images where used and they were all created from an empty debian bookworm, using a Dockerfile for each service.
Wordpress and mariadb dockerfiles both launch a .sh script that configure respectivley the website using wp-cli, and the database using sql.
## Virtual machines vs Docker

A virtual machie is an entire OS, its heavy. A docker container doesnt install entire OS,
it shares your resources without installing another entire computer on your machine, light and fast.

## Secrets vs Environment variables

Secrets are files in which we store credentials, they're more secured than .env.
.env and secrets serve the same objectives in this subject. Store information we dont want to share.
The biggest difference is that .env variables are accessible using $VAR, and and cat secret, and that secrets are files directly stores in the container,
meanwhile .env variables are visible using docker inspect <container>.

## Docker network vs Host network
Host network uses directly the network of the machine, for example port 443 of nginx would be the port 443 of the machine blocking it and making it accessible from outside docker realm.
Docker network permits to connect multiple container between them, for example mariadb container isnt accessible via an interface but wordpress can communicate with it, its in an isolated network.

## Docker volumes vs Bind mounts
Docker volumes are made to store data on the host machine.
Bind mounts permit to link a container directory to a specific host location
