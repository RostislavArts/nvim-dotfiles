vim.g.mapleader = " "
vim.keymap.set("n", "<leader>e", vim.cmd.Ex)
vim.keymap.set("n", "<C-v>", vim.cmd.vsplit)
vim.keymap.set("n", "<C-h>", vim.cmd.split)
vim.keymap.set("n", "<C-t>", vim.cmd.tabnew)
vim.keymap.set("n", "<C-Tab>", vim.cmd.tabnext)
vim.keymap.set("n", "<C-S-Tab>", vim.cmd.tabprevious)
vim.keymap.set("n", "<C-n>", vim.cmd.RunCode)
--vim.keymap.set("n", "<C-S-t>", function()
--    vim.cmd.split()
--    vim.cmd("wincmd J")
--    vim.cmd.resize(15)
--    vim.cmd.terminal()
--end)
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>y", "\"+yy")
vim.keymap.set("n", "<leader>p", "\"+p")
vim.keymap.set("n", "<leader>P", "\"+P")
vim.keymap.set("n", "<leader>w", "<C-w>")
vim.keymap.set({"n", "v", "i", "x", "s"}, "<C-c>", "<Esc>")
--Cyrillic keymap:
vim.cmd.set("langmap=ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz")
vim.keymap.set("n", "<leader>у", vim.cmd.Ex)
vim.keymap.set("n", "<C-м>", vim.cmd.vsplit)
vim.keymap.set("n", "<C-р>", vim.cmd.split)
vim.keymap.set("n", "<C-е>", vim.cmd.tabnew)
vim.keymap.set("n", "<C-т>", vim.cmd.RunCode)
--vim.keymap.set("n", "<C-Е>", function()
--    vim.cmd.split()
--    vim.cmd("wincmd J")
--    vim.cmd.resize(15)
--    vim.cmd.terminal()
--end)
vim.keymap.set("v", "<leader>н", "\"+y")
vim.keymap.set("n", "<leader>н", "\"+yy")
vim.keymap.set("n", "<leader>з", "\"+p")
vim.keymap.set("n", "<leader>З", "\"+P")
vim.keymap.set("n", "<leader>ц", "<C-w>")
vim.keymap.set({"n", "v", "i", "x", "s"}, "<C-с>", "<Esc>")
