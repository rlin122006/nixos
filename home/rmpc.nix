{ ... }:

{
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
        elapsed_style: (fg: "#b9b9b9", bg: None),
        thumb_style: (fg: "#b9b9b9", bg: None),
      ),

      scrollbar: (
        symbols: ["│", "█", "▲", "▼"],
        track_style: (fg: "#b9b9b9"),
        ends_style: (fg: "#b9b9b9"),
        thumb_style: (fg: "#b9b9b9"),
      ),

      browser_column_widths: [20, 38, 42],
      text_color: "#b9b9b9",
      background_color: None,
      header_background_color: None,
      modal_background_color: None,
      modal_backdrop: false,
      tab_bar: (active_style: (fg: "black", bg: "#f5c2e7", modifiers: "Bold"), inactive_style: ()),
      borders_style: (fg: "#b9b9b9"),
      highlighted_item_style: (fg: "#f7f7f7", modifiers: "Bold"),
      current_item_style: (fg: "#101010", bg: "#b9b9b9", modifiers: "Bold"),
      highlight_border_style: (fg: "#f5c2e7"),

      song_table_format: [
        (
          prop: (kind: Property(Artist), style: (fg: "#b9b9b9"), default: (kind: Text("Unknown"))),
          width: "50%",
          alignment: Right,
        ),
        (
          prop: (kind: Text("-"), style: (fg: "#b9b9b9"), default: (kind: Text("Unknown"))),
          width: "1",
          alignment: Center,
        ),
        (
          prop: (kind: Property(Title), style: (fg: "#b9b9b9"), default: (kind: Text("Unknown"))),
          width: "50%",
        ),
      ],

      header: (
        rows: [
          (
            left: [
              (kind: Text("["), style: (fg: "#b9b9b9", modifiers: "Bold")),
              (kind: Property(Status(State)), style: (fg: "#b9b9b9", modifiers: "Bold")),
              (kind: Text("]"), style: (fg: "#b9b9b9", modifiers: "Bold"))
            ],

            center: [
              (kind: Property(Song(Artist)), style: (fg: "#b9b9b9", modifiers: "Bold"),
                default: (kind: Text("Unknown"), style: (fg: "#b9b9b9", modifiers: "Bold"))
              ),
              (kind: Text(" - ")),
              (kind: Property(Song(Title)), style: (fg: "#b9b9b9", modifiers: "Bold"),
                default: (kind: Text("No Song"), style: (fg: "#b9b9b9", modifiers: "Bold"))
              )
            ],

            right: [
              (kind: Text("Vol: "), style: (fg: "#b9b9b9", modifiers: "Bold")),
              (kind: Property(Status(Volume)), style: (fg: "#b9b9b9", modifiers: "Bold")),
              (kind: Text("% "), style: (fg: "#b9b9b9", modifiers: "Bold"))
            ]
          )
        ],
      ),
    )
  '';
}
