{ ... }:

{
  services.hyprpaper = {
    enable = true;

    settings = {
      splash = false;

      wallpaper = [
        {
          monitor = "";
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
