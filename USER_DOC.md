**User documentation for Inception by ldesboui**


## Commands
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