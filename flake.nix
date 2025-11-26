{
  # ...

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
    crate2nix = {
      url = "github:nix-community/crate2nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    inputs@{
      self,
      nixpkgs,
      crate2nix,
      ...
    }:
    let
      cargoNix = crate2nix.tools.x86_64-linux.appliedCargoNix {
        name = "rustlings";
        src = ./.;
      };
    in
    {
      packages.x86_64-linux.default = cargoNix.rootCrate.build;
    };
}
