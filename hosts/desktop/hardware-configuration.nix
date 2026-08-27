# PLACEHOLDER -- this was never uploaded to Claude, so this is not
# the real file. Copy your actual /etc/nixos/hardware-configuration.nix
# from the desktop machine here before building this host. It's
# machine-specific (disk UUIDs, detected kernel modules) and should
# never be shared between hosts or hand-written.
{ config, lib, pkgs, modulesPath, ... }:

{
  imports = [ (modulesPath + "/installer/scan/not-detected.nix") ];

  # <-- replace this entire file with the real one from the desktop
}
