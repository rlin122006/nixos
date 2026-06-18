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

        "browser.aboutConfig.showWarning" = false;

        "browser.newtabpage.activity-stream.showSponsored" = false;
        "browser.newtabpage.activity-stream.showSponsoredTopSites" = false;
        "browser.newtabpage.activity-stream.showSponsoredCheckboxes" = false;
        "browser.newtabpage.activity-stream.feeds.section.topstories" = false;
        "browser.newtabpage.activity-stream.feeds.system.topstories" = false;
        "browser.newtabpage.activity-stream.feeds.topsites" = false;
        "browser.newtabpage.activity-stream.showWeather" = false;
        "browser.newtabpage.activity-stream.system.showWeather" = false;
        "browser.newtabpage.activity-stream.newtabWallpaper.enabled" = false;
        "browser.newtabpage.activity-stream.newtabWallpapers.enabled" = false;
      };
    };
  };
}
