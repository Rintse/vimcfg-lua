local nvim_lsp = require('lspconfig')
local autocomp = require('autocomplete')

-- vim.lsp.set_log_level("debug")

local servers = { 
    'hls', 
    'rls', 
    'clangd', 
    'eslint', 
    'tsserver',
    'pyright'
}

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
    local function set_key(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
    local function set_opt(...) vim.api.nvim_buf_set_option(bufnr, ...) end

    -- Mappings.
    local opts = { noremap=true, silent=true }

    -- goto preview stuff
    set_key('n',  '<Leader>gpd', '<cmd>lua require("goto-preview").goto_preview_definition()<CR>', opts)
    set_key('n',  '<Leader>gpi', '<cmd>lua require("goto-preview").goto_preview_implementation()<CR>', opts)
    set_key('n',  '<Leader>gP', '<cmd>lua require("goto-preview").close_all_win()<CR>', opts)
    set_key('n',  '<Leader>gpr', '<cmd>lua require("goto-preview").goto_preview_references()<CR>', opts)

    -- See `:help vim.lsp.*` for documentation on any of the below functions
    set_key('n', '<Leader>gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    set_key('n', '<Leader>gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
    set_key('n', '<Leader>i', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
    set_key('n', '<Leader>gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
    set_key('n', '<Leader>gt', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
    set_key('n', '<Leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
    set_key('n', '<Leader>a', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
    set_key('n', '<Leader>d', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
    set_key('n', '<Leader>gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
    set_key('n', '<Leader>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)

    set_key('n', '<Leader>pe', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
    set_key('n', '<Leader>ne', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
end

-- Setup autocomplete
autocomp()

-- Setup lspconfig.
local capabilities = require('cmp_nvim_lsp')
    .update_capabilities(vim.lsp.protocol.make_client_capabilities())

for _, lsp in ipairs(servers) do
    nvim_lsp[lsp].setup {
        capabilities = capabilities,
        on_attach = on_attach,
        flags = {
            debounce_text_changes = 150,
        }
    }

end
