{ ... }: {
  services.openssh = {
    enable = true;
    ports = [ 22 ];

    settings = {
      AllowUsers = [ "ed" ];
      UseDns = true;
      X11Forwarding = false;
      PermitRootLogin = "prohibit-password";
    };
  };
}
