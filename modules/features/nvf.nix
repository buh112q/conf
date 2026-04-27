{
  self,
  inputs,
  ...
}: {
	flake.nixosModules.nvf = {pkgs,...}: {
		imports = [
			inputs.nvf.nixosModules.default
		];
		programs.nvf = {
    			enable = true;
    			settings = {
      				vim = {
                                        extraPackages = with pkgs; [
                                                nixd
                                                alejandra
                                        ];
					theme = {
						enable = true;
						name = "gruvbox";
						style = "dark";
					};
					statusline.lualine.enable = true;
					telescope.enable = true;
					autocomplete.nvim-cmp.enable = true;
				        lsp.enable = true;
					
                                        languages = {
                                                enableFormat = true;
						enableTreesitter = true;

						nix = {
                                                        enable = true;
                                                        format = {
                                                                enable = true;
                                                                type =
                                                                        ["alejandra"];
                                                                        formatOnSave = true; 
                                                        }; lsp = { enable =
                                                                true;
                                                                servers = ["nixd"];
                                                        };
                                                };
					};
				};
			};
  		};
	};
}

