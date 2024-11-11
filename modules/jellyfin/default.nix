{ pkgs, ... }: {
  services.jellyfin = {
    enable = true;
    openFirewall = true;
  };

  environment.systemPackages = builtins.attrValues { inherit (pkgs)
    jellyfin
    jellyfin-web
    jellyfin-ffmpeg
    ;
  };
}
