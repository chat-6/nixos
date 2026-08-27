{ config, pkgs, ... }:

{
  # Wireplumber fix pokernight -- forces the Arturia MiniFuse USB
  # interface (plugged into this machine) to stereo instead of the
  # multichannel default it advertises.
  environment.etc."wireplumber/main.lua.d/99-minifuse-stereo.lua".text = ''
    rule = {
      matches = {
        {
          { "node.name", "equals", "alsa_output.usb-ARTURIA_MiniFuse_1_8831400557052561-00.Direct__Direct__sink" },
        },
      },
      apply_properties = {
        ["audio.channels"] = 2,
        ["audio.position"] = "[ FL, FR ]",
      },
    }

    table.insert(alsa_monitor.rules, rule)
  '';
}
