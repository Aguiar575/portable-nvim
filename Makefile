SRC_DIR := src
URL := https://github.com/neovim/neovim/releases/latest/download/nvim-$(ENV).tar.gz
CONFIG_DIR := config/nvim

all: | $(SRC_DIR) download unpack download-config run

$(SRC_DIR):
	mkdir -p $(SRC_DIR)

download:
	curl -L -o $(SRC_DIR)/nvim-$(ENV).tar.gz $(URL)

unpack:
	tar -xzvf $(SRC_DIR)/nvim-$(ENV).tar.gz -C $(SRC_DIR)
	rm $(SRC_DIR)/nvim-$(ENV).tar.gz

run:
	XDG_CONFIG_HOME=$(PWD) src/nvim-$(ENV)/bin/nvim . --cmd "set runtimepath+=config/nvim" --cmd "source config/nvim/init.lua"

clean:
	rm -rf $(SRC_DIR)
	rm -rf packer

download-config:
ifdef REPO_URL
	@echo "Downloading Neovim configuration files from $(REPO_URL)..."
	@rm -rf $(CONFIG_DIR)/*
	@git clone $(REPO_URL) $(CONFIG_DIR)/
else
	@echo "No REPO_URL specified. Skipping download-config."
endif

# Targets
.PHONY: all clean download unpack run download-config

