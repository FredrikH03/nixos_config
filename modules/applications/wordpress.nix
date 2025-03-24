{ config, pkgs, inputs, ... }:


let 
  elementor-manual = pkgs.stdenv.mkDerivation rec {
    name = "elementor";
    version = "3.28.1";
    src = pkgs.fetchzip {
      url = "https://downloads.wordpress.org/plugin/elementor.${version}.zip";
      hash = "sha256-7K/338e8bb81ba6ecf3f1de212b5b700058e064e8f45c5e962f43911a84a7ec6b93";
    }; 
    installPhase = ''
      mkdir -p $out/share/wordpress/wp-content/plugins/elementor
      cp -R * $out/share/wordpress/wp-content/plugins/elementor
    '';
  };
in {

  environment.systemPackages = with pkgs; [
    wordpress
  ];

  services.wordpress.sites."localhost" = {
    plugins = {
      inherit elementor-manual;
    };
  };
}

 
