sudo curl https://raw.githubusercontent.com/GudimArt/nixos/main/disk-config.nix -o /tmp/disk-config.nix

sudo nix --experimental-features "nix-command flakes" run github:nix-community/disko -- --mode disko /tmp/disk-config.nix

sudo nixos-generate-config --no-filesystems --root /mnt

sudo git clone https://github.com/GudimArt/nixos.git .

sudo nix-channel --add https://nixos.org/channels/nixos-unstable nixos 
sudo nix-channel --remove unstable
sudo nix-channel --update

sudo nix --experimental-features "nix-command flakes" flake lock

sudo nixos-install --root /mnt --flake /mnt --flake /mnt/etc/nixos/.#nix-sys


----------

sudo nix --extra-experimental-features 'flakes nix-command' run github:nix-community/disko#disko-install -- --flake "github:GudimArt/nixos/main#nix-sys" --write-efi-boot-entries --disk main /dev/sda