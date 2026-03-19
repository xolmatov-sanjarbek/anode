{
  config,
  pkgs,
  inputs,
  ...
}:

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

        viAlias = true;
        vimAlias = true;
        preventJunkFiles = true;

        debugger.nvim-dap.enable = true;
        treesitter.enable = true;
        autocomplete.nvim-cmp.enable = true;
        filetree.nvimTree.enable = true;
        binds.whichKey.enable = true;
        git.enable = true;
        dashboard.alpha.enable = true;
        statusline.lualine.enable = true;
        telescope.enable = true;
        ui = {
          noice.enable = true;
        };
        notify.nvim-notify.enable = true;
        globals.updatetime = 300;

        lsp = {
          enable = true;
        };

        languages = {
          rust = {
            enable = true;
            lsp.enable = true;
            treesitter.enable = true;
          };
          ts = {
            enable = true;
            lsp.enable = true;
            lsp.servers = [ "ts_ls" ];
            treesitter.enable = true;
          };
          nix = {
            enable = true;
            lsp.enable = true;
            lsp.servers = [ "nil" ];
          };
          python = {
            enable = true;
            lsp.enable = true;
            lsp.servers = [ "pyright" ];
          };
          css = {
            enable = true;
            lsp.enable = true;
            lsp.servers = [ "cssls" ];
          };
          go = {
            enable = true;
            lsp.enable = true;
            lsp.servers = [ "gopls" ];
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
          clipboard = "unnamedplus";
        };

        keymaps = [
          {
            key = "<leader>e";
            mode = "n";
            action = ":NvimTreeToggle<CR>";
            silent = true;
            desc = "Toggle NvimTree";
          }
          {
            key = "<leader>gg";
            mode = "n";
            action = "<cmd>lazygit<CR>";
            silent = true;
            desc = "Open LazyGit";
          }
          {
            key = "<leader>xx";
            mode = "n";
            action = ":Trouble diagnostics toggle<CR>";
            desc = "Toggle Error List";
          }
          {
            key = "[d";
            mode = "n";
            action = "lua vim.diagnostic.goto_prev()";
            desc = "Prev Diagnostic";
          }
          {
            key = "]d";
            mode = "n";
            action = "lua vim.diagnostic.goto_next()";
            desc = "Next Diagnostic";
          }
          {
            key = "<leader>k";
            mode = "n";
            action = "lua vim.diagnostic.open_float()";
            desc = "Show line diagnostics";
          }
          {
            key = ">";
            mode = "v";
            action = ">gv";
            desc = "Indent right";
          }
          {
            key = "<";
            mode = "v";
            action = "<gv";
            desc = "Indent left";
          }
          {
            key = "J";
            mode = "v";
            action = ":m '>+1<CR>gv=gv";
            desc = "Move selection down";
          }
          {
            key = "K";
            mode = "v";
            action = ":m '<-2<CR>gv=gv";
            desc = "Move selection up";
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
services.flatpak = {
  enable = true;
  packages = [
    "com.spotify.Client"
    "org.videolan.VLC"
    "com.discordapp.Discord"
  ];
};
  programs.waybar.enable = true;
  programs.walker.enable = true;

  home.sessionVariables = {
    EDITOR = "nvim";
    VISUAL = "nvim";
    LIBVA_DRIVER_NAME = "iHD";
  };

  programs.bash = {
    enable = true;
    shellAliases = {
      btw = "echo I use NixOS, btw";
      lg = "lazygit";
      update = "sudo nixos-rebuild switch --flake .";
    };
    profileExtra = ''. "${pkgs.nix}/etc/profile.d/nix.sh" '';
  };

  home.file = {
    ".config/hypr".source =
      config.lib.file.mkOutOfStoreSymlink "/home/sanjar/nixos-dotfiles/config/hypr";
    ".config/waybar".source =
      config.lib.file.mkOutOfStoreSymlink "/home/sanjar/nixos-dotfiles/config/waybar";
    ".config/satty".source =
      config.lib.file.mkOutOfStoreSymlink "/home/sanjar/nixos-dotfiles/config/satty";
    ".config/kitty".source =
      config.lib.file.mkOutOfStoreSymlink "/home/sanjar/nixos-dotfiles/config/kitty";
    ".config/wlogout".source =
      config.lib.file.mkOutOfStoreSymlink "/home/sanjar/nixos-dotfiles/config/wlogout";
    ".config/brave-flags.conf".text = ''
      --disable-features=VaapiVideoDecodeLinuxGL
      --use-gl=swiftshader
    '';
  };

  home.packages = with pkgs; [
    wl-clipboard
    bibata-cursors
    gcc
    kitty
    hyprland
    grim
    slurp
    satty
    brave
    swayosd
    libnotify
    libqalculate # The 'qalc' command-line tool
    qalculate-gtk # The GUI version (handy for complex math)
    btop # System monitor
    yazi # Fast file manager
    dust # Disk usage (invoked with 'dust')
    tldr
  ];

  home.pointerCursor = {
    gtk.enable = true;
    x11.enable = true; # Optional, but good for compatibility
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Ice";
    size = 24;
  };

  gtk = {
    enable = true;
    theme = {
      name = "catppuccin-mocha-mauve-standard";
      package = pkgs.catppuccin-gtk.override {
        accents = [ "mauve" ];
        size = "standard";
        variant = "mocha";
      };
    };
  };

  services.mako = {
    enable = true;
    settings = {
      anchor = "top-right";
      font = "JetBrainsMono Nerd Font 10";
      backgroundColor = "#1e1e2e";
      textColor = "#cdd6f4";
      borderColor = "#89b4fa";
      borderSize = 2;
      borderRadius = 8;
      progressColor = "over #313244";
      padding = "15";
      defaultTimeout = 5000;
    };
  };

  programs.wlogout.enable = true;
}
