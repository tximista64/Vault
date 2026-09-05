{ config, pkgs, ... }:
let
  vault = "/home/tximi/Progz/Vault/Config";
  link = path: config.lib.file.mkOutOfStoreSymlink path;
in
{
  home.username = "tximi";
  home.homeDirectory = "/home/tximi";
  home.stateVersion = "26.05";

  # Out-of-store symlinks: ~/.config/X points straight at the Vault repo
  # instead of an immutable copy in the Nix store, so editing either path
  # edits the same file -- no more manual re-sync after every tweak.
  xdg.configFile = {
    "hypr".source = link "${vault}/Hyprland/Hypr";
    "mako".source = link "${vault}/Hyprland/Mako";
    "waybar".source = link "${vault}/Hyprland/Waybar";
    "wofi".source = link "${vault}/Hyprland/Wofi";
    "kitty".source = link "${vault}/Kitty";
    "nvim".source = link "${vault}/Nvim";
    "yazi".source = link "${vault}/Yazi";
    "fastfetch".source = link "${vault}/Fastfetch";
  };
}
