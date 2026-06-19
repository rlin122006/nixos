{ inputs, pkgs, ... }:
let 
  pkgs-dwproton = import inputs.nixpkgs-dwproton { system = pkgs.stdenv.hostPlatform.system; };
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

    inputs.pineconemc.packages.${pkgs.system}.pineconemc
  ];

  nixpkgs.overlays = [(final: prev: {
    btop = prev.btop.override {
      rocmSupport = true;
      cudaSupport = true;	
    };
  })];
}
