{pkgs, ...}: {

  nixpkgs.config.allowUnfree = true;
  nixpkgs.config.allowUnfreePredicate = (_: true);

  environment.systemPackages = with pkgs; [
     vim
     wget
     firefox
  ];
}
