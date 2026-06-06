{ ... }:

{
  programs.fastfetch = {
    enable = true;

    settings = {
      logo = {
        source = "nixos_small";

        padding = {
          left = 2;
          top = 1;
        };
      };
      modules = [
        {
          type = "title";
          format = "{#blue}┌──────────────── {#white}{user-name}@{host-name}{#blue} ────────────────┐";
        }
        {
          type = "host"; 
          key = "󰌢  PC";
          keyColor = "blue"; 
          format = "{1}";
        }
        { 
          type = "os"; 
          key = "│ ├󰌽 "; 
          keyColor = "blue";
          format = "{name} {version}";
        }
        { 
          type = "packages";
          key = "│ ├󰏗 "; 
          keyColor = "blue";
          format = "{nix-system} (system), {nix-user} (user)";
        }
        { 
          type = "wm";
          key = "│ ├󱂬 "; 
          keyColor = "blue";
        }
        { 
          type = "cpu";
          key = "│ ├󰻠 ";
          format = "{name}";
          keyColor = "blue";
        }
        { 
          type = "gpu";
          key = "│ ├󰍹 ";
          format = "{name}";
          keyColor = "blue";
          hideType = "integrated";
        }
        { 
          type = "disk";
          key = "└ └󰋊 ";
          format = "{size-used}/{size-total} ({size-percentage})";
          keyColor = "blue";
        }
        {
          type = "custom";
          format = "{#blue}└──────────────────────────────────────────────┘";
        }
        {
          type = "colors";
          paddingLeft = 0;
          symbol = "circle";
        }
      ];
    };
  };
}
