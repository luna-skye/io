{ config, ... }: let
  cfg = config.services.prometheus;
in {
  services.prometheus = {
    enable = true;
    port = 9000;

    exporters = {
      node = {
        enable = true;
        enabledCollectors = [ "systemd" ];
        port = 9001;
      };
    };

    globalConfig = {
      scrape_interval = "15s";
    };
    scrapeConfigs = [
      {
        job_name = "node";
        static_configs = [{
          targets = [ "localhost:${toString cfg.exporters.node.port}" ];
        }];
      }
    ];
  };

  # Open configured prometheus/exporter ports in the Firewall
  networking.firewall.allowedTCPPorts = [
    cfg.port
    cfg.exporters.node.port
  ];
}
