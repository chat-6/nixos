{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix

    # Host-specific
    ./boot.nix
    ./graphics.nix
    ./desktop.nix
    ./audio.nix
    ./users.nix
    ./programs.nix
    ./filesystems.nix
    ./networking.nix
    ./locale.nix
    ./pkgs.nix

    # Shared
    ../../modules/networking-base.nix
    ../../modules/locale-base.nix
    ../../modules/audio-base.nix
    ../../modules/flatpak.nix
    ../../modules/vim.nix
  ];

  networking.hostName = "desktop";

  # Flatpak
  services.flatpak.enable = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  system.stateVersion = "25.11"; # Did you read the comment?
}
