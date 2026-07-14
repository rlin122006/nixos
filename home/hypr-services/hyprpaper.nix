{ ... }:

{
  services.hyprpaper = {
    enable = true;

    settings = {
      splash = false;

      wallpaper = [
        {
          monitor = "";
          path = "~/nixos/home/hypr-services/lofi-girl.png";
          fit_mode = "fill";
        }
      ];

      wallpaper = [
        {
          monitor = "HDMI-A-1";
          path = "~/nixos/home/hypr-services/lofi-girl-1080.png";
          fit_mode = "fill";
        }
      ];
    };
  };
}
