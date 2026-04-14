{
  self,
  inputs,
  ...
}: {
  flake.nixosModules.apps = {pkgs, ...}: {
    environment.systemPackages = with pkgs; [
      ripgrep
      btop
      fzf
      duf
      tree
      bat
      bitwarden-desktop
      vscodium-fhs
      gearlever
      localsend
      fastfetch
      jujutsu
    ];
  };
}
