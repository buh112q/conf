{
  inputs,
  pkgs,
  ...
}: {
  imports = [
    inputs.nvf.nixosModules.default
  ];
  programs.nvf = {
    enable = true;
    settings = {
      vim = {
        theme = {
          enable = true;
          transparent = true;
          name = "tokyonight";
          style = "night";
        };
        ui.borders.enable = true;
        clipboard = {
          enable = true;
          registers = "unnamedplus";
          providers.wl-copy.enable = true;
        };
        searchCase = "smart";
        statusline.lualine.enable = true;
        autopairs.nvim-autopairs.enable = true;
        telescope.enable = true;
        utility = {
          sleuth.enable = true;
        };
        autocomplete = {
          nvim-cmp = {
            enable = true;
          };
        };
        lsp = {
          enable = true;
          formatOnSave = true;
        };
        languages = {
          enableFormat = true;
          enableTreesitter = true;
          nix = {
            enable = true;
            lsp.servers = ["nixd"];
            format.type = ["alejandra"];
          };
        };
        keymaps = [
          {
            key = "<leader>e";
            mode = "n";
            action = "<cmd>Ex<CR>";
          }
          {
            key = "<leader>w";
            mode = "n";
            action = "<cmd>w<CR>";
          }
          {
            key = "qq";
            mode = "i";
            action = "<Esc>";
          }
          {
            key = "<leader>q";
            mode = "n";
            action = "<cmd>q<CR>";
          }
        ];
      };
    };
  };
}
