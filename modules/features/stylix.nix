{
  self,
  inputs,
  ...
}: {
  flake.nixosModules.stylix = {pkgs, ...}: {
    imports = [
      inputs.stylix.nixosModules.stylix
    ];
    stylix = {
      enable = true;
    };
  };
}
