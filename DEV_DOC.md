# DEV_DOC

## Overview

This document explains how to set up the Inception environment from scratch, build and launch the project, manage containers and volumes, and identify where project data is stored.

## Prerequisites

- Docker installed and running
- Docker Compose v2 available (`docker compose`)
- Make installed
- Access to the project repository on the host machine

## Initial setup

1. Change to the project source directory:

   ```bash
   cd /home/LOGIN/
   ```
   ```bash
   git clone git@github.com:Lennydouzb/inception.git && cd inception
   ```


2. Copy the example environment file and configure any secrets:

   ```bash
   cp srcs/example_env srcs/.env
   ```

3. Edit `.env` to set required values for services, passwords, and host configuration. Keep secrets out of any other file.

## Build and launch

1. From the repository root, use the Makefile to build the project if available:

   ```bash
   cd /home/LOGIN/inception
   make
   ```
3. Verify the services are running:

   ```bash
   docker ps
   ```

## Managing containers and volumes

- View logs:

  ```bash
  docker logs <service name>
  ```

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

## Data storage and persistence

Project data is persisted by Docker volumes configured in `srcs/docker-compose.yml`.
All these volumes are located at /home/username/data

- Database data is stored in the mariadb volume.
- WordPress files, uploads, and any persistent site content are stored in dedicated service volumes.
- Service-specific configuration and secrets are loaded from `.env` and configuration files inside the `srcs` subfolders.

The Docker Compose setup ensures data remains available across container restarts
