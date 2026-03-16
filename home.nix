{ config, pkgs, inputs, ... }:

{
  imports = [
    inputs.walker.homeManagerModules.default
  ];

  home.username = "sanjar";
  home.homeDirectory = "/home/sanjar";
  home.stateVersion = "25.11"; # Ensure this matches your original install version

  programs.git = {
    enable = true;
    settings = {
      user = {
	name = "Sanjar Xolmatov";
	email = "xolmatovsanjarbek@proton.me";
      };
      init.defaultBranch = "main";
    };
  };

  programs.home-manager.enable = true;
  
  services.network-manager-applet.enable = true;

  programs.waybar.enable = true;
  programs.walker.enable = true;

  programs.bash = {
    enable = true;
    shellAliases = {
      btw = "echo I use NixOS, btw";
    };
    profileExtra = ''
      . "${pkgs.nix}/etc/profile.d/nix.sh"
    '';
  };

  home.file.".config/hypr".source = config.lib.file.mkOutOfStoreSymlink "/home/sanjar/nixos-dotfiles/config/hypr";
  home.file.".config/waybar".source = config.lib.file.mkOutOfStoreSymlink "/home/sanjar/nixos-dotfiles/config/waybar"; 
  home.file.".config/satty".source = config.lib.file.mkOutOfStoreSymlink "/home/sanjar/nixos-dotfiles/config/satty"; 
  home.file.".config/kitty".source = config.lib.file.mkOutOfStoreSymlink "/home/sanjar/nixos-dotfiles/config/kitty"; 
  home.file.".config/wlogout".source = config.lib.file.mkOutOfStoreSymlink "/home/sanjar/nixos-dotfiles/config/wlogout"; 

  home.packages = with pkgs; [
    neovim
    gcc
    kitty
    hyprland
    grim
    slurp
    satty
    brave
    swayosd
    libnotify
  ];
  
  services.mako = {
    enable = true;
    settings = {
      anchor = "top-right";
    };
    font = "JetBrainsMono Nerd Font 10";
    backgroundColor = "#1e1e2e"; # Catppuccin Mocha Base
    textColor = "#cdd6f4";
    borderColor = "#89b4fa";
    borderSize = 2;
    borderRadius = 8;
    progressColor = "over #313244";
    padding = "15";
    defaultTimeout = 5000;
  };

  programs.wlogout.enable = true;
}
