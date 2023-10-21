SRC_DIR := src
URL := https://github.com/neovim/neovim/releases/latest/download/nvim-macos.tar.gz

# Targets
.PHONY: all clean

all: | $(SRC_DIR) download unpack

$(SRC_DIR):
	mkdir -p $(SRC_DIR)

download:
	curl -L -o $(SRC_DIR)/nvim-macos.tar.gz $(URL)

unpack:
	tar -xzvf $(SRC_DIR)/nvim-macos.tar.gz -C $(SRC_DIR)
	rm $(SRC_DIR)/nvim-macos.tar.gz

clean:
	rm -rf $(SRC_DIR)

