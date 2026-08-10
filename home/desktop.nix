{ pkgs }:

{
  home.pointerCursor = {
    enable = true;
    name = "Bibata-Original-Ice";
    package = pkgs.bibata-cursors;
    size = 24;
    hyprcursor.enable = true;
    gtk.enable = true;
    x11.enable = true;
  };
  
  programs.fuzzel = {
    enable = true;

    settings = {
      main  = {
        namespace = "fuzzel";
        font = "Maple Mono NL NF:weight=bold";
        prompt = "~>";
      };

      colors = {
        background = "332a5780";
        text = "e5e5e5ff";
        prompt = "e5e5e5ff";
        input = "e5e5e5ff";
        match = "e5e5e5ff";
        selection = "e5e5e5ff";
        selection-text = "332a5780";
        selection-match = "332a5780";
        border = "ffb0ffff";
      };

      border = {
        width = 2;
        radius = 16;
        selection-radius = 6;
      };
    };
  };

  services.mako = {
    enable = true;

    settings = {
      max-history = 4;
      sort = "-time";

      on-button-left = "invoke-default-action";
      on-button-right = "dismiss";
      on-touch = "invoke-default-action";

      font = "Maple Mono NL NF";
      background-color = "#332a5780";
      text-color = "#e5e5e5ff";
      width = 400;
      height = 100;
      border-size = 1;
      border-radius = 8;
      border-color = "#ffb0ffff";
      actions = 1;
      history = 1;
      text-alignment = "left";
      default-timeout=10000;
      max-visible = 4;
      anchor = "top-right";
    };
  };
}
