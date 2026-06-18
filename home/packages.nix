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
      DisableTelemetry = true;
      DisableFirefoxStudies = true;
      DisableFirefoxAccounts = true;
      DisablePocket = true;

      ExtensionSettings = {
        "uBlock@raymondhill.net" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/latest.xpi";
          installation_mode = "force_installed";
          private_browsing = true;
          default_area = "menupanel";
        };
      };

      Preferences = {
        "privacy.resistFingerprinting" = true; 
        "privacy.fingerprintingProtection" = true;
        "privacy.resistFingerprinting.letterboxing" = true;
        "privacy.trackingprotection.enabled" = true;
        "privacy.trackingprotection.emailtracking.enabled" = true;
        "privacy.trackingprotection.fingerprinting.enabled" = true;
        "privacy.trackingprotection.socialtracking.enabled" = true;
        
        "browser.contentblocking.category" = "strict";

        "cookiebanners.service.mode" = 2;
        "cookiebanners.service.mode.privateBrowsing" = 2;
        "privacy.clearOnShutdown.cookies" = true;

        "network.http.referer.XOriginPolicy" = 2;

        "privacy.query_stripping.enabled" = true;
        "privacy.query_stripping.enabled.pbmode" = true;

        "security.OCSP.require" = true;

        "network.trr.mode" = 5;

        "media.autoplay.default" = 5;

        "browser.urlbar.suggest.searches" = false;
        "browser.urlbar.quicksuggest.enabled" = false;

        "javascript.use_us_english_locale" = true;

        "privacy.donottrackheader.enabled" = true;

        "ui.key.menuAccessKeyFocuses" = false;

        "browser.newtabpage.activity-stream.showSponsored" = false;
        "browser.newtabpage.activity-stream.showSponsoredTopSites" = false;
      };
    };
  };
}
