{
  services.xserver =
  {
    # Enable the X11 windowing system.
    enable = true;

    # Enable the KDE Plasma Desktop Environment.
    displayManager.sddm.enable = true;
    desktopManager.plasma6.enable = true;
    displayManager.sddm.wayland.enable = true;

    #Configure keymap in X11;
    xkbModel = "microsoft";
    layout = "us,ru";
    xkbVariant = "winkeys";
    xkbOptions = "grp:caps_toggle,grp_led:caps";

    # Enable automatic login for the user.
    displayManager.autoLogin.enable = true;
    displayManager.autoLogin.user = "artem";
  };
}
