{
  config,
  pkgs,
  ...
}: {
  services.displayManager.gdm.enable = true;
  services.desktopManager.gnome.enable = true;
  services.gnome = {
    core-apps.enable = false;
    core-developer-tools.enable = false;
    games.enable = false;
  };
  programs.gnome-disks.enable = true;
  services = {
    udisks2.enable = true;
    gvfs.enable = true;
  };
  environment.systemPackages = [
    pkgs.nautilus
    pkgs.foot
  ];
}
