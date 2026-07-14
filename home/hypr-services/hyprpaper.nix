{ ... }:

{
  services.hyprpaper = {
    enable = true;

    settings = {
      splash = false;

      wallpaper = [
        {
          monitor = "desc:Samsung Display Corp. ATNA40CU05-0";
          path = "~/nixos/home/hypr-services/wallpaper-1200.jpg";
          fit_mode = "fill";
        }
        {
          monitor = "HDMI-A-1";
          path = "~/nixos/home/hypr-services/wallpaper-1080.jpg";
          fit_mode = "fill";
        }
      ];
    };
  };
}
