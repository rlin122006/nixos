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
    pavucontrol
    quickshell
    satty
    signal-desktop
    spotify
    vesktop
    vlc
  ];
}
