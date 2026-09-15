{ config, lib, pkgs, ... }:
#fetching gef
let
  gefpy = pkgs.fetchurl {
    url = "https://raw.githubusercontent.com/hugsy/gef/main/gef.py";
    sha256 = "sha256-ur4QuZkQ9ERdYocCGuaRAXXBoOanJGS2LOJhB9xnC7c=";
  };

  # SBECmd (ShellBags Explorer, CLI) - Eric Zimmerman's tools
  # net9 build is framework-dependent (SBECmd.dll), so it runs cross-platform via dotnet
  sbecmdZip = pkgs.fetchurl {
    url = "https://download.ericzimmermanstools.com/net9/SBECmd.zip";
    sha256 = "16zbnz0qq5m148r3s06hv63x6ilyk5gz41m1988nibxs6a5bkvc8";
  };

  sbecmd = pkgs.stdenv.mkDerivation {
    pname = "sbecmd";
    version = "2026.5.0";
    src = sbecmdZip;

    nativeBuildInputs = [ pkgs.unzip pkgs.makeWrapper ];
    dontUnpack = true;

    installPhase = ''
      runHook preInstall
      mkdir -p $out/lib/sbecmd
      unzip -q $src -d $out/lib/sbecmd
      makeWrapper ${pkgs.dotnetCorePackages.runtime_9_0}/bin/dotnet $out/bin/sbecmd \
        --add-flags "$out/lib/sbecmd/SBECmd.dll"
      runHook postInstall
    '';

    meta = {
      description = "ShellBags Explorer, command line edition (Eric Zimmerman's tools)";
      homepage = "https://ericzimmerman.github.io";
      platforms = pkgs.lib.platforms.linux;
    };
  };


in
{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      # Personal sddm
      ./sddm.nix
      # Personnal zsh
      ./zsh.nix
    ];

  # Bootloader (bare metal, UEFI + ESP partition).
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.systemd-boot.configurationLimit = 5;
  # for latest kernel
  boot.kernelPackages = pkgs.linuxPackages_latest;
  networking.hostName = "zawarud0"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Enable networking
  networking.networkmanager.enable = true;
  # Set your time zone.
  time.timeZone = "Europe/Paris";

  # Select internationalisation properties.
  i18n.defaultLocale = "fr_FR.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "fr_FR.UTF-8";
    LC_IDENTIFICATION = "fr_FR.UTF-8";
    LC_MEASUREMENT = "fr_FR.UTF-8";
    LC_MONETARY = "fr_FR.UTF-8";
    LC_NAME = "fr_FR.UTF-8";
    LC_NUMERIC = "fr_FR.UTF-8";
    LC_PAPER = "fr_FR.UTF-8";
    LC_TELEPHONE = "fr_FR.UTF-8";
    LC_TIME = "fr_FR.UTF-8";
  };

  # Hyprland
  programs.hyprland.enable = true;

  # The hyprland package ships two session .desktop files (plain + uwsm-managed).
  # The uwsm one caused blackscreens at the SDDM greeter on real hardware, and with
  # no visible cursor there we couldn't tell them apart to pick the working one.
  # Force only the plain session to be listed.
  services.displayManager.sessionPackages = lib.mkForce [
    (pkgs.runCommand "hyprland-session-only" {
      passthru.providedSessions = [ "hyprland" ];
    } ''
      mkdir -p $out/share/wayland-sessions
      cp ${pkgs.hyprland}/share/wayland-sessions/hyprland.desktop $out/share/wayland-sessions/
    '')
  ];

  # Enable proper hardware acceleration.
  hardware.graphics.enable = true;
  # Steam's pressure-vessel sandbox needs matching 32-bit Mesa/Vulkan libs,
  # not just 64-bit -- without this, GLX/Vulkan init fails inside the sandbox.
  hardware.graphics.enable32Bit = true;

  # Steam
  programs.steam.enable = true;

  # Real laptop, real battery: CPU/thermal power states
  services.power-profiles-daemon.enable = true;

  # Bluetooth (headset pairing via blueman, launched from Waybar's tray/module).
  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true;
  services.blueman.enable = true;

  # Nerd Font

  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
  ];

  # System keymap
  services.xserver.xkb = {
    layout = "fr";
    variant = "azerty";
  };

  # Configure console keymap
  console.keyMap = "fr";

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users."tximi" = {
    isNormalUser = true;
    description = "tximi";
    extraGroups = [ "networkmanager" "wheel" "libvirtd" ];
  };

  # QEMU/KVM + libvirt for virt-manager
  virtualisation.libvirtd.enable = true;
  programs.virt-manager.enable = true;

  # Install firefox.
  programs.firefox.enable = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile.
  environment.systemPackages = with pkgs; [

  # Survival kit

    git
    gh
    wget
    neovim
    kitty
    btop
    tree-sitter
    zip
    unzip
    gcc
    gdb
    openvpn
    age
    tldr
    lynx
    cifs-utils
    podman
    podman-compose
    rustc
    cargo
    python3
    go
    codex
    vlc
    imagemagick
    eza
    bat
    zoxide
    delta
    atuin
    fzf
    luajitPackages.magick
    dotnetCorePackages.sdk_9_0
    godot
    mdcat
    foliate
    obsidian
    transmission_4

  # Toolkit

    file
    util-linux
    volatility3
    exiftool
    chainsaw
    foremost
    binwalk
    ghidra
    hashcat
    seclists
    ffuf
    nmap
    netexec
    sqlmap
    caido-desktop
    git-dumper
    sbecmd
    visidata

  # Hyprland
    waybar
    wofi
    mako
    swaybg
    grim
    slurp
    yazi
    catppuccin-cursors.mochaMauve
    wl-clipboard
    hypridle
    hyprlock
    brightnessctl
    playerctl

];

  # gef
  system.activationScripts.gefInstall.text = ''
    USER_HOME="/home/tximi"
    LINE="source ${gefpy}"
    if ! grep -qxF "$LINE" "$USER_HOME/.gdbinit" 2>/dev/null; then
      echo "$LINE" >> "$USER_HOME/.gdbinit"
      chown tximi:users "$USER_HOME/.gdbinit"
    fi
  '';

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:
  services.locate = {
    enable = true;
    package = pkgs.plocate;
    };

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
   networking.firewall.enable = true;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "26.05"; # Did you read the comment?
  #Allow unconventionnal features
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  # Auto Garbage collection
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 10d";

  };

  #optimizing store
  nix.optimise.automatic = true;
  #nvim as main ide
  environment.variables.EDITOR ="nvim";
}
