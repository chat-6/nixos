{ config, pkgs, ... }:

{
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Enable network manager applet
  programs.nm-applet.enable = true;

  # NOTE: networking.hostName is set per-host (in each host's
  # configuration.nix). Avahi/mDNS and the extra firewall ports are
  # also NOT here -- they were opened for a specific desktop service,
  # so they live in hosts/desktop/networking.nix.
}
