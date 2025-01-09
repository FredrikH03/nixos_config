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
    git
    mysql84
    mariadb_114
    pgadmin4-desktopmode

    cargo
  ];

}
