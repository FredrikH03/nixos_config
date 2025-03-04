{ config, pkgs, inputs, ... }:

{
  environment.systemPackages = with pkgs; [
    vim
    wget
    btop
    neovim
    fastfetch
    torsocks
    yt-dlp
    ripgrep
    vifm
    cool-retro-term
  ];
}
