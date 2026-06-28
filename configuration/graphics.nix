{ config, ... }:

{
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
