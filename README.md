curl https://raw.githubusercontent.com/GudimArt/nixos/main/disk-config.nix -o /tmp/disko-config.nux

sudo nix \
  --experimental-features "nix-command flakes" \
  run github:nix-community/disko -- \
  --mode disko /tmp/disko-config.nix


git clone https://github.com/GudimArt/nixos.git
