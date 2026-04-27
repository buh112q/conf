{
  inputs = {
    flake-parts.url = "github:hercules-ci/flake-parts";
    import-tree.url = "github:vic/import-tree";
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nix-flatpak.url = "github:gmodena/nix-flatpak/?ref=latest";
    nvf = {
      url = "github:NotAShelf/nvf";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs = inputs:
    inputs.flake-parts.lib.mkFlake {inherit inputs;}
    (inputs.import-tree ./modules);
}
