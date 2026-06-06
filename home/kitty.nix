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

      cursor = "#b9b9b9";
      cursor_text_color = "#101010";
      foreground = "#b9b9b9";
      selection_foreground = "#101010";
      background = "#101010";
      selection_background = "#b9b9b9";
      url_color = "#0000ee";

      # black
      color0 = "#101010";
      color8 = "#525252";

      # red
      color1 = "#7c7c7c";
      color9 = "#7c7c7c";

      # green
      color2 = "#8e8e8e";
      color10 = "#a6e3a1";

      # yellow
      color3 = "#a0a0a0";
      color11 = "#a0a0a0";

      # blue
      color4 = "#686868";
      color12 = "#686868";

      # magenta
      color5 = "#747474";
      color13 = "#747474";

      # cyan
      color6 = "#868686";
      color14 = "#868686";

      # white
      color7 = "#b9b9b9";
      color15 = "#f7f7f7";
    };
  };
}
