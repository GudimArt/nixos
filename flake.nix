{
  description = "Test flake";

  inputs = {
    # NixOS package
    nixpkgs-master.url = "github:NixOS/nixpkgs/master";
    nixpkgs-stable.url = "github:NixOS/nixpkgs/nixpkgs-23.11-darwin";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

    # Environment/system management
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
   
    disko.url = "github:nix-community/disko";
    disko.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, nixpkgs-unstable, home-manager, disko, ... }@inputs:
      let
        system = "x86_64-linux";
      in {

        nixosConfigurations.nix-sys = nixpkgs.lib.nixosSystem {
          specialArgs = {       
            pkgs-unstable = import nixpkgs-unstable {inherit system; config.allowUnfree = true;};
            inherit inputs system;
          };
          modules = [
            ./configuration.nix
            disko.nixosModules.disko
          ];
        };


        homeConfigurations.artem = home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages.${system};
          modules = [ ./home-manager/users/artem.nix ];
        };
        homeConfigurations.angelina = home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages.${system};
          modules = [ ./home-manager/users/angelina.nix ];
        };
      };
}

