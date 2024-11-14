{ symlinkJoin
, runCommand
, makeWrapper
, lib
, fish
}:

let
  sourcedFiles = {
    config = ./config.fish;
    abbr = ./abbr.fish;
  };

  cfgDir = runCommand "fish-configs" {} ''
    mkdir -p $out
    ln -s ${./functions} $out/functions
    ${lib.concatStringsSep "\n" (
      lib.mapAttrsToList (name: value:
        "ln -s ${value} $out/${name}.fish"
      ) sourcedFiles
    )}
  '';

  initCommands = /* fish */ ''
    set -p fish_function_path ${cfgDir}/functions
    ${lib.concatStringsSep "\n" (
      lib.mapAttrsToList (name: value:
        "source ${cfgDir}/${name}.fish"
      ) sourcedFiles
    )}
  '';
in symlinkJoin {
  name = "fish-wrapped";
  paths = [ fish cfgDir ];
  buildInputs = [ makeWrapper ];
  postBuild = ''
    wrapProgram $out/bin/fish \
      --add-flags '--init-command "${lib.concatStringsSep ";" (lib.splitString "\n" initCommands)}"'
  '';
  meta.mainProgram = "fish";
}
