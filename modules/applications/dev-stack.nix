{ config, pkgs, inputs, ... }:

let 
  unstable = import inputs.nixpkgs-unstable {
    system = pkgs.system;
    config = config.nixpkgs.config;
  };
in
{
  environment.systemPackages = with pkgs; [
    /*
    # PHP with Extensions
    (pkgs.php83.buildEnv {
      extensions = ({enabled, all}: enabled ++ (with all; [
        imagick
        redis
      ]));
    })
    php83Packages.composer
    laravel
    redis

    nodejs
    nodePackages.serve

    mysql84

    vsftpd

    rustc

    libgcc
    gcc_debug
    postgresql_17
    gnumake
    unstable.libpq

    cargo

    dotnet-sdk
    sqlite
    postgresql
    */

    pgadmin4-desktopmode
    git
    postman
    docker

  ];

}
