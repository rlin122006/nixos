{ ... }:

{
  programs.kitty = {
    enable = true;
    shellIntegration.enableFishIntegration = true;

    font = {
      name = "Maple Mono NL NF Italic";
      size = 12.0;
    };

    settings = {
      shell_integration = "no-cursor";
      cursor_shape = "beam";
      cursor_shape_unfocused = "underline";

      scrollback_lines = 10000;
      scrollbar = "hovered";
      scrollbar_handle_color = "foreground";
      scrollbar_track_color = "selection_background";

      mouse_hide_wait = -1.0;

      repaint_delay = 6;
      input_delay = 1;
      sync_to_monitor = "yes";

      enable_audio_bell = "no";

      window_padding_width = 10;
      background_opacity = 0.50;
      dynamic_background_opacity = "yes";

      cursor = "#21f6bc";
      cursor_text_color = "#999999";
      foreground = "#e5e5e5";
      selection_foreground = "#332a57";
      background = "#332a57";
      selection_background = "#e5e5e5";
      url_color = "#0000ee";

      # black
      color0 = "#000000";
      color8 = "#595959";

      # red
      color1 = "#ff7092";
      color9 = "#ff8aa4";

      # green
      color2 = "#00fbac";
      color10 = "#21f6bc";

      # yellow
      color3 = "#fffa6a";
      color11 = "#fff787";

      # blue
      color4 = "#00bfff";
      color12 = "#1bccfd";

      # magenta
      color5 = "#df95ff";
      color13 = "#e6aefe";

      # cyan
      color6 = "#86cbfe";
      color14 = "#99d6fc";

      # white
      color7 = "#ffffff";
      color15 = "#ffffff";
    };
  };
}
