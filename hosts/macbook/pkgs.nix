{ config, pkgs, ... }:

{
  # Kept intentionally light for 2011-era hardware. Add more as
  # needed -- see hosts/desktop/pkgs.nix for the full list this was
  # trimmed from.
  environment.systemPackages = with pkgs; [
    git
    tmux
    wget
    fish
    unzip
    p7zip
    neovim
  ];
}
