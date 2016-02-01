{ nixpkgs ? import <nixpkgs> {}, compiler ? "ghc7103" }:
let
  inherit (nixpkgs) pkgs;
  texlive = pkgs.texLiveFull;
   
 
  emacsWithMyPackages = pkgs.emacsWithPackages.override {
      emacs = pkgs.emacs.override { withGTK2 = true; withGTK3 = false; }; }
        (with pkgs.emacsPackagesNg;
          [ rainbow-delimiters
            auctex
            org-plus-contrib
            org-trello            
            magit ]);
  pandoc = pkgs.pandoc;
  git = pkgs.git;
  busybox = pkgs.busybox;
  sphinx = pkgs.pythonPackages.sphinx;
in
pkgs.stdenv.mkDerivation {
  name = "book-writing-1";
  buildInputs = [texlive
  emacsWithMyPackages
  sphinx
  git
  pandoc
  busybox
  ];
  
  
}
