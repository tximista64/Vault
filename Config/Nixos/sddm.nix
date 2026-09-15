{ pkgs, ... }:

let
  # SDDM: keep the catppuccin-mocha-mauve theme (matches the Hyprland violet
  # accent + cursor theme already in use) but swap its background for a
  # NixOS-branded one: violet gradient + faint nix-snowflake watermark.
  sddmNixosBackground = ./assets/sddm-nixos-violet.png;
  catppuccinSddmNixos = pkgs.runCommand "catppuccin-sddm-nixos" {} ''
    mkdir -p $out/share/sddm/themes
    cp -r ${pkgs.catppuccin-sddm}/share/sddm/themes/catppuccin-mocha-mauve $out/share/sddm/themes/
    chmod -R u+w $out/share/sddm/themes/catppuccin-mocha-mauve
    cp ${sddmNixosBackground} $out/share/sddm/themes/catppuccin-mocha-mauve/backgrounds/wall.png

    # Enlarge just the username/password fields and shift the login box up
    # ~3cm (this laptop panel is 1920x1080 over a 310x170mm physical area,
    # so 3cm ~= 190px) -- login button, session picker and clock keep the
    # theme's normal size.
    THEME=$out/share/sddm/themes/catppuccin-mocha-mauve
    sed -i 's/pointSize: config.FontSize/pointSize: config.FontSize * 1.8/' \
      "$THEME/Components/UserField.qml" "$THEME/Components/PasswordField.qml"
    sed -i '/id: userField/,+2{s/height: inputHeight/height: inputHeight * 1.35/}' \
      "$THEME/Components/LoginPanel.qml"
    sed -i '/id: passwordField/,+2{s/height: inputHeight/height: inputHeight * 1.35/}' \
      "$THEME/Components/LoginPanel.qml"
    sed -i '/width: inputWidth/,/horizontalCenter: parent.horizontalCenter/{
      /horizontalCenter: parent.horizontalCenter/a\
      verticalCenterOffset: -190
    }' "$THEME/Components/LoginPanel.qml"
  '';
in
{
  # SDDM
  services.displayManager.sddm.enable = true;
  services.displayManager.sddm.wayland.enable = true;
  # weston-kiosk ignores/mishandles XCURSOR_* (see below) and leaves the
  # pointer invisible on this GPU even though the click events still reach
  # the greeter fine. kwin renders the cursor correctly, so use it instead.
  services.displayManager.sddm.wayland.compositor = "kwin";
  services.displayManager.sddm.theme = "${catppuccinSddmNixos}/share/sddm/themes/catppuccin-mocha-mauve";
  services.displayManager.sddm.extraPackages = [ catppuccinSddmNixos pkgs.catppuccin-cursors.mochaMauve ];
  # The NixOS sddm module only sets CursorTheme/CursorSize when the theme is
  # literally "breeze" — with our custom catppuccin theme they're left empty,
  # so the Wayland greeter has no cursor to load at all. Set them ourselves.
  services.displayManager.sddm.settings.Theme = {
    CursorTheme = "catppuccin-mocha-mauve-cursors";
    CursorSize = 24;
  };
  # [Theme] CursorTheme/CursorSize in sddm.conf is an X11-era setting (it used
  # to drive `xsetroot`) — the Wayland/weston backend doesn't read it, so it's
  # a dead end here despite being set above. What weston and the Qt/QML
  # greeter actually consult is the standard freedesktop XCURSOR_* env trio:
  # a path to search (extraPackages only feeds the Qt plugin wrapper, not
  # this — the sddm module links just /share/sddm into
  # /run/current-system/sw, so /share/icons from catppuccin-cursors never
  # reaches the greeter on its own) plus the theme name and size to look up
  # in it. Export all three directly so both weston and the greeter resolve
  # the same cursor regardless of what sddm.conf claims.
  systemd.services.display-manager.environment = {
    XCURSOR_PATH = "${pkgs.catppuccin-cursors.mochaMauve}/share/icons";
    XCURSOR_THEME = "catppuccin-mocha-mauve-cursors";
    XCURSOR_SIZE = "24";
  };
}
