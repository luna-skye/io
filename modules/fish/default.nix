{ lib, pkgs, ... }: let
  inherit (lib.strings) concatStringSep splitString;

  initCommands = /* fish */ ''
    set -p fish_function_path ${./functions}

    source ${./config.fish}
    source ${./abbr.fish}
  '';
in {
  programs.fish = {
    enable = lib.mkDefault true;

    package = pkgs.symlinkJoin {
      name = "fish-wrapped";
      paths = [ pkgs.fish ];
      buildInputs = [ pkgs.makeWrapper ];
      postBuild = ''
        wrapProgram $out/bin/fish \
          --add-flags '--init-command "${concatStringSep ";" (splitString "\n" initCommands)}"'
      '';
      meta.mainProgram = "fish";
    };
  };
}
