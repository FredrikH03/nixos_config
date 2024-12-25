{ config, pkgs, inputs, ... }:

{
  # Enables KDE my beloved (time to krash), and also sddm
  services.displayManager.sddm.enable = true;
  services.desktopManager.plasma6.enable = true;
}