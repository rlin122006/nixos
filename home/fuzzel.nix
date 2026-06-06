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
        background = "10101080";
        text = "b9b9b9ff";
        prompt = "b9b9b9ff";
        input = "b9b9b9ff";
        match = "b9b9b9ff";
        selection = "b9b9b9ff";
        selection-text = "10101080";
        selection-match = "10101080";
        border = "f7f7f7ff";
      };

      border = {
        width = 1;
        radius = 16;
        selection-radius = 6;
      };
    };
  };
}
