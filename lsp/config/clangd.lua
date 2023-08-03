-- require("clangd_extensions.config").setup {}
-- require("clangd_extensions.ast").init()
-- vim.cmd [[
--   command ClangdToggleInlayHints lua require('clangd_extensions.inlay_hints').toggle_inlay_hints()
--   command -range ClangdAST lua require('clangd_extensions.ast').display_ast(<line1>, <line2>)
--   command ClangdTypeHierarchy lua require('clangd_extensions.type_hierarchy').show_hierarchy()
--   command ClangdSymbolInfo lua require('clangd_extensions.symbol_info').show_symbol_info()
--   command -nargs=? -complete=customlist,s:memuse_compl ClangdMemoryUsage lua require('clangd_extensions.memory_usage').show_memory_usage('<args>' == 'expand_preamble')
--   ]]
--
return {
  cmd = {
    -- see clangd --help-hidden
    "clangd",
    "--background-index",
    -- by default, clang-tidy use -checks=clang-diagnostic-*,clang-analyzer-*
    -- to add more checks, create .clang-tidy file in the root directory
    -- and add Checks key, see https://clang.llvm.org/extra/clang-tidy/
    "--clang-tidy",
    "--completion-style=bundled",
    "--cross-file-rename",
    "--header-insertion=iwyu",
    "--inlay-hints=true",
  },
  capabilities = { offsetEncoding = "utf-8" },
  -- handlers = handler.with({ handler.hover, clangd_ext_handler }),
  -- TODO: figure out what is this
  init_options = {
    clangdFileStatus = true, -- Provides information about activity on clangd’s per-file worker thread
    usePlaceholders = true,
    completeUnimported = true,
    semanticHighlighting = true,
  },
  -- clangdInlayHintsProvider = true,
}
