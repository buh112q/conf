{pkgs, ...}: {
  services.displayManager.ly.enable = true;
  programs = {
    river-classic = {
      enable = true;
      xwayland.enable = true;
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
    pkgs.wlr-randr
    pkgs.ddcutil
    pkgs.nautilus
    pkgs.foot
    pkgs.bibata-cursors
  ];
  environment.sessionVariables = {};
}
