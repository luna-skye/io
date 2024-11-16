{ lib, utils, pkgs, ... }: {
  environment.systemPackages = [ pkgs.btop ];
}
