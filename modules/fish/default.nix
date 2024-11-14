{ lib, pkgs, ... }: {
  programs.fish = {
    enable = lib.mkDefault true;
    package = pkgs.callPackage ./wrapper.nix;
  };
}
