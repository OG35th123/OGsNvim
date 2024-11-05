local lsp_zero = require('lsp-zero')
local cmp = require('cmp')
require("luasnip.loaders.from_vscode").lazy_load()
require("vim-react-snippets").lazy_load()
require('mini.comment').setup()

-- lsp_zero.on_attach(function(client, bufnr)
--     lsp_zero.default_keymaps({ buffer = bufnr })
-- end)


local lsp_attach = function(client, bufnr)
    local opts = { buffer = bufnr }
end

lsp_zero.extend_lspconfig({
    sign_text = true,
    lsp_attach = lsp_attach,
    capabilities = require('cmp_nvim_lsp').default_capabilities()
})

require('mason').setup({})
require('mason-lspconfig').setup({
    ensure_installed = { 'ts_ls', 'bashls', 'cssls', 'eslint', 'html', 'jsonls', 'lua_ls', 'prismals', 'tailwindcss', 'clangd', 'omnisharp' },
    handlers = {
        function(server_name)
            require('lspconfig')[server_name].setup({})
        end,

    },
})
local pid = vim.fn.getpid()
require('lspconfig').omnisharp.setup {
    cmd = { "omnisharp", "-z", "--hostPID", tostring(pid), "DotNet:enablePackageRestore=false", "--encoding", "utf-8", "--languageserver", "FormattingOptions:EnableEditorConfigSupport=true", "Sdk:IncludePreReleases=true" },
}

local pid = vim.fn.getpid()
require('lspconfig').omnisharp.setup {
    on_attach = lsp_attach,
    cmd = { "omnisharp", "-z", "--hostPID", tostring(pid), "DotNet:enablePackageRestore=false", "--encoding", "utf-8", "--languageserver", "Formattingoptions:EnableEditorConfigSupport=true", "Sdk:IncludePreReleases=true" }
}

cmp.setup({
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
    }, {
        { name = 'buffer' },
    }),
    mapping = {
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<Up>'] = cmp.mapping.select_prev_item({ behavior = 'select' }),
        ['<Down>'] = cmp.mapping.select_next_item({ behavior = 'select' }),
    },
    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body)
        end,
    },
})


local rt = require("rust-tools")

rt.setup({
    server = {
        on_attach = function(_, bufnr)
            -- Hover actions
            vim.keymap.set("n", "<C-space>", rt.hover_actions.hover_actions, { buffer = bufnr })
            -- Code action groups
            vim.keymap.set("n", "<Leader>m", rt.code_action_group.code_action_group, { buffer = bufnr })
        end,
    },
})
