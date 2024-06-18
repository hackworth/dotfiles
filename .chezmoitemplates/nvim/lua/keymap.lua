vim.keymap.set( "n", "<leader>r", function() require('telescope').extensions.repo.list{search_dirs = {'~/dev'}} end, {noremap = true, silent = true})

vim.keymap.set('n', '<leader><leader>f', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = false })<cr>", {})
vim.keymap.set('n', '<leader><leader>F', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = false })<cr>", {})
vim.keymap.set('n', '<leader>e', "<cmd> lua require'hop'.hint_words({ hint_position = require'hop.hint'.HintPosition.END })<cr>", {})
vim.keymap.set('n', '<leader>w', "<cmd> lua require'hop'.hint_words({ hint_position = require'hop.hint'.HintPosition.BEGIN })<cr>", {})
vim.keymap.set('v', '<leader>e', "<cmd> lua require'hop'.hint_words({ hint_position = require'hop.hint'.HintPosition.END })<cr>", {})
vim.keymap.set('o', '<leader>e', "<cmd> lua require'hop'.hint_words({ hint_position = require'hop.hint'.HintPosition.END, inclusive_jump = true })<cr>", {})

vim.keymap.set('n', '<c-s>', ':w<CR>', {})
vim.keymap.set('n', '<leader>n', ':NvimTreeToggle<CR>', {})


vim.keymap.set('n', 'gd', ':lua vim.lsp.buf.definition()<cr>', {})
vim.keymap.set('n', 'gD', ':lua vim.lsp.buf.declaration()<cr>', {})
vim.keymap.set('n', 'gi', ':lua vim.lsp.buf.implementation()<cr>', {})
vim.keymap.set('n', 'gw', ':lua vim.lsp.buf.document_symbol()<cr>', {})
vim.keymap.set('n', 'gw', ':lua vim.lsp.buf.workspace_symbol()<cr>', {})
--vim.keymap.set('n', 'gr', ':lua vim.lsp.buf.references()<cr>', {})
vim.keymap.set('n', 'gt', ':lua vim.lsp.buf.type_definition()<cr>', {})
vim.keymap.set('n', 'K', ':lua vim.lsp.buf.hover()<cr>', {})
vim.keymap.set('n', '<c-k>', ':lua vim.lsp.buf.signature_help()<cr>', {})
vim.keymap.set('n', '<leader>ca', ':lua vim.lsp.buf.code_action()<cr>', {})
vim.keymap.set('n', '<leader>rn', ':lua vim.lsp.buf.rename()<cr>', {})


vim.keymap.set({'n', 'x'}, 'ga', ':EasyAlign<cr>', {})
vim.keymap.set('n', '<c-n>', ':NERDTreeToggle<cr>', {})
vim.keymap.set({'n', 'x'}, '<leader>/', '<plug>NERDCommenterToggle<cr>', {})

--vnoremap J :m '>+1<CR>gv=gv
--vnoremap K :m '<-2<CR>gv=gv

vim.keymap.set('n', '<leader><space>', ':nohlsearch<CR>', {})
vim.keymap.set('n', '<Leader>2', ':set number! relativenumber!<CR>:call ToggleSignColumn()<CR>', {})
vim.keymap.set('n', '<C-p>', "<cmd>lua require'telescope.builtin'.find_files()<cr>", {})
vim.keymap.set('n', '<leader>fg', "<cmd>lua require'telescope.builtin'.live_grep()<cr>", {})
vim.keymap.set('n', '<leader>fb', "<cmd>lua require'telescope.builtin'.buffers()<cr>", {})
vim.keymap.set('n', '<leader>fh', "<cmd>lua require'telescope.builtin'.help_tags()<cr>", {})
vim.keymap.set('n', '<leader>gr', "<cmd>lua require'telescope.builtin'.lsp_references()<cr>", {})
vim.keymap.set('n', '<leader>fc', ':Telescope colorscheme<cr>', {})
vim.keymap.set('n', '<leader>ws', ':ToggleWhitespace<cr>', {})
--nnoremap <leader>u :UndotreeToggle<CR>

vim.keymap.set("n", "<leader>xw", function() require("trouble").toggle("workspace_diagnostics") end)
vim.keymap.set({"i", "s"}, "<C-L>", function() require("luasnip").jump( 1) end, {silent = true})
vim.keymap.set({"i", "s"}, "<C-J>", function() require("luasnip").jump(-1) end, {silent = true})
