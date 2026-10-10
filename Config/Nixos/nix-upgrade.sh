#!/usr/bin/env bash

set -Eeuo pipefail

FLAKE="$HOME/Progz/Vault/Config/Nixos/"
HOST="zawarud0"

GREEN='\033[1;32m'
RED='\033[1;31m'
CYAN='\033[1;36m'
NC='\033[0m'

header() {
    printf "\n${CYAN}===[!] %s ===${NC}\n\n" "$1"
}

success() {
    printf "\n${GREEN}===[+] %s ===${NC}\n" "$1"
}

failure() {
    printf "\n${RED}===[-] UPGRADE FAILED ===${NC}\n" >&2
}

trap failure ERR

# Authenticate
sudo -v

# Update inputs
header "Updating"
sudo nix flake update --flake "$FLAKE" --log-format bar-with-logs
success "Flake updated"

# Rebuild and switch
header "Rebuilding"
sudo nixos-rebuild switch --flake "${FLAKE}#${HOST}" --log-format bar-with-logs

success "NixOS upgraded successfully"
