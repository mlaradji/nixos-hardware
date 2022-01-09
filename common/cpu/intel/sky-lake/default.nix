{
  imports = [ 
    ../. 
    ../kaby-lake
  ];

  nix.systemFeatures = [
    "kvm"
    "gccarch-skylake"
  ];

  boot.kernelParams = [
    "i915.enable_guc=${if config.virtualisation.kvmgt.enable then 0 else 2}" # See https://wiki.archlinux.org/title/intel_graphics#Enable_GuC_/_HuC_firmware_loading
  ];
}
