{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/e5bdc4a41d4c072fe1e3787eaa0320a384741d44";

    zen-browser.url = "github:0xc000022070/zen-browser-flake";
    zen-browser.inputs.nixpkgs.follows = "nixpkgs";

    helium.url = "github:schembriaiden/helium-browser-nix-flake";
    helium.inputs.nixpkgs.follows = "nixpkgs";

    umbriel.url = "git+https://github.com/noctalia-dev/umbriel";

    nixvim.url = "github:nix-community/nixvim";

    nvf.url = "github:NotAShelf/nvf";
    nvf.inputs.nixpkgs.follows = "nixpkgs";
  };
  outputs = inputs: {
    nixosConfigurations.nixos = inputs.nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = {inherit inputs;};
      modules = [
        ./configuration.nix
        (
          {pkgs, ...}: {
            nixpkgs.config.allowUnfree = true;
            nix.settings = {
              cores = 1;
              max-jobs = 8;
              experimental-features = ["nix-command" "flakes"];
            };
          }
        )
      ];
    };
  };
}
