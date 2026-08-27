{ config, pkgs, ... }:

{
  # The 2011 MacBook Pro's Broadcom BCM4331 wifi card needs the
  # proprietary "wl" driver — it isn't supported by the in-kernel
  # b43/brcmfmac drivers. This requires nixpkgs.config.allowUnfree,
  # which is already set in configuration.nix.
  boot.kernelModules = [ "wl" ];
  boot.extraModulePackages = [ config.boot.kernelPackages.broadcom_sta ];

  # These modules conflict with "wl" for this chip — make sure they
  # don't grab the device first.
  boot.blacklistedKernelModules = [ "b43" "bcma" ];
}
