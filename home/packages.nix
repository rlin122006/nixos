{ inputs, pkgs, ... }:

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
    (callPackage ./palera1n.nix {})
    pavucontrol
    inputs.pineconemc.packages.${pkgs.stdenv.hostPlatform.system}.pineconemc
    quickshell
    satty
    signal-desktop
    spotify
    usbmuxd
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

        # arkenfox
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

        "browser.safebrowsing.downloads.remote.enabled" = false;

        "network.prefetch-next" = false;
        "network.dns.disablePrefetch" = true;
        "network.dns.disablePrefetchFromHTTPS" = true;
        "network.http.speculative-parallel-limit" = 0;
        "browser.places.speculativeConnect.enabled" = false;

        "network.proxy.socks_remote_dns" = true;
        "network.file.disable_unc_paths" = true;
        "network.gio.supported-protocols" = "";

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

        "media.peerconnection.ice.proxy_only_if_behind_proxy" = true;
        "media.peerconnection.ice.default_address_only" = true;

        "dom.disable_window_move_resize" = true;

        "browser.download.start_downloads_in_tmp_dir" = true;
        "browser.helperApps.deleteTempFileOnExit" = true;
        "browser.uitour.enabled" = false;
        "devtools.debugger.remote-enabled" = false;
        "permissions.manager.defaultUrl" = "";
        "network.IDN_show_punycode" = true;
        "pdfjs.disabled" = false;
        "pdfjs.enableScripting" = false;
        "browser.tabs.searchclipboardfor.middleclick" = false;
        "browser.contentanalysis.enabled" = false;
        "browser.contentanalysis.default_result" = 0;
        "privacy.antitracking.isolateContentScriptResources" = true;
        "security.csp.reporting.enabled" = false;
        
        "browser.download.useDownloadDir" = false;
        "browser.download.alwaysOpenPanel" = false;
        "browser.download.manager.addToRecentDocs" = false;
        "browser.download.always_ask_before_handling_new_types" = true;

        "extensions.enabledScopes" = 5;
        "extensions.postDownloadThirdPartyPrompt" = false;

        "browser.contentblocking.category" = "strict";
        "privacy.trackingprotection.allow_list.baseline.enabled" = true;
        "privacy.trackingprotection.allow_list.convenience.enabled" = true;

        "privacy.sanitize.sanitizeOnShutdown" = true;

        "privacy.clearOnShutdown_v2.cache" = true;
        "privacy.clearOnShutdown_v2.historyFormDataAndDownloads" = false;
        "privacy.clearOnShutdown_v2.browsingHistoryAndDownloads" = false;
        "privacy.clearOnShutdown_v2.downloads" = false;
        "privacy.clearOnShutdown_v2.formdata" = true;
        "privacy.clearOnShutdown_v2.cookiesAndStorage" = true;

        "privacy.clearSiteData.cache" = true;
        "privacy.clearSiteData.cookiesAndStorage" = false;
        "privacy.clearSiteData.historyFormDataAndDownloads" = false;
        "privacy.clearSiteData.browsingHistoryAndDownloads" = false;
        "privacy.clearSiteData.formdata" = true;

        "privacy.clearHistory.cache" = true;
        "privacy.clearHistory.cookiesAndStorage" = false;
        "privacy.clearHistory.historyFormDataAndDownloads" = false;
        "privacy.clearHistory.browsingHistoryAndDownloads" = false;
        "privacy.clearHistory.formdata" = true;

        "privacy.sanitize.timeSpan" = 0;

        "privacy.window.maxInnerWidth" = 1600;
        "privacy.window.maxInnerHeight" = 900;
        "privacy.resistFingerprinting.block.mozAddonManager" = true;
        "privacy.spoof_english" = 1;
        "widget.non-native-theme.use-theme-accent" = false;
        "browser.link.open_newwindow" = 3;
        "browser.link.open_newwindow.restriction" = 0;

        "datareporting.policy.dataSubmissionEnabled" = false;
        "datareporting.healthreport.uploadEnabled" = false;

        "toolkit.telemetry.unified" = false;
        "toolkit.telemetry.enabled" = false;
        "toolkit.telemetry.server" = "data:,";
        "toolkit.telemetry.archive.enabled" = false;
        "toolkit.telemetry.newProfilePing.enabled" = false;
        "toolkit.telemetry.shutdownPingSender.enabled" = false;
        "toolkit.telemetry.updatePing.enabled" = false;
        "toolkit.telemetry.bhrPing.enabled" = false;
        "toolkit.telemetry.firstShutdownPing.enabled" = false;
        "toolkit.telemetry.coverage.opt-out" = true;
        "toolkit.coverage.opt-out" = true;
        "toolkit.coverage.endpoint.base" = "";

        "browser.startup.homepage_override.mstone" = "ignore";
        "browser.newtabpage.activity-stream.asrouter.userprefs.cfr.addons" = false;
        "browser.newtabpage.activity-stream.asrouter.userprefs.cfr.features" = false;
        "browser.urlbar.showSearchTerms.enabled" = false;
      };
    };
  };

  services.mpd = {
    enable = true;
    musicDirectory = "~/Music";

    network = {
      listenAddress = "127.0.0.1";
      port = 6600;
      startWhenNeeded = true;
    };
    
    extraConfig = ''
      audio_output {
        type "pipewire"
        name "PipeWire Output"
      }
      auto_update "yes"
      restore_paused "yes"
    '';
  };

  services.mpd-mpris.enable = true;
}

  programs.rmpc = {
    enable = true;
    config = ''
      #![enable(implicit_some)]
      #![enable(unwrap_newtypes)]
      #![enable(unwrap_variant_newtypes)]

      (
        address: "127.0.0.1:6600",
        theme: "theme",
        volume_step: 1,
        max_fps: 30,
        scrolloff: 0,
        wrap_navigation: true,
        enable_mouse: true,
        scroll_amount: 1,
        enable_config_hot_reload: true,
        enable_lyrics_hot_reload: false,
        status_update_interval_ms: 1000,
        rewind_to_start_sec: None,
        keep_state_on_song_change: true,
        reflect_changes_to_playlist: false,
        select_current_song_on_change: false,
        ignore_leading_the: false,
        browser_song_sort: [Disc, Track, Artist, Title],
        directories_sort: SortFormat(group_by_type: true, reverse: false),
        auto_open_downloads: true,

        album_art: (
          method: Auto,
          max_size_px: (width: 1200, height: 1200),
          disabled_protocols: ["http://", "https://"],
          vertical_align: Center,
          horizontal_align: Center,
        ),

        keybinds: (
          global: {
            "q":          Quit,
            "?":          ShowHelp,
            "z":          ToggleRepeat,
            "x":          ToggleRandom,
            "c":          ToggleConsume,
            "v":          ToggleSingle,
            "p":          TogglePause,
            "s":          Stop,
            ">":          NextTrack,
            "<":          PreviousTrack,
            ".":          VolumeUp,
            ",":          VolumeDown,
            "<Tab>":      NextTab,
            "u":          Update,
            "U":          Rescan,
          },

          navigation: {
            "<C-c>":      Close,
            "<Esc>":      Close,
            "k":          Up,
            "j":          Down,
            "h":          Left,
            "l":          Right,
            "<Up>":       Up,
            "<Down>":     Down,
            "<Left>":     Left,
            "<Right>":    Right,
            "f":          EnterSearch,
            "n":          NextResult,
            "a":          Add,
            "A":          AddAll,
            "i":          ShowInfo,
          },

          queue: {
            "d":          Delete,
            "D":          DeleteAll,
          },
        ),

        search: (
          case_sensitive: false,
          ignore_diacritics: false,
          search_button: false,
          mode: Contains,

          tags: [
            (value: "any",         label: "Any Tag"),
            (value: "artist",      label: "Artist"),
            (value: "album",       label: "Album"),
            (value: "albumartist", label: "Album Artist"),
            (value: "title",       label: "Title"),
            (value: "filename",    label: "Filename"),
            (value: "genre",       label: "Genre"),
          ],
        ),

        artists: (
          album_display_mode: SplitByDate,
          album_sort_by: Date,
          album_date_tags: [Date],
        ),
	
        tabs: [
        (
          name: "Queue",

          pane: Split(
              direction: Horizontal,
              panes: [(size: "60%", pane: Pane(Queue)), (size: "40%", pane: Pane(AlbumArt))],
            ),
          ),
          (
            name: "Directories",
            pane: Pane(Directories),
          ),
        ],
      )
    '';
  };

  xdg.configFile."rmpc/themes/theme.ron".text = ''
    #![enable(implicit_some)]
    #![enable(unwrap_newtypes)]
    #![enable(unwrap_variant_newtypes)]

    (
      default_album_art_path: None,
      draw_borders: false,
      show_song_table_header: false,
      symbols: (song: "🎵", dir: "📁", playlist: "🎼", marker: "\u{e0b0}"),

      layout: Split(
        direction: Vertical,
        panes: [
          (
            pane: Pane(Header),
            size: "1",
          ),
          (
            pane: Pane(TabContent),
            size: "100%",
          ),
          (
            pane: Pane(ProgressBar),
            size: "1",
          ),
        ],
      ),

      progress_bar: (
        symbols: ["", "", "⭘", " ", " "],
        track_style: (bg: None),
        elapsed_style: (fg: "#e5e5e5", bg: None),
        thumb_style: (fg: "#e5e5e5", bg: None),
      ),

      scrollbar: (
        symbols: ["│", "█", "▲", "▼"],
        track_style: (fg: "#e5e5e5"),
        ends_style: (fg: "#e5e5e5"),
        thumb_style: (fg: "#e5e5e5"),
      ),

      browser_column_widths: [20, 38, 42],
      text_color: "#e5e5e5",
      background_color: None,
      header_background_color: None,
      modal_background_color: None,
      modal_backdrop: false,
      tab_bar: (active_style: (fg: "black", bg: "#f5c2e7", modifiers: "Bold"), inactive_style: ()),
      borders_style: (fg: "#e5e5e5"),
      highlighted_item_style: (fg: "#e5e5e5", modifiers: "Bold"),
      current_item_style: (fg: "#332a57", bg: "#e5e5e5", modifiers: "Bold"),
      highlight_border_style: (fg: "#f5c2e7"),

      song_table_format: [
        (
          prop: (kind: Property(Artist), style: (fg: "#e5e5e5"), default: (kind: Text("Unknown"))),
          width: "50%",
          alignment: Right,
        ),
        (
          prop: (kind: Text("-"), style: (fg: "#e5e5e5"), default: (kind: Text("Unknown"))),
          width: "1",
          alignment: Center,
        ),
        (
          prop: (kind: Property(Title), style: (fg: "#e5e5e5"), default: (kind: Text("Unknown"))),
          width: "50%",
        ),
      ],

      header: (
        rows: [
          (
            left: [
              (kind: Text("["), style: (fg: "#e5e5e5", modifiers: "Bold")),
              (kind: Property(Status(State)), style: (fg: "#e5e5e5", modifiers: "Bold")),
              (kind: Text("]"), style: (fg: "#e5e5e5", modifiers: "Bold"))
            ],

            center: [
              (kind: Property(Song(Artist)), style: (fg: "#e5e5e5", modifiers: "Bold"),
                default: (kind: Text("Unknown"), style: (fg: "#e5e5e5", modifiers: "Bold"))
              ),
              (kind: Text(" - ")),
              (kind: Property(Song(Title)), style: (fg: "#e5e5e5", modifiers: "Bold"),
                default: (kind: Text("No Song"), style: (fg: "#e5e5e5", modifiers: "Bold"))
              )
            ],

            right: [
              (kind: Text("Vol: "), style: (fg: "#e5e5e5", modifiers: "Bold")),
              (kind: Property(Status(Volume)), style: (fg: "#e5e5e5", modifiers: "Bold")),
              (kind: Text("% "), style: (fg: "#e5e5e5", modifiers: "Bold"))
            ]
          )
        ],
      ),
    )
  '';
