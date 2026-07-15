{ ... }:

{
  programs.fish = {
    enable = true;
    
    shellAliases = {
      winboot = "sudo efibootmgr --bootnext 0000 && reboot";
      vi = "nvim";
      laptopscreenoff = "hyprctl eval 'hl.monitor({ output = "eDP-1", disabled = true })'";
      laptopscreenon = "hyprctl eval 'hl.monitor({ output = "eDP-1", disabled = false })'";
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

  programs.starship = {
    enable = true;
    enableFishIntegration = true;

    settings = {
      add_newline = false;
      format = ''[\[](bold white)$username[@](bold white)$hostname[\]](bold white) $directory$character'';
      
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
