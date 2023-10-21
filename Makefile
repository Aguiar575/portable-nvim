REPO_URL := https://github.com/neovim/neovim

TARGET_DIR ?= src

all: download

download:
	git clone $(REPO_URL) $(TARGET_DIR)

clean:
	rm -rf $(TARGET_DIR)

.PHONY: all download clean

