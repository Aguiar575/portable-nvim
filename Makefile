SRC_DIR := src
URL := https://github.com/neovim/neovim/releases/latest/download/nvim-macos.tar.gz

# Targets
.PHONY: all clean download unpack run

all: | $(SRC_DIR) download unpack run

$(SRC_DIR):
	mkdir -p $(SRC_DIR)

download:
	curl -L -o $(SRC_DIR)/nvim-macos.tar.gz $(URL)

unpack:
	tar -xzvf $(SRC_DIR)/nvim-macos.tar.gz -C $(SRC_DIR)
	rm $(SRC_DIR)/nvim-macos.tar.gz

run:
	XDG_CONFIG_HOME=$(pwd) src/nvim-macos/bin/nvim . --cmd "set runtimepath+=config/nvim" --cmd "source config/nvim/init.lua"

clean:
	rm -rf $(SRC_DIR)
	rm -rf packer

