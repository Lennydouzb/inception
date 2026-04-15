LOGIN=ldesboui
ORIGIN=/home/$(LOGIN)/data
MANDA_DIR_MARIA = $(ORIGIN)/mariadb
MANDA_DIR_WORDPRESS = $(ORIGIN)/wordpress

all: start

start:
	mkdir -p $(MANDA_DIR_MARIA)
	mkdir -p $(MANDA_DIR_WORDPRESS)
	docker compose -f ./srcs/docker-compose.yml up -d

fclean: clean
	docker system prune -af

clean:
	docker compose -f ./srcs/docker-compose.yml down
	rm -rf $(ORIGIN)

re: fclean all

.PHONY: all fclean clean re
