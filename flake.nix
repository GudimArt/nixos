{
  description = "Test flake";

  inputs = {
    # NixOS package
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-23.11";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";

    # Environment/system management
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs-unstable";

    disko.url = "github:nix-community/disko";
    disko.inputs.nixpkgs.follows = "nixpkgs-unstable";
  };

  outputs = { self, nixpkgs-stable, nixpkgs-unstable, home-manager, disko}:
    let
      system = "x86_64-linux";
    in {

      nixosConfigurations.nix-sys = nixpkgs-unstable.lib.nixosSystem {
        inherit system;
        modules = [
          ./configuration.nix
          disko.nixosModules.disko
          {
            disko.devices = {
              disk = {
                my-disk = {
                device = "/dev/sda";
                type = "disk";
                content = {
                  type = "gpt";


                  partitions = {
                  ESP = {
                    type = "EF00";
                    size = "500M";
                    content = {
                    type = "filesystem";
                    format = "vfat";
                    mountpoint = "/boot";
                    };
                  };


                  swap = {
                    size = "8G";
                    content = {
                    type="swap";
                    resumeDevice = true;
                    };
                  };


                  root = {
                    size = "100%";
                    content = {
                    type = "filesystem";
                    format = "btrfs";
                    mountpoint = "/";
                    };

                  };
                  };
                };
                };
              };
            };
          };
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

