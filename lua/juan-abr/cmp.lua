-- on loan from theprimeagen
--[[ local sumneko_root_path = "/home/juana/lua-language-server"
local sumneko_binary = sumneko_root_path .. "/bin/lua-language-server"

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

-- nvim-cmp setup (also borrowed from theprimeagen)
local cmp = require("cmp")
local source_mapping = {
    buffer = "[Buffer]",
    nvim_lsp = "[LSP]",
    nvim_lua = "[Lua]",
    -- cmp_tabnine = "[TN]",
    path = "[Path]",
}
local lspkind = require("lspkind")
require('lspkind').init({
    with_text = true,
}) --]]

--[[ cmp.setup({
    snippet = {
        expand = function(args)
            require("luasnip").lsp_expand(args.body)
        end
    },

    mapping = {
        ["<C-u>"] = cmp.mapping.scroll_docs(-4),
        ["<C-d>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(),
    },

    formatting = {
        format = function(entry, vim_item)
            vim_item.kind = lspkind.presets.default[vim_item.kind]
            local menu = source_mapping[entry.source.name]
            -- To be used with tapnine
            --[[ if entry.completion_item.data == 'cmp_tapnine' then
                if entry.completion_item.data ~= nil and entry.completion_item.data.detail ~= nil then
                    menu = entry.completion_item.data.detail .. ' ' .. menu
                end
                vim_item.kind = 'U+F0E7'
            end
            vim_item.menu = menu
            return vim_item
        end
    },
    
    sources = {
        { name = "nvim_lsp" },
        { name = "luasnip" },
        { name = "buffer" },
    },
}) --]]

-- for lua lsp setup
--[[ local function config(_config)
    return vim.tbl_deep_extend("force", {
        capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities()),
    }, _config or {})
end --]]

--[[ require("lspconfig").sumneko_lua.setup(config({
    cmd = { sumneko_binary, "-E", sumneko_root_path .. "/main.lua" },
    settings = {
        Lua = {
            runtime = {
                -- Tells sumneko-lua what Lua version is being used
                version = "LuaJIT",
                -- Lua path setup
                path = vim.split(package.path, ";"),
            },
            diagnostics = {
                -- To have sumneko-lua recognize `vim` global
                globals = { "vim"},
            },
            workspace = {
                -- Make the server aware of Neovim runtime files
                library = {
                    [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                    [vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
                },
            },
        },
    },
})) --]]

-- for .NET Framework
local pid = vim.fn.getpid()
local omnisharp_bin = "/home/juana/.cache/omnisharp-vim/omnisharp-roslyn/run"

require'lspconfig'.omnisharp.setup{ --(config({
    cmd = { omnisharp_bin, "--languageserver" , "--hostPID", tostring(pid) };
} --))
