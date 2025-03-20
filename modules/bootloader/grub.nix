{ config, pkgs, inputs, ... }:

{
  # grub stuff, sadly never got it working with LUKS2 because some argon2id problem or something
  boot.loader.systemd-boot.enable = false;
  boot.loader.grub.enable = true;
  boot.loader.grub.device = "nodev";
  boot.loader.grub.useOSProber = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.grub.efiSupport = true;  # Enable UEFI GRUB support
  boot.loader.efi.efiSysMountPoint = "/boot/efi";
}
