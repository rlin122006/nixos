{ pkgs, ... }:

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
}
