FROM alpine:latest

# Install required dependencies for Neovim
RUN apk add --no-cache neovim git build-base gcc bash

# Clone Neovim configuration repository
RUN git clone https://github.com/jpnt/nvim-config.git /root/.config/nvim --depth=1

# Set the working directory to the Neovim config directory
WORKDIR /root/.config/nvim

# Use ENTRYPOINT to set the default command
ENTRYPOINT ["nvim"]
