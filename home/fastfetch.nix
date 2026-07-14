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
          format = "{#red}┌──────────────── {#5bcffb}{user-name}{#white}@{#magenta}{host-name}{#red} ────────────────┐";
        }
        {
          type = "host"; 
          key = "󰌢  PC";
          keyColor = "red"; 
          format = "{1}";
        }
        { 
          type = "os"; 
          key = "│ ├󰌽 "; 
          keyColor = "red";
          format = "{name} {version}";
        }
        { 
          type = "packages";
          key = "│ ├󰏗 "; 
          keyColor = "red";
          format = "{nix-system} (system), {nix-user} (user)";
        }
        { 
          type = "wm";
          key = "│ ├󱂬 "; 
          keyColor = "red";
        }
        { 
          type = "cpu";
          key = "│ ├󰻠 ";
          format = "{name}";
          keyColor = "red";
        }
        { 
          type = "gpu";
          key = "│ ├󰍹 ";
          format = "{name}";
          keyColor = "red";
          hideType = "integrated";
        }
        { 
          type = "disk";
          key = "└ └󰋊 ";
          format = "{size-used}/{size-total} ({size-percentage})";
          keyColor = "red";
        }
        {
          type = "custom";
          format = "{#red}└──────────────────────────────────────────────┘";
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
