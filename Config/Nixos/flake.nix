{
  description = "zawarud0 NixOS configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... }: {
    nixosConfigurations.zawarud0 = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        ./configuration.nix
        home-manager.nixosModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          # Dotfiles get edited directly and live-reloaded a lot; conflicting
          # plain files/dirs from before home-manager get renamed instead of
          # blocking the switch.
          home-manager.backupFileExtension = "hm-backup";
          home-manager.users.tximi = import ./home.nix;
        }
      ];
    };
  };
}
