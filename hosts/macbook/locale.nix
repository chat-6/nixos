{ config, pkgs, ... }:

{
  # This is what the NixOS installer detected/defaulted to on this
  # machine. Change if your physical keyboard is actually German
  # like the desktop's.
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  console.keyMap = "us";
}
