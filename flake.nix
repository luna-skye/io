{
  description = "Luna's NixOS Server Configurations";


  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };


  outputs = inputs@{ self, nixpkgs, ... }: let
    inherit (inputs.nixpkgs) lib;
    bead = import ./lib { inherit self; inherit inputs; };

    # Returns a NixOS System configured for the specified host with overlaid home-manager users
    # 
    # ## Arguments
    # - `host`: The name of the host system
    # - `users`: A list of string names for home-manager users to overlay onto the system
    mkNixosHost = host: lib.nixosSystem {
      specialArgs = { inherit inputs; inherit bead; };
      system = "x86_64-linux";
      modules = [
        (./hosts + "/${host}/hardware.nix")
        (./hosts + "/${host}/configuration.nix")
        (./modules/nix.nix)
      ];
    };
  in {
    nixosConfigurations = {
      bebop = mkNixosHost "bebop";
    };
  };
}
