{pkgs, ...}: {
  fonts = {
    fontDir.enable = true;
    packages = [
      pkgs.noto-fonts
      pkgs.noto-fonts-cjk-sans
      pkgs.nerd-fonts.jetbrains-mono
    ];
    fontconfig = {
      defaultFonts = {
        serif = ["Noto Serif"];
        sansSerif = ["Noto Sans" "Noto Sans Thai"];
        monospace = ["JetBrainsMono Nerd Font Mono"];
      };
    };
  };
}
