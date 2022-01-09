{ lib, ... }:
{
  boot.kernelParams = [
    "intel_iommu=on"
  ];

  hardware.cpu.intel.sgx.provision.enable = lib.mkDefault true;
  hardware.nvidia.powerManagement.enable = lib.mkDefault true;
  hardware.nvidia.prime.intelBusId = lib.mkDefault "PCI:0:2:0";
  hardware.nvidia.prime.nvidiaBusId = lib.mkDefault "PCI:1:0:0";
  # musnix.soundcardPciId = lib.mkDefault "00:1f.3";

  security.tpm2.enable = true;

  services.thermald.enable = true;
  services.fwupd.enable = true;

  # Check S.M.A.R.T status of all disks and notify in case of errors
  services.smartd = {
    enable = true;
    # Monitor all devices connected to the machine at the time it's being started
    autodetect = true;
    notifications = {
      x11.enable = if config.services.xserver.enable then true else false;
      wall.enable = true; # send wall notifications to all users
    };
  };
}
