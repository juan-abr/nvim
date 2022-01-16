require'lspconfig'.clangd.setup{}

-- for .NET Framework
local pid = vim.fn.getpid()
local omnisharp_bin = "/home/juana/.cache/omnisharp-vim/omnisharp-roslyn/run"

require'lspconfig'.omnisharp.setup{ --(config({
    cmd = { omnisharp_bin, "--languageserver" , "--hostPID", tostring(pid) };
} --))
