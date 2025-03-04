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
    pgadmin4-desktopmode

    # mysql84
    # mariadb_114

    cargo

    libgcc
    gcc_debug


    dotnet-sdk
    # dotnet-sdk_7 # apparently EOL
  ];

}
