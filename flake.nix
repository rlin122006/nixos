{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixpkgs-dwproton.url = "github:NixOS/nixpkgs/439473e"; # 10.0-26

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };	
  outputs = { self, nixpkgs, home-manager, ... }@inputs: {
    nixosConfigurations.arfarf = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = { inherit inputs; };

      modules = [
        ./configuration.nix
        home-manager.nixosModules.default 
        {
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            users.riley = ./home.nix;
          };
        }
        { 
          nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (nixpkgs.lib.getName pkg) [
            "nvidia-x11"
            "nvidia-settings"
            "nvidia-persistenced"
            "steam"
            "steam-original"
            "steam-unwrapped"
            "steam-run"
            "spotify"
          ];
        }
      ];
    };
  };
}
