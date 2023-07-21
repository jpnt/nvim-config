# Makefile for Neovim Docker container

# Docker Compose command to build the image
build:
	docker-compose up --build -d

# Docker command to stop and remove the container
stop:
	docker-compose down
