{ config, pkgs, ... }:

{
  # systemd-boot generally works on Mac EFI, but Macs can be finicky
  # about writing new NVRAM boot entries (canTouchEfiVariables). If
  # this doesn't reliably boot after install, or you want a nicer
  # dual-boot picker with macOS, switch to rEFInd instead
  # (boot.loader.refind.enable = true;) rather than fighting NVRAM.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
}
