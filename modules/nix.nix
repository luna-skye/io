{ lib, bead, pkgs, ... }: {
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

  # no ethical consumption under capitalism
  nixpkgs.config.allowUnfree = lib.mkDefault true;

  # Enable Nix Flakes and Nix-Command by default, we need them
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Force disable emergency mode, it's deadlocked NixOS systems for me in the past
  systemd.enableEmergencyMode = lib.mkForce false;


  # XServer & XKB
  services.xserver.enable = lib.mkDefault true;
  services.xserver.xkb = {
    layout = lib.mkDefault "us";
    variant = lib.mkDefault "";
  };

  # Internationalisation
  i18n.defaultLocale =  lib.mkDefault "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS        = lib.mkDefault "en_US.UTF-8";
    LC_IDENTIFICATION = lib.mkDefault "en_US.UTF-8";
    LC_MEASUREMENT    = lib.mkDefault "en_US.UTF-8";
    LC_MONETARY       = lib.mkDefault "en_US.UTF-8";
    LC_NAME           = lib.mkDefault "en_US.UTF-8";
    LC_NUMERIC        = lib.mkDefault "en_US.UTF-8";
    LC_PAPER          = lib.mkDefault "en_US.UTF-8";
    LC_TELEPHONE      = lib.mkDefault "en_US.UTF-8";
    LC_TIME           = lib.mkDefault "en_US.UTF-8";
  };

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.11"; # Did you read the comment?
}
