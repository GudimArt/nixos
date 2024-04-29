sudo curl https://raw.githubusercontent.com/GudimArt/nixos/main/disk-config.nix -o /tmp/disk-config.nix

sudo nix --experimental-features "nix-command flakes" run github:nix-community/disko -- --mode disko /tmp/disko-config.nix

sudo nixos-generate-config --no-filesystems --root /mnt

sudo git clone https://github.com/GudimArt/nixos.git

sudo nixos-install --root /mnt --flake /mnt --flake /mnt/etc/nixos/.#nix-sys