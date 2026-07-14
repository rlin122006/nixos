{ ... }:

{
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
        border = "ef8dfcff";
      };

      border = {
        width = 1;
        radius = 16;
        selection-radius = 6;
      };
    };
  };
}
