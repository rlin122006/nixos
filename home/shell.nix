{ ... }:

{
  programs.fish = {
    enable = true;
    
    shellAliases = {
      update = "sudo nix flake update --flake /home/riley/nixos && sudo nixos-rebuild switch --flake /home/riley/nixos#arfarf";
      rebuild = "sudo nixos-rebuild switch --flake /home/riley/nixos#arfarf";
      winboot = "sudo efibootmgr --bootnext 0000 && reboot";
      vi = "nvim";
    };

    interactiveShellInit = ''
      set -g fish_greeting
      fastfetch
    '';
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
