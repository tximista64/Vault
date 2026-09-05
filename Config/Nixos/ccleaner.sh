#!/usr/bin/env bash
set -euo pipefail

echo "=== Vidage de la corbeille ==="
sleep 2s
rm -rf ~/.local/share/Trash/files/* ~/.local/share/Trash/info/* 2>/dev/null || true
: > ~/.local/share/Trash/directorysizes 2>/dev/null || true
echo "Corbeille vidée."
echo "=== Vidage des logs système  ==="
sleep 2s
sudo journalctl --vacuum-time=1s
sudo find /var/log -type f -exec truncate -s 0 {} \;
echo "Logs système vidés."
echo "=== Nixos garbage collector ==="
sleep 2s
nix-collect-garbage -d
echo "=== Vidage historique shell (zsh + atuin) ==="
sleep 2s
: > ~/.zsh_history 2>/dev/null || true
rm -f ~/.local/share/atuin/history.db 2>/dev/null || true
echo "Historique shell vidé."
echo "=== Terminé ==="
