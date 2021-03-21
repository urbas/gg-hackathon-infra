{ pkgs ? (import <nixpkgs> {}).pkgs }:
let
  python = pkgs.python3.withPackages(pyPkgs: with pyPkgs; [
    ipython
  ]);
  terraform = pkgs.terraform_0_14.withPlugins (plugins: with plugins; [ aws plugins.null shell ]);

in pkgs.mkShell {
  buildInputs = with pkgs; [
    awscli
    jq
    python
    terraform
  ];
}