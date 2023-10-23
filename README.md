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
