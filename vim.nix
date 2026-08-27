{ config, pkgs, ... }:
{
  programs.neovim = {
  enable = true;
  viAlias = true;
  vimAlias = true;
  configure = {
    customRC = ''
      lua << EOF
      require("oil").setup()
      require("snacks").setup({
        bigfile = { enabled = true },
        notifier = { enabled = true },
        quickfile = { enabled = true },
        statuscolumn = { enabled = true },
        words = { enabled = true },
        explorer = { enabled = true },
        picker = { enabled = true },
        dashboard = {
          enabled = true,
          preset = {
            header = [[
                                  __
                               _.-~  )
                    _..--~~~~,'   ,-/     _
                 .-'. . . .'   ,-','    ,' )
               ,'. . . _   ,--~,-'__..-'  ,'
             ,'. . .  (@)' ---~~~~      ,'
            /. . . . '~~             ,-'
           /. . . . .             ,-'
          ; . . . .  - .        ,'
         : . . . .       _     /
        . . . . .          `-.:
       . . . ./  - .          )
      .  . . |  _____..---.._/ ____ Seal _
~---~~~~----~~~~             ~~
            ]],
          },
          sections = {
            { section = "header" },
            { section = "keys", gap = 1, padding = 1 },
          },
        },
      })
EOF
      nnoremap - <cmd>Oil<CR>
      nnoremap <leader>e <cmd>lua Snacks.explorer()<CR>
    '';
    packages.myPlugins = {
      start = with pkgs.vimPlugins; [ oil-nvim snacks-nvim ];
    };
  };
};
}
