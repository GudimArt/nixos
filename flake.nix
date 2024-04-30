{
  description = "Test flake";

  inputs = {
    # NixOS package
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-23.11";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";

    # Environment/system management
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    disko.url = "github:nix-community/disko";
    disko.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs-stable, nixpkgs-unstable, home-manager, disko, ... }@inputs:
      let
        system = "x86_64-linux";
      in {

        nixosConfigurations.nix-sys = nixpkgs-unstable.lib.nixosSystem {
          specialArgs = {       
            pkgs-stable = import  nixpkgs-stable {inherit system; config.allowUnfree = true;};
            inherit inputs system;
          };
          modules = [
            ./configuration.nix
          ];
        };


        homeConfigurations.artem = home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs-unstable.legacyPackages.${system};
          modules = [ ./home-manager/users/artem.nix ];
        };
        homeConfigurations.angelina = home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs-unstable.legacyPackages.${system};
          modules = [ ./home-manager/users/angelina.nix ];
        };
      };
}

