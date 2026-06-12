{ pkgs, ... }:

{
  home.packages = with pkgs; [
    btop
    efibootmgr
    git
    hyprshot
    keepassxc
    libreoffice-fresh
    librewolf
    localsend
    maple-mono.NL-NF
    maple-mono.variable
    pavucontrol
    quickshell
    satty
    signal-desktop
    spotify
    vesktop
    vlc
  ];
}
