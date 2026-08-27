{ config, pkgs, ... }:

{
  # Avahi / mDNS
  services.avahi = {
    enable = true;
    nssmdns4 = true; # or nssmdns on older releases
    publish = {
      enable = true;
      userServices = true;
    };
  };

  # Make sure avahi-daemon can bind to the network and mDNS ports aren't blocked
  networking.firewall = {
    allowedTCPPorts = [ 7000 7001 7100 ];
    allowedUDPPorts = [ 5353 6000 6001 7011 ];
  };
}
