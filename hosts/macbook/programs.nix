{ config, pkgs, ... }:

{
  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Install firefox.
  programs.firefox.enable = true;

  # Steam is skipped by default here -- Sandy Bridge + Intel HD 3000
  # is quite weak for gaming. Uncomment if you want it anyway:
  # programs.steam.enable = true;
}
