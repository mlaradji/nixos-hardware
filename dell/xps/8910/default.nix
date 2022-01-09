{ lib, pkgs, ... }:
{
  imports = [
    ../../../common/cpu/intel/sky-lake
    ../../../common/gpu/nvidia.nix
    ./common.nix
  ];

  # This configuration enables both intel and nvidia gpus.
  # To Optimize for your use case import intel or nvidia only configuration instead
  # xps-8910/intel
  # or
  # xps-8910/nvidia

  hardware.nvidia.offload.prime.enable = false; # Seems to be incompatible with some options;
  services.xserver.videoDrivers = lib.mkDefault [ "intel" "nvidia" ];
  boot.blacklistedKernelModules = lib.mkDefault [ "nouveau" "bbswitch" ];
  boot.extraModulePackages = lib.mkDefault [ pkgs.linuxPackages.nvidia_x11 ];
}
