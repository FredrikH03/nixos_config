{ config, pkgs, inputs, ... }:

{
  programs.firefox = {
    enable = true;
    package = pkgs.librewolf;
    policies = {
      DisableTelemetry = true;
      DisableFirefoxStudies = true;
      Preferences = {
        # "cookiebanners.service.mode.privateBrowsing" = 2; # Block cookie banners in private browsing
        # "cookiebanners.service.mode" = 2; # Block cookie banners
        # "privacy.donottrackheader.enabled" = true;
        # "privacy.fingerprintingProtection" = true;
        # "privacy.resistFingerprinting" = true;
        # "privacy.trackingprotection.emailtracking.enabled" = true;
        # "privacy.trackingprotection.enabled" = true;
        # "privacy.trackingprotection.fingerprinting.enabled" = true;
        # "privacy.trackingprotection.socialtracking.enabled" = true;
      };
      ExtensionSettings = {
        "uBlock0@raymondhill.net" = {
          kinstall_url = "https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/latest.xpi";
          installation_mode = "force_installed";
        };
        # I DONT KNOW HOW TO ADD EXTENSIONS!!!!!!!!
        # "multiaccountcontainers@mozilla.org" = {
          # install_url = "https://addons.mozilla.org/firefox/downloads/file/4355970/multi_account_containers-8.2.0.xpi";
          # installation_mode = "force_installed";
        # };
      };
    };
  };

  environment.systemPackages = with pkgs; [
    mullvad-browser
    librewolf 
    tor-browser
    brave # botnet
  ];
}
