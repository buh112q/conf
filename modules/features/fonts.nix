{
  self,
  inputs,
  ...
}: {
  flake.nixosModules.fonts = {pkgs, ...}: {
    fonts = {
      fontDir.enable = true;
      enableDefaultPackages = true;
      packages = with pkgs; [
        nerd-fonts.jetbrains-mono
        noto-fonts
      ];
      fontconfig = {
        defaultFonts = {
          serif = ["Noto Serif"];
          sansSerif = ["Noto Sans"];
          monospace = ["JetBrainsMono Nerd Font"];
        };
      };
    };
    environment.systemPackages = with pkgs; [
      bibata-cursors
      papirus-icon-theme
    ];
    environment.variables = {
      XCURSOR_THEME = "Bibata-Modern-Classic";
      XCURSOR_SIZE = "20";
    };
  };
}
