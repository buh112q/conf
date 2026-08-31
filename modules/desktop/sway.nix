{
  inputs,
  pkgs,
  ...
}: {
  services.displayManager.ly.enable = true;
  programs = {
    sway = {
      enable = true;
      xwayland.enable = true;
      package =
        inputs.swayfx.packages.${pkgs.stdenv.hostPlatform.system}.default
        // {
          providedSessions = ["sway"];
        };
      extraPackages = [];
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
    pkgs.ddcutil
    pkgs.nautilus
    pkgs.foot
    pkgs.bibata-cursors
  ];
  environment.sessionVariables = {};
}
