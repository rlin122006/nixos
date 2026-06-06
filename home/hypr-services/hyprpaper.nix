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
    };
  };
}
