{ lib, utils, pkgs, ... }: {
  programs.fish = {
    enable = lib.mkDefault true;
  };
}
