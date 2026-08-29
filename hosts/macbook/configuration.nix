{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix

    # Host-specific
    ./boot.nix
    ./graphics.nix
    ./wifi.nix
    ./portals.nix
    ./users.nix
    ./programs.nix
    ./locale.nix
    ./pkgs.nix
    ./de.nix

    # Shared
    ../../modules/networking-base.nix
    ../../modules/locale-base.nix
    ../../modules/audio-base.nix
    ../../modules/vim.nix
  ];

  networking.hostName = "macbook";

  # Allow unfree packages (needed for the broadcom_sta wifi driver)
  nixpkgs.config.allowUnfree = true;
 
  #fuckass broadcom driver
  nixpkgs.config.permittedInsecurePackages = [
    "broadcom-sta-6.30.223.271-59-6.12.93"
  ];

  # Keep this at whatever the installer originally wrote -- don't
  # bump it to match the desktop's.
  system.stateVersion = "26.05"; # Did you read the comment?
}
