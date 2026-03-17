{ config, pkgs, inputs, ... }:

{
    imports = [
	    inputs.walker.homeManagerModules.default
	    inputs.nvf.homeManagerModules.default
    ];

    home.username = "sanjar";
    home.homeDirectory = "/home/sanjar";
    home.stateVersion = "25.11"; # Ensure this matches your original install version

    programs.nvf = {
        enable = true;
        settings = {
            vim = {
	            theme = {
	                enable = true;
	                name = "catppuccin";
	                style = "mocha";
	            };

                viAlias = true;
                vimAlias = true;
                preventJunkFiles = true;
                useSystemClipboard = true;

                debugger.nvim-dap.enable = true;
                treesitter.enable = true;
                autocomplete.nvim-cmp.enable = true;
                filetree.nvimTree.enable = true;
                binds.whichKey.enable = true;
                git.enable = true;
                dashboard.alpha.enable = true;
                statusline.lualine.enable = true;
                telescope.enable = true;

                lsp = {
                    enable = true;
                };

                languages = {
                    enableExtraDiagnostics = true;

                    rust = {
                        enable = true;
                        lsp.enable = true;
                        treesitter.enable = true;
                    };
                    ts = {
                        enable = true;
                        lsp.enable = true;
                        lsp.servers = ["ts_ls"];
                        treesitter.enable = true;
                    };
                    nix = {
                        enable = true;
                        lsp.enable = true;
                        lsp.servers = ["nil"];
                        treesitter.enable = true;
                    };
                    python = {
                        enable = true;
                        lsp.enable = true;
                        lsp.servers = ["pyright"];
                        treesitter.enable = true;
                    };
                    css = {
                        enable = true;
                        lsp.enable = true;
                        lsp.servers = ["cssls"];
                        treesitter.enable = true;
                    };
                    go = {
                        enable = true;
                        lsp.enable = true;
                        lsp.servers = ["gopls"];
                        treesitter.enable = true;
                    };
                };

                options = {
                    shiftwidth = 4;
                    tabstop = 4;
                    smartindent = true;
                    termguicolors = true;
                    scrolloff = 10;
                    number = true;
                    relativenumber = true;
                    cursorline = true;
                };

            keymaps = [
                    {
                        key = "<leader>e";
                        mode = "n";
                        action = ":NvimTreeToggle<CR>";
                        silent = true;
                        desc = "Toggle NvimTree";
                    }
                ];
      };
    };
  };

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
            font = "JetBrainsMono Nerd Font 10";
            background-color = "#1e1e2e"; # Catppuccin Mocha Base
            text-color = "#cdd6f4";
            border-color = "#89b4fa";
            border-size = 2;
            border-radius = 8;
            progress-color = "over #313244";
            padding = "15";
            default-timeout = 5000;
        };
    };

    programs.wlogout.enable = true;
}
