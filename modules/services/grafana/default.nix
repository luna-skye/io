{ config, ... }: let
  cfg = config.services.grafana;
in {
  imports = [ ./prometheus.nix ];

  services.grafana = {
    enable = true;
    settings = {
      server = {
        http_addr = "0.0.0.0";
        http_port = 3000;
      };
    };
  };

  networking.firewall.allowedTCPPorts = [
    cfg.settings.http_port
  ];
}
