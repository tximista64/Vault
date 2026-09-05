# zsh.nix — personnal zsh 
#

{ pkgs, ... }:

{
  programs.zsh = {
    enable = true;

    ohMyZsh = {
      enable = true;
      theme = "fino-time";
      # "z" removed: replaced by zoxide below (same job, faster).
      plugins = [ "git" "docker" "sudo" "history" ];
    };

    # about NixOS 
    autosuggestions.enable = true;
    syntaxHighlighting.enable = true;

    # history
    histSize = 10000;
    setOptions = [
      "append_history"
      "share_history"
      "hist_ignore_all_dups"
      "correct"
    ];

    # alias
    shellAliases = {
      docker = "podman";
      cat = "bat";
      ls = "eza --icons";
      ll = "eza --icons -l";
      lt = "eza --icons --tree";
    };

    # fonctions, PATH, banner
    # NB : le ${...} du zsh doit être échappé en ''${...} dans un bloc Nix.
    interactiveShellInit = ''
      export PATH="$HOME/.local/bin:$PATH"

      # zoxide (replaces oh-my-zsh's "z") and fzf (ctrl+t/alt+c)
      eval "$(zoxide init zsh)"
      eval "$(fzf --zsh)"

      # banner
      if [[ "$TERM" == "xterm-kitty" ]]; then
        cols=$(tput cols)
        kitty +kitten icat --align center --place "''${cols}x5@0x0" "$HOME/Images/banner.png"
        printf '\n%.0s' {1..6}
      fi
    '';
  };

  # atuin: shell history with fuzzy search, wired into zsh by this module.
  programs.atuin = {
    enable = true;
    enableZshIntegration = true;
    # Must stay non-empty: ATUIN_CONFIG_DIR always points to /etc/atuin, but
    # the module only writes that file when settings != {}.
    settings = {
      search_mode = "fuzzy";
      filter_mode = "global";
      style = "compact";
    };
  };

  # zsh by default
  users.users.tximi.shell = pkgs.zsh;
}
