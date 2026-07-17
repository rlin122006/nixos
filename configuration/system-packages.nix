{ inputs, pkgs, ... }:
let 
  pkgs-dwproton = import inputs.nixpkgs-dwproton { 
    system = pkgs.stdenv.hostPlatform.system;
  };
in {
  programs = {
    fish.enable = true;
    hyprland.enable = true;

    steam = {
      enable = true;
      extraCompatPackages = [ pkgs-dwproton.dwproton-bin ];
    };
  };

  environment.sessionVariables.NIXOS_OZONE_WL = "1";

  environment.systemPackages = with pkgs; [
    micro
  ];

  nixpkgs.config.permittedInsecurePackages = [
    "pnpm-10.29.2"
    "electron-40.10.5"
  ];

  nixpkgs.overlays = [(final: prev: {
    btop = prev.btop.override {
      rocmSupport = true;
      cudaSupport = true;	
    };
  })];
}
