{
  programs.home-manager.enable = true;
  home.username = "riley";
  home.homeDirectory = "/home/riley";
  home.stateVersion = "26.05";

  imports = [
    ./home/shell.nix
    ./home/packages.nix
    ./home/hyprland.nix
    ./home/cursor.nix
    ./home/kitty.nix
    ./home/quickshell.nix
    ./home/neovim.nix
    ./home/fastfetch.nix
    ./home/fuzzel.nix
    ./home/mako.nix
    ./home/hypr-services/hypridle.nix
    ./home/hypr-services/hyprlock.nix
    ./home/hypr-services/hyprpaper.nix
    ./home/mpd.nix
    ./home/rmpc.nix
  ];
}
