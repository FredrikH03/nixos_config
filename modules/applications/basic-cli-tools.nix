{ config, pkgs, inputs, ... }:

{
  environment.systemPackages = with pkgs; [
    cool-retro-term
    alacritty
    kitty

    vim
    wget
    btop
    neovim
    fastfetch
    torsocks
    yt-dlp
    ripgrep
    vifm
  ];
}
