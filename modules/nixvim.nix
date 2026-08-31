{
  inputs,
  pkgs,
  ...
}: {
  imports = [
    inputs.nixvim.nixosModules.nixvim
  ];
  environment.systemPackages = [
    pkgs.alejandra
    pkgs.stylua
  ];
  programs.nixvim = {
    viAlias = true;
    vimAlias = true;
    defaultEditor = true;
    enable = true;
    globals.mapleader = " ";
    colorschemes.everforest = {
      enable = true;
      settings = {
        transparent_background = 1;
      };
    };
    opts = {
      number = true;
      relativenumber = true;

      ignorecase = true;
      smartcase = true;

      scrolloff = 8; # Minimum number of screen lines to keep above and below the cursor
      swapfile = false;
      undofile = true;
      updatetime = 1000;
    };
    clipboard = {
      register = "unnamedplus";
      providers.wl-copy.enable = true;
    };
    plugins = {
      sleuth.enable = true;
      lualine.enable = true;
      nvim-autopairs.enable = true;
      telescope = {
        enable = true;
        keymaps = {
          "<leader>ff" = "find_files";
          "<leader>fg" = "live_grep";
        };
      };
      lsp = {
        enable = true;
        servers = {
          nixd.enable = true;
          lua_ls.enable = true;
        };
      };
      conform-nvim = {
        enable = true;
        settings = {
          formatters_by_ft = {
            nix = ["alejandra"];
            lua = ["stylua"];
          };
          format_on_save = {
            timeout_ms = 500;
            lsp_fallback = true;
          };
        };
      };
    };
    keymaps = [
      {
        key = "<leader>w";
        mode = "n";
        action = "<cmd>w<CR>";
      }
      {
        key = "<leader>q";
        mode = "n";
        action = "<cmd>q<CR>";
      }
      {
        key = "qq";
        mode = "i";
        action = "<Esc>";
      }
      {
        key = "<leader>e";
        mode = "n";
        action = "<cmd>Ex<CR>";
      }
    ];
  };
}
