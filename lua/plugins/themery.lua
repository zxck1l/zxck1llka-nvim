return {
    "zaldih/themery.nvim",
    lazy = false,
    config = function()
      require("themery").setup({
        themes = {"gruvbox", "ayu", '256noir', 'abstract', 'afterglow', 'alduin', 'anderson', 'angr', 'ayu-vim', 'Apprentice', 'Archery', 'Atom', 'carbonized', 'challenger-deep', 'deus', 'dogrun', 'flattened', 'focuspoint', 'fogbell', 'github', 'gotham', 'gruvbox', 'happy', 'hacking', 'Iceberg', 'papercolor', 'parsec', 'scheakur', 'hybrid', 'hybrid-material', 'jellybeans', 'lightning', 'lucid', 'lucius', 'materialbox', 'meta5', 'minimalist', 'molokai', 'molokayo', 'mountaineer', 'nord', 'oceanicnext', 'oceanic-material', 'one', 'onedark', 'onehalf', 'orbital', 'paramount', 'pink-moon', 'purify', 'pyte', 'rdark-terminal2', 'seoul256', 'sierra', 'solarized8', 'sonokai', 'space-vim-dark', 'spacecamp', 'sunbather', 'tender', 'twilight256', 'two-firewatch', 'wombat256light', 'hybrid'}, -- Your list of installed colorschemes.
        livePreview = true, -- Apply theme while picking. Default to true.
      })
    end
  }
