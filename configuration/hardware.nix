{ config, lib, ... }:

{
  boot.initrd.availableKernelModules = [
    "nvme" 
    "xhci_pci" 
    "thunderbolt" 
    "usb_storage" 
    "usbhid" 
    "sd_mod" 
    "rtsx_pci_sdmmc" 
  ];
  boot.initrd.kernelModules = [  ];
  boot.kernelModules = [ "kvm-amd" ];
  boot.extraModulePackages = [  ];

  fileSystems."/boot" = {
    device = "/dev/disk/by-uuid/7CDD-35A8";
    fsType = "vfat";
    options = [ "fmask=0022" "dmask=0022" ];
  };

  boot.initrd.luks.devices."cryptroot" = {
  	 device = "/dev/disk/by-partlabel/cryptroot";
  	 allowDiscards = true;
  };

  fileSystems."/" = {
    device = "/dev/mapper/cryptroot";
    fsType = "btrfs";
    options = [ "subvol=@" "noatime" "compress=zstd" ];
  };

  fileSystems."/home" = {
    device = "/dev/mapper/cryptroot";
    fsType = "btrfs";
    options = [ "subvol=@home" "noatime" "compress=zstd" ];
  };

  fileSystems."/nix" = {
    device = "/dev/mapper/cryptroot";
    fsType = "btrfs";
    options = [ "subvol=@nix" "noatime" "compress=zstd" ];
  };

  fileSystems."/home/.snapshots" = {
    device = "/dev/mapper/cryptroot";
    fsType = "btrfs";
    options = [ "subvol=@snapshots" "noatime" "compress=zstd" ];
  };

  fileSystems."/home/riley/Games" = {
    device = "/dev/mapper/cryptroot";
    fsType = "btrfs";
    options = [ "subvol=@games" "noatime" "compress=zstd" ];
  };

  swapDevices = [{ device = "/swap/swapfile"; }];

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";

  hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
  hardware.enableRedistributableFirmware = true;

hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  services.xserver.videoDrivers = [ "amdgpu" "nvidia" ];

  hardware.nvidia = {
    package = config.boot.kernelPackages.nvidiaPackages.stable;
    open = true;
    nvidiaSettings = true;
    modesetting.enable = true;

    powerManagement = {
      enable = true;
        finegrained = false;
    };
  };

  hardware.nvidia.prime = {
    amdgpuBusId = "PCI:101:0:0";
    nvidiaBusId = "PCI:100:0:0";
    
    offload = {
      enable = true;
       enableOffloadCmd = true;
    };
  };  
}
