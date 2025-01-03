{ config, pkgs, inputs, ... }:

{
  environment.systemPackages = with pkgs; [
    postman
    docker

    # PHP stuff
    php83
    php83Packages.composer
    php83Extensions.imagick
    laravel

    nodejs
    git
    mysql84
    mariadb_114
    pgadmin4-desktopmode
  ];
}
