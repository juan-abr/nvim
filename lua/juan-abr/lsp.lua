local sumneko_root_path = "/home/juana/lua-language-server"
local sumneko_binary = sumneko_root_path .. "/bin/lua-language-server"

local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, "lua/juan-abr/init.lua")

-- for the C programming language
require'lspconfig'.clangd.setup{}

-- for lua 


-- for .NET Framework
local pid = vim.fn.getpid()
local omnisharp_bin = "/home/juana/.cache/omnisharp-vim/omnisharp-roslyn/run"

require'lspconfig'.omnisharp.setup{ --(config({
    cmd = { omnisharp_bin, "--languageserver" , "--hostPID", tostring(pid) };
} --))
