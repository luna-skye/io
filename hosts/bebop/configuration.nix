{ config, pkgs, ... }: {
  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostId = "508fd7ee";
  networking.hostName = "bebop";
  networking.networkmanager.enable = true;

  services.getty.autologinUser = "ed";
  users.users.ed = {
    isNormalUser = true;
    description = "ed";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
      e2fsprogs
      ntfs3g
    ];
  };

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.11"; # Did you read the comment?

}
