{
  config,
  lib,
  pkgs,
  modulesPath,
  ...
}: {
  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")
  ];

  boot.initrd.availableKernelModules = ["xhci_pci" "ahci" "nvme" "usbhid" "sd_mod"];
  boot.initrd.kernelModules = [];
  boot.kernelModules = ["kvm-amd"];
  boot.extraModulePackages = [];

  fileSystems."/" = {
    device = "/dev/disk/by-uuid/9eea76fb-83f3-4758-ae7d-c3ef7f675626";
    fsType = "btrfs";
    options = ["subvol=@rootfs" "defaults" "compress=zstd:1" "noatime"];
  };

  fileSystems."/nix" = {
    device = "/dev/disk/by-uuid/9eea76fb-83f3-4758-ae7d-c3ef7f675626";
    fsType = "btrfs";
    options = ["subvol=@nix" "defaults" "compress=zstd:1" "noatime"];
  };

  fileSystems."/home" = {
    device = "/dev/disk/by-uuid/9eea76fb-83f3-4758-ae7d-c3ef7f675626";
    fsType = "btrfs";
    options = ["subvol=@home" "defaults" "compress=zstd:1" "noatime"];
  };

  fileSystems."/boot" = {
    device = "/dev/disk/by-uuid/1721-0F90";
    fsType = "vfat";
    options = ["fmask=0077" "dmask=0077"];
  };

  fileSystems."/mnt/SATA" = {
    device = "/dev/disk/by-uuid/56dffcc4-4db4-4d53-b4ee-47d40f74e79d";
    fsType = "ext4";
    options = ["defaults" "noatime"];
  };

  swapDevices = [];

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
