{ lib, pkgs, ... }:

{
  imports = [
    ../../../../common/cpu/intel
    ../../../../common/gpu/nvidia-disable.nix
    ../common.nix
  ];
}
