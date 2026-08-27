{
  description = "My NixOS configs";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";

  outputs = { self, nixpkgs, ... }: {
    nixosConfigurations = {
      desktop = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [ ./hosts/desktop/configuration.nix ];
      };

      macbook = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [ ./hosts/macbook/configuration.nix ];
      };
    };
  };
}
