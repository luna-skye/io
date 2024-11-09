{ lib, utils, pkgs, ... }: {
  programs.tmux = {
    enable = lib.mkDefault true;
  };
}
