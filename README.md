sudo curl https://raw.githubusercontent.com/GudimArt/nixos/main/disk-config.nix -o /tmp/disk-config.nix

sudo nix --experimental-features "nix-command flakes" run github:nix-community/disko -- --mode disko /tmp/disk-config.nix

mkdir -p /mnt/etc && cd /mnt/etc

sudo git clone https://github.com/GudimArt/nixos.git

sudo nixos-install --root /mnt --flake /mnt --flake /mnt/etc/nixos/.#nix-sys