{
  programs.fish = {
    enable = true;
    
    shellAliases = {
      winboot = "sudo efibootmgr --bootnext 0000 && reboot";
      vi = "nvim";
      laptopscreenoff = "hyprctl eval 'hl.monitor({ output = \"eDP-1\", disabled = true })'";
      laptopscreenon = "hyprctl eval 'hl.monitor({ output = \"eDP-1\", disabled = false, mode=\"2880x1800@120.00\", position=\"0x0\", scale=2 })'";
      winmount = "sudo mount /dev/nvme0n1p3 /mnt";
      winumount = "sudo umount /mnt";
    };

    interactiveShellInit = ''
      function nixrebuild
        set msg (if count $argv > /dev/null; echo $argv[1]; else echo "rebuild"; end)
        git -C /home/riley/nixos add -A
        git -C /home/riley/nixos commit -m $msg
        sudo nixos-rebuild switch --flake /home/riley/nixos#arfarf
      end

      function nixupdate
        set msg (if count $argv > /dev/null; echo $argv[1]; else echo "update"; end)
        sudo nix flake update --flake /home/riley/nixos
        git -C /home/riley/nixos add -A
        git -C /home/riley/nixos commit -m $msg
        sudo nixos-rebuild switch --flake /home/riley/nixos#arfarf
      end

      set -g fish_greeting

      if status is-interactive
        and not string match -q '/dev/tty*' (tty)
        fastfetch
      end
    '';
  };
  
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    
    initLua = ''
      vim.api.nvim_set_hl(0,"Normal",{bg = "NONE"})
      vim.api.nvim_set_hl(0,"NormalNC",{bg = "NONE"})
      vim.api.nvim_set_hl(0,"SignColumn",{bg = "NONE"})

      vim.opt.shiftwidth = 2
      vim.opt.expandtab = true
      vim.opt.tabstop = 2
    '';
  };

  programs.ssh = {
    enable = true;
    enableDefaultConfig = false;

    settings = {
      "github.com" = {
        User = "git";
        IdentityFile = "/home/riley/.ssh/id_ed25519";
        AddKeysToAgent = "yes";
      };
    };
  };

  programs.kitty = {
    enable = true;
    shellIntegration.enableFishIntegration = true;

    font = {
      name = "Maple Mono NL NF Italic";
      size = 12.0;
    };

    settings = {
      shell_integration = "no-cursor";
      cursor_shape = "beam";
      cursor_shape_unfocused = "underline";

      scrollback_lines = 10000;
      scrollbar = "hovered";
      scrollbar_handle_color = "foreground";
      scrollbar_track_color = "selection_background";

      mouse_hide_wait = -1.0;

      repaint_delay = 6;
      input_delay = 1;
      sync_to_monitor = "yes";

      enable_audio_bell = "no";

      window_padding_width = 10;
      background_opacity = 0.50;
      dynamic_background_opacity = "yes";

      cursor = "#21f6bc";
      cursor_text_color = "#999999";
      foreground = "#e5e5e5";
      selection_foreground = "#332a57";
      background = "#332a57";
      selection_background = "#e5e5e5";
      url_color = "#0000ee";

      # black
      color0 = "#000000";
      color8 = "#595959";

      # red
      color1 = "#ff7092";
      color9 = "#ff8aa4";

      # green
      color2 = "#00fbac";
      color10 = "#21f6bc";

      # yellow
      color3 = "#fffa6a";
      color11 = "#fff787";

      # blue
      color4 = "#00bfff";
      color12 = "#1bccfd";

      # magenta
      color5 = "#df95ff";
      color13 = "#e6aefe";

      # cyan
      color6 = "#86cbfe";
      color14 = "#99d6fc";

      # white
      color7 = "#ffffff";
      color15 = "#ffffff";
    };
  };

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
          format = "{#red}┌──────────────── {#magenta}{user-name}{#white}@{#magenta}{host-name}{#red} ────────────────┐";
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

  programs.starship = {
    enable = true;
    enableFishIntegration = true;

    settings = {
      add_newline = false;
      format = ''[](bold white)$username[@](bold white)$hostname[\](bold white) $directory$character'';
      
      username = {
        style_root = "bold red";
        style_user = "bold white";
        format = "[$user]($style)";
        show_always = true;
        disabled = false;
      };

      hostname = {
        ssh_only = false;
        trim_at = "";
        format = "[$ssh_symbol$hostname]($style)";
        style = "bold white";
        disabled = false;
      };

      directory = {
        truncation_length = 1;
        truncate_to_repo = true;
        format = "[$path]($style)";
        style = "bold white";
        disabled = false;
        read_only = "";
        read_only_style = "bold red";
        truncation_symbol = "";
        home_symbol = "~";
        use_os_path_sep = true;
      };

      character = {
        format = "$symbol ";
        success_symbol = "[>](bold white)";
        error_symbol = "[>](bold white)";
        disabled = false;
      };
    };
  };
}
