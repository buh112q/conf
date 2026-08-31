{pkgs, ...}: {
  services.displayManager.ly = {
    enable = true;
    x11Support = false;
  };
  programs = {
    hyprland = {
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
    pkgs.grim
    pkgs.slurp
    pkgs.wl-clipboard
    pkgs.ddcutil
    pkgs.nautilus
    pkgs.foot
    pkgs.bibata-cursors
  ];
  environment.sessionVariables = {};
}
