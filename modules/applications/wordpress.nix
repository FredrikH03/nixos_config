{ config, pkgs, inputs, ... }:

let 
  elementor-manual = pkgs.stdenv.mkDerivation rec {
    name = "elementor";
    version = "3.28.1";
    src = pkgs.fetchzip {
      url = "https://downloads.wordpress.org/plugin/elementor.${version}.zip";
      hash = "sha256-bdJ7MT9C2lQlOMywHOwXu3GCHX2vzaGKLvXZfwlHtsI=";
    }; 
    installPhase = ''
      mkdir -p $out
      cp -R * $out/
    '';
  };

in {
  environment.systemPackages = with pkgs; [
    wordpress
  ];
  services.wordpress.sites."localhost" = {
    plugins = {
      elementor = elementor-manual;
    };
  };
}

 
