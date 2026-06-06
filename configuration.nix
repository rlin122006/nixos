{
  system.stateVersion = "25.11";
  nix.nixPath = [ "nixos-config=/home/riley/nixos/configuration.nix" ];
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  imports = [
    ./configuration/hardware.nix
    ./configuration/system.nix
    ./configuration/network.nix
    ./configuration/graphics.nix
    ./configuration/system-packages.nix
  ];
}
