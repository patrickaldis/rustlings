{
  pkgs ? import <nixpkgs> { },
}:
pkgs.mkShell {
  buildInputs = with pkgs; [
    rustlings
    rust-analyzer-unwrapped
  ];
}
