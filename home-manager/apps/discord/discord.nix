{pkgs, ...}:{
    nixpkgs.config ={allowUnfree = true;};
    home.packages = [
      pkgs.xwaylandvideobridge
      pkgs.discord
    ];
}
