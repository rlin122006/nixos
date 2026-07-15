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
