{ lib, ... }: {
  services.openssh = {
    enable = lib.mkDefault true;
    ports = [ 22 ];

    settings = {
      AllowUsers = [ "ed" ];
      UseDns = lib.mkDefault true;
      X11Forwarding = lib.mkDefault false;
      PermitRootLogin = lib.mkDefault "prohibit-password";
    };
  };
}
