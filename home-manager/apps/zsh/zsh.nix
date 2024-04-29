{pkgs, ...}:{
  home.packages = [
        pkgs.oh-my-zsh
        pkgs.zsh
        pkgs.zsh-completions
        pkgs.zsh-powerlevel10k
        pkgs.zsh-syntax-highlighting
        pkgs.zsh-history-substring-search
    ];

    programs = {
      zsh = {
        enable = true;
        oh-my-zsh = {
          enable = true;
          theme = "robbyrussell";
          plugins = [
            "sudo"
            "terraform"
            "systemadmin"
            "vi-mode"
          ];
        };
      };
    };
}
