{ ... }:

{
  programs.hyprlock = {
    enable = true;

    settings = {
      general  = {
        hide_cursor = true;
        ignore_empty_input = true;
      };

      animations = {
        enabled = true;
        bezier = "linear, 1, 1, 0, 0";
        animation = [
          "fadeIn, 1, 5, linear"
          "fadeOut, 1, 5, linear"
          "inputFieldDots, 1, 2, linear"
        ];
      };

      background = [
        {
          monitor = "desc:Samsung Display Corp. ATNA40CU05-0";
          path = "~/nixos/home/hypr-services/wallpaper-1200.jpg";
          blur_passes = 3;
          blur_size = 8;
        }
        {
          monitor = "desc:Acer Technologies KG251Q T8ZAA00A8572";
          path = "~/nixos/home/hypr-services/wallpaper-1080.jpg";
          blur_passes = 3;
          blur_size = 8;
        }
      ];
      
      input-field = {
        monitor = "desc:Samsung Display Corp. ATNA40CU05-0";
        size = "20%, 5%";
        outline_thickness = 4;
        inner_color = "rgba(0, 0, 0, 0.0)";
        fade_on_empty = false;
        rounding = 8; 

        outer_color = "rgba(ffb0ffff)";
        check_color = "rgba(00fbacff)";
        fail_color = "rgba(ff7092ff)";
        font_color = "rgba(e5e5e5ff)";

        font_family = "Maple Mono NL NF Bold";
        placeholder_text = "haiiii!!!";
        fail_text = "try again :3c";

        dots_text_format = "*";
        dots_size = 0.4;
        dots_spacing = 0.3;

        position = "0, 300";
        halign = "center";
        valign = "bottom";
      };

      label = [
        {
          monitor = "desc:Samsung Display Corp. ATNA40CU05-0";
          text = [ ''cmd[update:1000] echo "<b><big> $(date +"%H") </big></b>"''];
          font_size = 175;
          font_family = "Maple Mono NL NF";
          color = "rgba(e5e5e5ff)";

          position = "0, 435";
          halign = "center";
          valign = "center";
        }
        {
          monitor = "desc:Samsung Display Corp. ATNA40CU05-0";
          text = [ ''cmd[update:1000] echo "<b><big> $(date +"%M") </big></b>"''];
          font_size = 175;
          font_family = "Maple Mono NL NF";
          color = "rgba(e5e5e5ff)";

          position = "0, 235";
          halign = "center";
          valign = "center";
        }
        {
          monitor = "desc:Samsung Display Corp. ATNA40CU05-0";
          text = [ ''cmd[update:18000000] echo "<b><big> "$(date +'%A')" </big></b>"'' ];
          font_size = 32;
          font_family = "Maple Mono NL NF";
          color = "rgba(e5e5e5ff)";

          position = "0, 110";
          halign = "center";
          valign = "center";
        }
        {
          monitor = "desc:Samsung Display Corp. ATNA40CU05-0";
          text = [ ''cmd[update:18000000] echo "<b> "$(date +'%d %b')" </b>"'' ];
          font_size = 28;
          font_family = "Maple Mono NL NF";
          color = "rgba(e5e5e5ff)";

          position = "0, 70";
          halign = "center";
          valign = "center";
        }
        {
          monitor = "desc:Acer Technologies KG251Q T8ZAA00A8572";
          text = [ ''cmd[update:1000] echo "<b><big> $(date +"%H") </big></b>"''];
          font_size = 175;
          font_family = "Maple Mono NL NF";
          color = "rgba(e5e5e5ff)";

          position = "0, 435";
          halign = "center";
          valign = "center";
        }
        {
          monitor = "desc:Acer Technologies KG251Q T8ZAA00A8572";
          text = [ ''cmd[update:1000] echo "<b><big> $(date +"%M") </big></b>"''];
          font_size = 175;
          font_family = "Maple Mono NL NF";
          color = "rgba(e5e5e5ff)";

          position = "0, 235";
          halign = "center";
          valign = "center";
        }
        {
          monitor = "desc:Acer Technologies KG251Q T8ZAA00A8572";
          text = [ ''cmd[update:18000000] echo "<b><big> "$(date +'%A')" </big></b>"'' ];
          font_size = 32;
          font_family = "Maple Mono NL NF";
          color = "rgba(e5e5e5ff)";

          position = "0, 110";
          halign = "center";
          valign = "center";
        }
        {
          monitor = "desc:Acer Technologies KG251Q T8ZAA00A8572";
          text = [ ''cmd[update:18000000] echo "<b> "$(date +'%d %b')" </b>"'' ];
          font_size = 28;
          font_family = "Maple Mono NL NF";
          color = "rgba(e5e5e5ff)";

          position = "0, 70";
          halign = "center";
          valign = "center";
        }
      ];
    };
  };
}
