local lsp_zero = require('lsp-zero')
local cmp = require('cmp')
require("luasnip.loaders.from_vscode").lazy_load()
require("vim-react-snippets").lazy_load()
require('mini.comment').setup()

lsp_zero.on_attach(function(client, bufnr)
    -- see :help lsp-zero-keybindings
    -- to learn the available actions
    lsp_zero.default_keymaps({ buffer = bufnr })
end)

-- here you can setup the language servers
require('mason').setup({})
require('mason-lspconfig').setup({
    -- Replace the language servers listed here
    -- with the ones you want to install
    ensure_installed = { 'tsserver', 'bashls', 'cssls', 'eslint', 'html', 'jsonls', 'lua_ls', 'prismals', 'tailwindcss', 'csharp_ls' },
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
      vim.keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })
    end,
  },
})
