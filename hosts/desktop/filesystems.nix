{ config, pkgs, ... }:

{
  # Mount windows partition
  fileSystems."/mnt/windows" = {
    device = "/dev/disk/by-uuid/6E1EE3871EE346A5";
    fsType = "ntfs3";
    options = [ "rw" "uid=1000" "gid=1000" "dmask=022" "fmask=133" "nofail" ];
  };
}
