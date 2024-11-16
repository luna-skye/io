{ self, inputs, ... }: let
  inherit (inputs.nixpkgs) lib;
in {
  #  FIX: The following functions rely on the long deprecated builtin function `toPath`
  #  SEE: https://nixos.wiki/wiki/Nix_Language:_Tips_%26_Tricks#Convert_a_string_to_an_.28import-able.29_path
  #  AND: https://github.com/NixOS/nix/issues/1074
  #  AND: https://github.com/NixOS/nix/pull/2524

  # Returns a list of all default.nix submodule entry points within a provided directory
  # 
  # ## Arguments
  # - `dir`: The directory to crawl for submodule entry points
  getSubmodules = dir: builtins.concatLists (lib.mapAttrsToList (path: kind: 
    if kind == "directory"
      then let
        file = "${builtins.toPath dir}/${path}/default.nix";
      in if builtins.pathExists file then [ file ] else []
    else [])
  (builtins.readDir dir));
}
