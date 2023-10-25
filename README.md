# Portable Neovim Installation

This repository provides a Makefile and a Bash script to download and install Neovim on your system. Choose the version (macos, linux64 or windows) according to your platform.

## Using Makefile

### Prerequisites

- `make` should be installed on your system.

### Steps

1. Clone the repository:

   ```bash
   git clone https://github.com/Aguiar575/portable-nvim.git
   ```

2. Navigate to the repository:

   ```bash
   cd portable-nvim
   ```

3. Run the Makefile for macOS:

   ```bash
   make ENV=macos all
   ```

   Or for Linux:

   ```bash
   make ENV=linux64 all
   ```

## Using Bash Script

### Prerequisites

- `curl` and `tar` should be available in your Bash environment.

### Steps

1. Run the Bash script:

   ```bash
   bash install_neovim.sh
   ```

## Cleaning Up

To clean up the installation and remove downloaded files, you can use the provided scripts:

### Using Makefile

```bash
make clean
```
### Using Bash Script

```bash
bash clean_neovim.sh
```

# Neovim Portable Configuration

The following configuration is designed to keep Neovim and its dependencies contained within the project folder. This approach ensures portability across different environments while maintaining a consistent setup. It prevents interference with the global Neovim installation on the system.

## Directory Setup

The script begins by obtaining the current working directory using the `pwd` command. This directory is then used as the root for the Packer plugin manager and the location where Packer will be installed.

```lua
local current_working_dir = vim.fn.system('pwd')
current_working_dir = current_working_dir:gsub('\n', '')
```

## Packer Plugin Manager Setup

Packer is used as the plugin manager in this configuration. The script defines the root directory for Packer plugins and the path where Packer itself will be installed.

```lua
local packer_package_root = current_working_dir..'/packer/site/pack/'
local packer_path = current_working_dir..'/packer/opt/packer.nvim'
vim.o.packpath = packer_path..vim.o.packpath
```

## Packer Installation

If Packer is not already installed, the script clones it from the [official GitHub repository](https://github.com/wbthomason/packer.nvim).

```lua
if vim.fn.empty(vim.fn.glob(packer_path)) > 0 then
    vim.fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', packer_path})
end
```

## Packer Initialization

The script initializes and configures Packer with the desired paths for plugin management.

```lua
vim.cmd [[packadd packer.nvim]]
require('packer').init({
    compile_path = current_working_dir..'/packer/plugin/packer_compiled.lua',
    package_root = packer_package_root
})
```

Certainly! Here's a Markdown documentation for the optional Neovim configuration download feature in the Makefile:

# Neovim Configuration Management

This makefile provides functionality to manage Neovim configuration files, allowing users to download their own configuration files.

## Download Neovim Configuration

This feature is optional, and users can provide the repository URL using the `REPO_URL` parameter. If no URL is provided, the download will be skipped.

### Usage

```bash
make ENV=your-env REPO_URL=https://github.com/example/nvim-config.git
```

This command downloads the Neovim configuration files from the specified repository.
