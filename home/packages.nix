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
      DisableFirefoxAccounts = true;
      DisbaleTelemetry = true;
      DisableFirefoxStudies = true;
      DisablePocket = true;

      Preferences = {
        "ui.key.menuAccessKeyFocuses" = false; 

        "browser.aboutConfig.showWarning" = false;

        "browser.newtabpage.activity-stream.showSponsored" = false;
        "browser.newtabpage.activity-stream.showSponsoredTopSites" = false;
        "browser.newtabpage.activity-stream.showSponsoredCheckboxes" = false;
        "browser.newtabpage.activity-stream.default.sites" = "";
        "browser.newtabpage.activity-stream.feeds.section.topstories" = false;
        "browser.newtabpage.activity-stream.feeds.system.topstories" = false;
        "browser.newtabpage.activity-stream.feeds.topsites" = false;
        "browser.newtabpage.activity-stream.showWeather" = false;
        "browser.newtabpage.activity-stream.system.showWeather" = false;
        "browser.newtabpage.activity-stream.newtabWallpaper.enabled" = false;

        "geo.provider.use_geoclue" = false;

        "extensions.getAddons.showPane" = false;
        "extensions.htmlaboutaddons.recommendations.enabled" = false;
        "browser.discovery.enabled" = false;

        "browser.newtabpage.activity-stream.feeds.telemetry" = false;
        "browser.newtabpage.activity-stream.telemetry" = false;

        "app.shield.optoutstudies.enabled" = false;
        "app.normandy.enabled" = false;
        "app.normandy.api_url" = "";

        "breakpad.reportURL" = "";
        "browser.tabs.crashReporting.sendReport" = false;
        "browser.crashReports.unsubmittedCheck.autoSubmit2" = false;

        "captivedetect.canonicalURL" = "";
        "network.captive-portal-service.enabled" = false;
        "network.connectivity-service.enabled" = false;

        "browser.urlbar.speculativeConnect.enabled" = false;
        "browser.urlbar.quicksuggest.enabled" = false;
        "browser.urlbar.quicksuggest.nonsponsored" = false;
        "browser.urlbar.quicksuggest.sponsored" = false;
        "browser.search.suggest.enabled" = false;
        "browser.urlbar.suggest.searches" = false;
        "browser.urlbar.trending.featureGate" = false;
        "browser.urlbar.addons.featureGate" = false;
        "browser.urlbar.amp.featureGate" = false;
        "browser.urlbar.importDates.featureGate" = false;
        "browser.urlbar.market.featureGate" = false;
        "browser.urlbar.mdn.featureGate" = false;
        "browser.urlbar.weather.featureGate" = false;
        "browser.urlbar.wikipedia.featureGate" = false;
        "browser.urlbar.yelp.featureGate" = false;
        "browser.urlbar.yelpRealtime.featureGate" = false;
        "browser.formfill.enable" = false;

        "signon.autofillForms" = false;
        "signon.formlessCapture.enabled" = false;
        "network.auth.subresource-http-auth-allow" = 1;
        "security.webauthn.always_allow_direct_attestation" = false;

        "security.ssl.require_safe_negotiation" = true;
        "security.tls.enable_0rtt_data" = false;

        "security.cert_pinning.enforcement_level" = 2;
        "security.remote_settings.crlite_filters.enabled" = true;
        "security.pki.crlite_mode" = 2;

        "dom.security.https_only_mode" = true;
        "dom.security.https_only_mode_send_http_background_request" = false;

        "security.ssl.treat_unsafe_negotiation_as_broken" = true;
        "browser.xul.error_pages.expert_bad_cert" = true;

        "network.http.referer.XOriginTrimmingPolicy" = 2;
      };
    };
  };
}
