{ pkgs, ... }:

{
  boot.loader = {
    grub = {
      enable = true;
      device = "nodev";
      efiSupport = true;
      useOSProber = true;
      configurationLimit = 10;
    };
    efi.canTouchEfiVariables = true;
    timeout = 10;
  };

  boot.kernelPackages = pkgs.linuxPackages_latest;

  time.timeZone = "America/New_York";
  i18n.defaultLocale = "en_US.UTF-8";

  console = {
    font = "ter-v32n";
    packages = [ pkgs.terminus_font ];
    keyMap = "us";
    earlySetup = true;
  };

  users.users.riley = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
    shell = pkgs.fish;
  };

  programs.appimage.enable = true;

  services.tlp = {
    enable = true;

    settings = {
      RUNTIME_PM_ON_AC = "on";
      RUNTIME_PM_ON_BAT = "auto";
      RUNTIME_PM_DENYLIST = "64:00.0 64:00.1";
      RUNTIME_PM_DRIVER_DENYLIST = "mei_me nouveau radeon xhci_hcd nvidia nvidia_modeset amdgpu";
      PCIE_ASPM_ON_AC = "default";
      PCIE_ASPM_ON_BAT = "default";

      PLATFORM_PROFILE_ON_AC = "performance";
      PLATFORM_PROFILE_ON_BAT = "balanced";
      PLATFORM_PROFILE_ON_SAV = "quiet";

      CPU_DRIVER_OPMODE_ON_AC = "active";
      CPU_DRIVER_OPMODE_ON_BAT = "active";
      CPU_DRIVER_OPMODE_ON_SAV = "active";

      CPU_SCALING_GOVERNOR_ON_AC = "performance";
      CPU_SCALING_GOVERNOR_ON_BAT = "powersave";
      CPU_SCALING_GOVERNOR_ON_SAV = "powersave";

      CPU_SCALING_MIN_FREQ_ON_AC = 0;
      CPU_SCALING_MAX_FREQ_ON_AC = 0;
      CPU_SCALING_MIN_FREQ_ON_BAT = 0;
      CPU_SCALING_MAX_FREQ_ON_BAT = 0;
      CPU_SCALING_MIN_FREQ_ON_SAV = 0;
      CPU_SCALING_MAX_FREQ_ON_SAV = 0;

      CPU_ENERGY_PERF_POLICY_ON_AC = "performance";
      CPU_ENERGY_PERF_POLICY_ON_BAT = "balance_power";
      CPU_ENERGY_PERF_POLICY_ON_SAV = "power";

      CPU_BOOST_ON_AC = 1;
      CPU_BOOST_ON_BAT = 0;
      CPU_BOOST_ON_SAV = 0;

      START_CHARGE_THRESH_BAT1 = 75;
      STOP_CHARGE_THRESH_BAT1 = 80;
    };
  };

  systemd.user.services.screen-powersaver = {
    wantedBy = [ "graphical-session.target" ];
    serviceConfig = {
      ExecStart = let
        script = pkgs.writeShellScript "screen-powersaver" ''
          prev = ""
          while true; do
            state=$(cat /sys/class/power_supply/ACAD/online)
            if [ "$state" != "$prev" ]; then
              if [ "$state" = "1" ]; then
                ${pkgs.hyprland}/bin/hyprctl eval 'hl.monitor({output="",mode="2880x1800@120.00",position="0x0",scale=2})'
                ${pkgs.brightnessctl}/bin/brightnessctl -d amdgpu_bl2 set 66%
              else
                ${pkgs.hyprland}/bin/hyprctl eval 'hl.monitor({output="",mode="2880x1800@60.00",position="0x0",scale=2})'
                ${pkgs.brightnessctl}/bin/brightnessctl -d amdgpu_bl2 set 33%
              fi
            prev=$state
          fi
          sleep 5
        done
      '';
      in "${script}";
    };
  };

  services.snapper = {
    snapshotInterval = "hourly";
    cleanupInterval = "1d";
    persistentTimer = true;
    configs = {
      home = {
        SUBVOLUME = "/home";
        TIMELINE_CREATE = true;
        TIMELINE_CLEANUP = true;
        TIMELINE_LIMIT_HOURLY = 24;
        TIMELINE_LIMIT_DAILY = 7;
        TIMELINE_LIMIT_WEEKLY = 4;
        TIMELINE_LIMIT_MONTHLY = 0;
      };
    };
  };

  nix.gc = {
    automatic = true;
    dates = "daily";
    options = "--delete-older-than 7d";
  };

  nix.optimise.automatic = true;

  services.fstrim = {
    enable = true;
    interval = "weekly";
  };
}
