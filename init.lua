---@START-MESSAGE      
---  ___ _  __(_)_ _ 
--- / _ \ |/ / /  ' \
---/_//_/___/_/_/_/_/
---This is hello message, this my nvim.lua config!
---@module init.lua
---@author zxck1l
---@license MIT


--NOTE: first line and import lazy
require("config.lazy")
require("lazy").setup("plugins")
require("config.telescope")
--NOTE: import telescope and plugins
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
require("mason").setup()
--require("neoconf").setup({})
require("config.lualine")
vim.cmd("colorscheme iceberg")
require('Comment').setup()
vim.opt.termguicolors = true
vim.notify = require("notify")
require("notify").history()
require("config.todo-comments")
--FIX: хули не работает cmp
--require("config.cmp")
vim.keymap.set("n", "]t", function()
  require("todo-comments").jump_next()
end, { desc = "Next todo comment" })
vim.loader.enable()
vim.cmd('LspStart')
require("config.luasnip")
require('impatient')
vim.keymap.set("n", "[t", function()
  require("todo-comments").jump_prev()
end, { desc = "Previous todo comment" })

-- You can also specify a list of valid jump keywords


vim.keymap.set("n", "]t", function()
  require("todo-comments").jump_next({keywords = { "ERROR", "WARNING" }})
end, { desc = "Next error/warning todo comment" })
require("config.barbar")
--FIX: мне он нахер не нужен
--vim.keymap.set('n', '<leader>nf', "<CR>:NERDTreeFocus<CR>", { desc = 'Nerdtree open'})
vim.keymap.set( 'n', '<leader>nc', "<CR>:Neotree<CR>", { desc = 'Nerdtree close'} )
vim.keymap.set('n', '<leader>mp', "<CR>:MusicPlay<CR>", { desc = 'Music Play' })
vim.keymap.set('n', '<leader>ms', "<CR>:MusicPause<CR>", { desc = 'Music Stop' })
vim.keymap.set('n', '<leader>mc', "<CR>:MusicCurrent<CR>", { desc = "Чо ща играет" })
vim.keymap.set('n', '<leader>mn', "<CR>:MusicNext<CR>", { desc = "Next track" })
-- require("config.cmp")
require("telescope").load_extension("lazy_plugins")
---vim.cmd("COQnow")
require'lspconfig'.pyright.setup{}
-- views can only be fully collapsed with the global statusline
vim.opt.laststatus = 3
-- Default splitting will cause your main splits to jump when opening an edgebar.
-- To prevent this, set `splitkeep` to either `screen` or `topline`.
vim.opt.splitkeep = "screen"
vim.opt.termguicolors = true
require("ccc").setup()
--require("nvim-lspconfig")
vim.api.nvim_set_keymap("n", "<leader>n", ":ASToggle<CR>", {})
require("autoclose").setup()
-- Open compiler
--vim.set.keymap('n', '<F6>', "cmd CompilerOpen<cr>", { noremap = true, silent = true })

-- Redo last selected option
--vim.set.keymap('n', '<S-F6>',
--
--"<cmd>CompilerStop<cr>" -- (Optional, to dispose all tasks before redo)
 --
 --.. "<cmd>CompilerRedo<cr>",
 --{noremap = true, silent = true })

-- Toggle compiler results
vim.api.nvim_set_keymap('n', '<S-F7>', "<cmd>CompilerToggleResults<cr>", { noremap = true, silent = true })

-- Keyboard users
vim.keymap.set("n", "<C-t>", function()
  require("menu").open("default")
end, {})

-- mouse users + nvimtree users!
vim.keymap.set("n", "<RightMouse>", function()
  vim.cmd.exec '"normal! \\<RightMouse>"'

  local options = vim.bo.ft == "NvimTree" and "nvimtree" or "default"
  require("menu").open(options, { mouse = true })
end, {})
require("zone").setup()
require("nvim-navic").setup {
    lsp = {
        auto_attach = true,
    },
}

require("breadcrumbs").setup()
require("neodev")
require("config.neodev")

require("neodev").setup({
  library = { plugins = { "nvim-dap-ui" }, types = true },
})
--require("neoconf").setup()
local lspconfig = require('lspconfig')
lspconfig.lua_ls.setup({
  settings = {
    Lua = {
      completion = {
        callSnippet = {"LuaSnip", "frendly-snippets"}
      }
    }
  }
})

require("aerial").setup({
  -- optionally use on_attach to set keymaps when aerial has attached to a buffer
  on_attach = function(bufnr)
    -- Jump forwards/backwards with '{' and '}'
    vim.keymap.set("n", ",er", "<cmd>AerialPrev<CR>", { buffer = bufnr })
    vim.keymap.set("n", ",et", "<cmd>AerialNext<CR>", { buffer = bufnr })
  end,
})
-- You probably also want to set a keymap to toggle aerial
vim.keymap.set("n", "<leader>a", "<cmd>AerialToggle!<CR>")


--FIX: require("neoconf").setup({})
require('overseer').setup()
--require('config.bg')
require('plugins.bg')
--FIX: эта шлюха мне нвим сломала
--#require('config.codecompanion')
event = 'LspAttach'
require'web-tools'.setup({
  keymaps = {
    rename = nil,  -- by default use same setup of lspconfig
    repeat_rename = '.', -- . to repeat
  },
  hurl = {  -- hurl default
    show_headers = false, -- do not show http headers
    floating = false,   -- use floating windows (need guihua.lua)
    json5 = false,      -- use json5 parser require json5 treesitter
    formatters = {  -- format the result by filetype
      json = { 'jq' },
      html = { 'prettier', '--parser', 'html' },
    },
  },
})

-- load the session for the current directory
vim.keymap.set("n", "<leader>qs", function() require("persistence").load() end)

-- select a session to load
vim.keymap.set("n", "<leader>qS", function() require("persistence").select() end)

-- load the last session
vim.keymap.set("n", "<leader>ql", function() require("persistence").load({ last = true }) end)

-- stop Persistence => session won't be saved on exit
vim.keymap.set("n", "<leader>qd", function() require("persistence").stop() end)

-- load the session for the current directory
vim.keymap.set("n", "<leader>qs", function() require("persistence").load() end)

-- select a session to load
vim.keymap.set("n", "<leader>qS", function() require("persistence").select() end)

-- load the last session
vim.keymap.set("n", "<leader>ql", function() require("persistence").load({ last = true }) end)

-- stop Persistence => session won't be saved on exit
vim.keymap.set("n", "<leader>qd", function() require("persistence").stop() end)

local opts = { noremap = true, silent = true }
vim.api.nvim_set_keymap("n", "<Leader>g", ":lua require('neogen').generate()<CR>", opts)
vim.keymap.set('n', '<leader>jo', '<CMD>lua require("FTerm").toggle()<CR>')
vim.keymap.set('t', '<leader>jc', '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>')

-- Lua
require("lsp-colors").setup({
  Error = "#db4b4b",
  Warning = "#e0af68",
  Information = "#0db9d7",
  Hint = "#10B981"
})

local LspUI = require("LspUI")
LspUI.setup()

require('plugins.project')
--require('project').setup()
require('fidget').setup()
vim.keymap.set('n', "<leader>t", "<cmd>Themery<CR>", { desc = 'Theme select by themery' })
