{ ... }:

{
  networking.hostName = "arfarf";

  networking.networkmanager = {
    enable = true;
    dns = "systemd-resolved";
  };

  services.resolved = {
    enable = true;

    settings.Resolve = {
      DNS = "9.9.9.9#dns.quad9.net 149.112.112.112#dns.quad9.net";
      DNSOverTLS = "opportunistic";
      DNSSEC = "allow-downgrade";
      Domains = [ "~." ];
    };
  };

  networking.firewall = {
    enable = true;
    allowedTCPPorts = [ 53317 ];
    allowedUDPPorts = [ 53317 ];
  };

  hardware.bluetooth = {
    enable = true;
    powerOnBoot = false;
  };
  services.blueman.enable = true;

  programs.ssh = {
    knownHosts = {
      "github.com".publicKey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIOMqqnkVzrm0SdG6UOoqKLsabgH5C9okWi0dh2l9GKJl";
    };
  };
}
