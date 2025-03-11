{ config, pkgs, inputs, ... }:

{
  environment.systemPackages = with pkgs; [
    cool-retro-term
    alacritty

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
