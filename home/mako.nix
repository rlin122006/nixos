{ ... }:

{
  services.mako = {
    enable = true;

    settings = {
      max-history = 4;
      sort = "-time";

      on-button-left = "invoke-default-action";
      on-button-right = "dismiss";
      on-touch = "invoke-default-action";

      font = "Maple Mono NL NF";
      background-color = "#10101080";
      text-color = "#b9b9b9ff";
      width = 400;
      height = 100;
      border-size = 1;
      border-radius = 8;
      border-color = "#f7f7f7ff";
      actions = 1;
      history = 1;
      text-alignment = "left";
      default-timeout=10000;
      max-visible = 4;
      anchor = "top-right";
    };
  };
}
