# Default target
all: up

# Start and attach to the Kali container
up:
	@mkdir -p ./data
	@chown $$(id -u):$$(id -g) ./data
	@docker-compose up -d
	@docker-compose exec -it kali /bin/bash

# Stop services
down:
	@docker-compose down

# Remove containers, images, volumes created by this project
clean:
	@docker-compose down -v --rmi all --remove-orphans

# Full clean: also prune unused Docker objects and delete ./data
fclean: clean
# 	@docker system prune -af --volumes
	@rm -rf ./data

# Rebuild from scratch
re: fclean all

.PHONY: all up down clean fclean re