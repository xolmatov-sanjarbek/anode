{ config, pkgs, inputs, ... }:

{
  imports = [
	    inputs.walker.homeManagerModules.default
	    inputs.nvf.homeManagerModules.default
            ];

  home.username = "sanjar";
  home.homeDirectory = "/home/sanjar";
  home.stateVersion = "25.11";

  programs.nvf = {
    enable = true;
    settings = {
      vim = {
	theme = {
	  enable = true;
	  name = "catppuccin";
	  style = "mocha";
	};

	statusline.lua-line.enable = true;
	telescope.enable = true;
	autocomplete.nvim-cmp.enable = true;

	languages = {
	  enableLSP = true;
	  enableTreesitter = true;

	  rust.enable = true;
	  ts.enable = true;
	  nix.enable = true;
	  python.enable = true;
	  css.enable = true;
	  go.enable = true;
	};

	options = {
	  shiftwidth = 4;
	  tabstop = 4;
	  smartintent = true;
	};
      };
    };
  };

  programs.git = {
	enable = true;
  	userName  = "Sanjar Xolmatov";
  	userEmail = "xolmatovsanjarbek@proton.me";
  	extraConfig = {
    		init.defaultBranch = "main";
  	};
  };
  programs.home-manager.enable = true;
  services.network-manager-applet.enable = true;

  programs.waybar = {
	enable = true;
  };

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
    gcc
    kitty
    hyprland
    grim
    slurp
    satty
    brave
  ];
  
  services.mako = {
    enable = true;
    settings = {
      anchor = "top-right";
    };
  };

programs.wlogout = {
  enable = true;
};
}
