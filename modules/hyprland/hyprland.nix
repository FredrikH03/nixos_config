{ config, pkgs, inputs, ... }:

{
  programs.hyprland = {
    # Install the packages from nixpkgs
    enable = true;
    # Whether to enable XWayland
    xwayland.enable = true;
  };


  environment.systemPackages = with pkgs; [
    waybar
    hyprpanel
    wofi
    walker
    hyprpicker
    pywal
    blueman
    bluez
    networkmanager
    swaynotificationcenter
  ];
}
