return {
   {
    "sbdchd/neoformat",
    event = "LspAttach",
    init = function()
     vim.g.neoformat_enabled_cpp = "clangformat"
     vim.g.neoformat_cpp_clangformat = {exe = 'clang-format', args = { ["--style"] = file} }
    end,
   }
}
