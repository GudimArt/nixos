{
  services =
  {
    # Enable the X11 windowing system.
    xserver.desktopManager.plasma5.enable = false;

    # Enable the KDE Plasma Desktop Environment.
    displayManager.sddm.enable = true;
    desktopManager.plasma6.enable = true;
    displayManager.sddm.wayland.enable = true;

    #Configure keymap in X11;
    xserver.xkbModel = "microsoft";
    xserver.layout = "us,ru";
    xserver.xkbVariant = "winkeys";
    xserver.xkbOptions = "grp:caps_toggle,grp_led:caps";

    # Enable automatic login for the user.
    displayManager.autoLogin.enable = true;
    displayManager.autoLogin.user = "artem";
  };
}
