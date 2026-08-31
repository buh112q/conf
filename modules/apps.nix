{pkgs, ...}: {
  environment.systemPackages = [
    pkgs.fastfetch
    pkgs.btop-rocm
    pkgs.duf
    pkgs.bat
    pkgs.tree
    pkgs.ripgrep
    pkgs.fzf
    pkgs.fd
  ];
}
