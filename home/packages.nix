{ pkgs, ... }:

{
  home.packages = with pkgs; [
    btop
    efibootmgr
    git
    gocryptfs
    hyprshot
    keepassxc
    libreoffice-fresh
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

  programs.firefox = {
    enable = true;

    policies = {
      Preferences = {
        "ui.key.menuAccessKeyFocuses" = false; 

        #arkenfox
        "browser.aboutConfig.showWarning" = false;
      };
    };
  };
}
