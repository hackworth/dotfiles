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
vim.keymap.set('n', 'gr', ':lua vim.lsp.buf.references()<cr>', {})
vim.keymap.set('n', 'gt', ':lua vim.lsp.buf.type_definition()<cr>', {})
vim.keymap.set('n', 'K', ':lua vim.lsp.buf.hover()<cr>', {})
vim.keymap.set('n', '<c-k>', ':lua vim.lsp.buf.signature_help()<cr>', {})
vim.keymap.set('n', '<leader>ca', ':lua vim.lsp.buf.code_action()<cr>', {})
vim.keymap.set('n', '<leader>rn', ':lua vim.lsp.buf.rename()<cr>', {})
