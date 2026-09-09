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
      docker-compose = "podman-compose";
      cat = "bat";
      ls = "eza --icons=auto";
      ll = "eza --icons=auto -l";
      lt = "eza --icons=auto --tree";
    };

    # fonctions, PATH, banner
    # NB : le ${...} du zsh doit être échappé en ''${...} dans un bloc Nix.
    interactiveShellInit = ''
      export PATH="$HOME/.local/bin:$PATH"

      # Symlink arrow (eza "punctuation") was landing on the theme's near-
      # black grey (color8 #353146, close to the #1f1c27 background) -> low
      # contrast. Recolored to a balanced cyan (equal green/blue) so it
      # doesn't echo the violet foreground/accent (#b6a0ff / #b875dc) *and*
      # stays clear of zsh-syntax-highlighting's built-in green for
      # recognized commands (fg=green, i.e. color2 #2dcc72).
      export EZA_COLORS="xx=38;5;80"

      # Autosuggestion: same grey-on-near-black problem, but here the violet
      # family is wanted back -- just dimmed down from the bright foreground
      # (#b6a0ff) / cursor (#b875dc) so a suggestion still reads as distinct
      # from text you've actually typed.
      export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#8f7fc4"

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
