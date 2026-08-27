{ config, pkgs, ... }:

{
  # Smth or other to make wayland work better.
  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";
    WLR_NO_HARDWARE_CURSORS = "1";
    WLR_RENDERER_ALLOW_SOFTWARE = "1"; # fallback if needed
    GBM_BACKEND = "nvidia-drm";
    __GLX_VENDOR_LIBRARY_NAME = "nvidia";
    LIBVA_DRIVER_NAME = "nvidia";
    XDG_CURRENT_DESKTOP = "river"; # helps portals identify the compositor
    NIXOS_XDG_OPEN_USES_PORTAL = "0";
  };

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Arrange monitors
  # services.xserver.displayManager.setupCommands = ''
  #   xrandr --output DP-1 --primary --mode 2560x1440 --pos 0x0
  #   xrandr --output HDMI-1 --mode 1920x1080 --right-of DP-1
  # '';

  # Gnome keyring
  services.gnome.gnome-keyring.enable = true;

  # Wayland portal
  xdg = {
    portal = {
      enable = true;
      xdgOpenUsePortal = true;
      extraPortals = [
        pkgs.xdg-desktop-portal-wlr
        pkgs.xdg-desktop-portal-gtk
        pkgs.kdePackages.xdg-desktop-portal-kde
      ];
      config = {
        river.default = [ "wlr" "gtk" ];
        common.default = [ "gtk" ];
      };
    };
    autostart.enable = true;
  };

  # Polkit
  security.polkit.enable = true;
  services.dbus.enable = true;

  # Enable Plasma
  services.desktopManager.plasma6.enable = true;

  # Default display manager for Plasma
  services.displayManager.sddm = {
    enable = true;

    # To use Wayland (Experimental for SDDM)
    wayland.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;
}
