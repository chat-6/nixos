{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix

    # Host-specific
    ./boot.nix
    ./graphics.nix
    ./wifi.nix
    ./users.nix
    ./programs.nix
    ./locale.nix
    ./pkgs.nix

    # Shared
    ../../modules/networking-base.nix
    ../../modules/locale-base.nix
    ../../modules/audio-base.nix
    ../../modules/flatpak.nix
    ../../modules/vim.nix
  ];

  networking.hostName = "macbook";

  # Flatpak
  services.flatpak.enable = true;

  # Allow unfree packages (needed for the broadcom_sta wifi driver)
  nixpkgs.config.allowUnfree = true;

  # Keep this at whatever the installer originally wrote -- don't
  # bump it to match the desktop's.
  system.stateVersion = "26.05"; # Did you read the comment?
}
