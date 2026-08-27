{ config, pkgs, ... }:

{
  users.users.chat = {
    isNormalUser = true;
    description = "chat";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [];
  };
}
