{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    postman
    docker

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
    git
    pgadmin4-desktopmode

    mysql84

    vsftpd

    rustc
    cargo

    libgcc
    gcc_debug
    gnumake
    # libpq


    dotnet-sdk
  ];

}
