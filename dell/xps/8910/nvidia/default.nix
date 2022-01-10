{ lib, pkgs, ... }:

{
  imports = [
    ../common.nix
  ];

  # This runs only nvidia, great for games or heavy use of render applications

  ##### disable intel, run nvidia only and as default
  services.xserver.videoDrivers = lib.mkDefault [ "nvidia" ];
  hardware.nvidia.prime.offload.enable = false;
  hardware.nvidia.modesetting.enable = lib.mkDefault true;
}
