{ config, pkgs, inputs, ... }:


{
  imports =
    [
      ./hardware-configuration.nix
      inputs.home-manager.nixosModules.default
      ../../modules/bootloader/systemd-boot.nix
      ../../modules/network/bluetooth.nix
      ../../modules/audio/audio.nix

      ../../modules/graphics/compositor/wayland.nix
      ../../modules/graphics/desktop/plasma.nix

      ../../modules/applications/basic-cli-tools.nix
      ../../modules/applications/web-browsers.nix
      ../../modules/applications/dev-stack.nix

      ../../modules/region/default.nix
    ];

  boot.initrd.systemd.enable = true;
  swapDevices = [ {
    device = "/var/lib/swapfile";
    size = 38*1024;
    } ];
    

  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  nix.settings.experimental-features = [ "nix-command" "flakes"];

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "se";
    variant = "us";
  };

  # Configure console keymap
  console.keyMap = "sv-latin1";

  # Enable CUPS to print documents.
  services.printing.enable = true;


  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.user = {
    isNormalUser = true;
    description = "user";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [

    ];
  };

  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    users = {
      "user" = import ./home.nix;
    };
  };


  virtualisation.docker.enable = true;


  services.mullvad-vpn.enable = true;


  programs.steam = {
  enable = true;
  };

  services.flatpak.enable = true;


  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

 services.ollama = {
   enable = true;
   acceleration = "rocm";
 };
 
  environment.systemPackages = with pkgs; [
    nerdfonts
    kdePackages.kate
    thunderbird
    steam
    flatpak
    libreoffice-qt
    obs-studio
    ollama
    ollama-rocm
    btrfs-progs
    ckan
    r2modman
    gamemode
    openrgb

    #vidyaplayers
    mpv
    vlc

    #cringeshit
    discord
    vesktop

    #teamspeak
    teamspeak5_client
    teamspeak3

    #im gonna coooooooooode
    vscodium
    vscode
    dbeaver-bin
    jetbrains.datagrip
    pgadmin4-desktopmode
    jetbrains.phpstorm

    #securty
    mullvad-vpn
    bitwarden-desktop
  ];

  fonts.packages = with pkgs; [
  noto-fonts
  noto-fonts-cjk-sans
  noto-fonts-color-emoji
  nerdfonts
  ];
  

  system.stateVersion = "24.11"; # Did you read the comment?

}
