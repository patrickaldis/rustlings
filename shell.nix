{
  pkgs ? import <nixpkgs> { },
}:
pkgs.mkShell {
  buildInputs = with pkgs; [
    rustlings
    rust-analyzer-unwrapped
    rustup
    rustPlatform.bindgenHook
  ];
  RUSTC_VERSION = "stable";
  # https://github.com/rust-lang/rust-bindgen#environment-variables
  shellHook = ''
    export PATH="''${CARGO_HOME:-~/.cargo}/bin":"$PATH"
  '';
}
