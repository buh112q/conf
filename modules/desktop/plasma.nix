{pkgs, ...}: {
  services = {
    displayManager.ly = {
      enable = true;
      x11Support = false;
    };
    desktopManager.plasma6 = {
      enable = true;
      enableQt5Integration = false;
    };
  };
  programs = {
    noctalia = {
      enable = true;
      recommendedServices.enable = true;
    };
    gnome-disks.enable = true;
  };
  services = {
    udisks2.enable = true;
    gvfs.enable = true;
  };
  environment.systemPackages = [
    pkgs.ddcutil
    pkgs.foot
    pkgs.bibata-cursors
  ];
  environment.sessionVariables = {};
}
