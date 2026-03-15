{ config, lib, pkgs, inputs, ... }:

{
  imports = [ ./hardware-configuration.nix ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos";
  networking.networkmanager.enable = true;

  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true;

  services.upower.enable = true;
  time.timeZone = "Asia/Tashkent";

services.xserver.enable = true;
services.displayManager.sddm.enable = true;
 # programs.regreet.enable = true;
  services.printing.enable = true;
  services.printing.drivers = [ pkgs.epson-escpr ];
  services.avahi.enable = true;
  services.avahi.nssmdns4 = true;

programs.hyprland = {
  enable = true;
  package = inputs.hyprland.packages.${pkgs.system}.hyprland;
  portalPackage = inputs.hyprland.packages.${pkgs.system}.xdg-desktop-portal-hyprland;
};

  services.pipewire = {
    enable = true;
    pulse.enable = true;
  };

  services.libinput.enable = true;

  
  users.users.sanjar = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" ]; 
    packages = with pkgs; [ tree ];
  };

  programs.firefox.enable = true;

  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    vim
    wget
    git
    mako
    kdePackages.dolphin
    kdePackages.qtsvg        
    kdePackages.kio-extras   
    kdePackages.kio-fuse
    hyprpolkitagent
    qt5.qtwayland
    qt6.qtwayland
    file
    jq
    ffmpeg
    poppler
    fd
    fzf
    zoxide
    resvg
    imagemagick
    epsonscan2
    xclip
    yazi
    hyprpicker
    waypaper
    inputs.awww.packages.${pkgs.stdenv.hostPlatform.system}.awww
  ];

  xdg.portal = {
    enable = true;
    config = {
      common = {
        default = [ "kde" ];
      };
    };
    extraPortals = [ pkgs.kdePackages.xdg-desktop-portal-kde ];
  };



  environment.sessionVariables.NIXOS_OZONE_WL = "1";

fonts.packages = with pkgs; [
  nerd-fonts.jetbrains-mono
  nerd-fonts.fira-code  # Just an example of adding another
  noto-fonts-color-emoji
];
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  system.stateVersion = "25.11"; # Synced with home-manager for consistency
}
