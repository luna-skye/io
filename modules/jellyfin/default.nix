{ pkgs, ... }: {
  services.jellyfin = {
    enable = true;
    openFirewall = false;
  };

  environment.systemPackages = builtins.attrValues { inherit (pkgs)
    jellyfin
    jellyfin-web
    jellyfin-ffmpeg
    ;
  };
}
