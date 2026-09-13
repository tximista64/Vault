#!/usr/bin/env zsh

if [ -z "${ZSH_VERSION:-}" ]; then
    printf '%s\n' 'Run from Zsh: source ~/Progz/Vault/Config/Nixos/ccleaner.sh' >&2
    return 1 2>/dev/null || exit 1
fi
if [[ ${ZSH_EVAL_CONTEXT} != *:file ]]; then
    print -ru2 -- 'Run with source to clear the current shell history.'
    exit 1
fi

function ccleaner() {
    local cleanup_status=0
    local history_file=${HISTFILE:-$HOME/.zsh_history}
    local history_size=${HISTSIZE:-10000}
    local save_history=${SAVEHIST:-10000}

    bash <<'CLEANUP' || cleanup_status=$?
set -euo pipefail

echo "=== Emptying trash ==="
sleep 2s
rm -rf ~/.local/share/Trash/files/* ~/.local/share/Trash/info/* 2>/dev/null || true
: > ~/.local/share/Trash/directorysizes 2>/dev/null || true
echo "Trash emptied."
echo "=== Clearing system logs ==="
sleep 2s
sudo journalctl --vacuum-time=1s
sudo find /var/log -type f -exec truncate -s 0 {} \;
echo "System logs cleared."
echo "=== Nixos garbage collector ==="
sleep 2s
nix-collect-garbage -d
CLEANUP

    echo "=== Clearing shell history (zsh + atuin) ==="
    if ! atuin search --delete-it-all; then
        print -ru2 -- "Failed to clear Atuin history."
        cleanup_status=1
    fi
    if : > "$history_file" &&
        builtin fc -p "$history_file" "$history_size" "$save_history"; then
        echo "Zsh history cleared."
    else
        print -ru2 -- "Failed to clear Zsh history."
        cleanup_status=1
    fi

    if (( cleanup_status == 0 )); then
        echo "=== Done ==="
    else
        print -ru2 -- "=== Finished with errors ==="
    fi
    return "$cleanup_status"
}

ccleaner
