with import <nixpkgs> {};

pkgs.mkShell {
  src = ./.;
  buildInputs = [
    (texlive.combine {
      inherit (texlive)
        scheme-basic xetex unicode-math booktabs etoolbox
        collection-fontsrecommended filehook mdwtools
        titlesec fontspec euenc xcolor metafont;
    })
    pandoc
    etBook
  ];

  FONTCONFIG_FILE = makeFontsConf { fontDirectories = [ lmodern etBook ./fonts ]; };
}
