{pkgs, ...}: {
  services.displayManager.ly = {
    enable = true;
    x11Support = false;
  };
  programs = {
    niri = {
      enable = true;
      useNautilus = true;
    };
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
    pkgs.xwayland-satellite
    pkgs.ddcutil
    pkgs.nautilus
    pkgs.foot
    pkgs.bibata-cursors
  ];
  environment.sessionVariables = {};
}
