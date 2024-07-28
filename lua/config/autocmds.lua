-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local Util = require("lazyvim.util")
local map = Util.safe_keymap_set

--

map("i", "jk", "<esc>", { desc = "Fast exit" })
map("t", "jk", "<c-\\><c-n>", { desc = "Enter Normal Mode 2" })
map("n", "A-v", "<C-v>", { desc = "Fast exit" })

map("x", "<tab>", ">qv")
map("x", "<S-tab>", "<qv")

map("n", "<C-a>", "ggVG")

map("n", "x", '"_x')

-- Turn off paste mode when leaving insert
vim.api.nvim_create_autocmd("InsertLeave", {
  pattern = "*",
  command = "set nopaste",
})

-- Fix concellevel for json files
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "json", "jsonc" },
  callback = function()
    vim.wo.spell = false
    vim.wo.conceallevel = 0
  end,
})
