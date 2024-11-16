{ bead, pkgs, ... }: {
  imports = bead.getSubmodules ../modules;

  environment.systemPackages = builtins.attrValues { inherit (pkgs)
    fastfetch
    wget
    git gitui
    just
    tmux
    btop
    yazi
    zoxide
    eza
    sloc
    yt-dlp
    ffmpeg_4-full
    fd
    ripgrep
    p7zip
    file
    moreutils
    ;
  };
}
