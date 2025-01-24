{ pkgs, ... }:
{
  # FIXME: Maybe move?
  environment.systemPackages = with pkgs; [
    rustfmt
    python3Packages.black # Python formatter
    clang-tools # For clang-format
    nil # Nix language server
    nixfmt-rfc-style # Nix formatter
    typescript 
    prettierd
    lua
    luaformatter
    lua-language-server
    ghc
    haskellPackages.cabal-install
    haskellPackages.haskell-language-server
  ];
}
