{ config, pkgs, ... }:

{
  # Minimal XDG portal setup (used for screen sharing, file pickers,
  # etc. in various apps) even without a full desktop environment
  # installed yet. The GTK portal is the
  # sane default backend when nothing more specific (GNOME/KDE/wlr)
  # is in play. Once you pick a DE or compositor, you'll likely want
  # to add its matching portal backend here too (e.g.
  # xdg-desktop-portal-gnome, xdg-desktop-portal-kde, or
  # xdg-desktop-portal-wlr for a wlroots compositor like river/sway)
  # and set xdg.portal.config accordingly -- see hosts/desktop/desktop.nix
  # for what that looks like once you're there.
  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  };
}
