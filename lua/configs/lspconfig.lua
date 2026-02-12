require("nvchad.configs.lspconfig").defaults()

local capabilities = require("nvchad.configs.lspconfig").capabilities

-- Enable inlay hints when client supports them (LspAttach replaces on_attach)
vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("lsp-inlay-hints", { clear = true }),
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if client and client.server_capabilities.inlayHintProvider then
      vim.lsp.inlay_hint.enable(true, { bufnr = args.buf })
    end
  end,
})

-- Rust (rust_analyzer)
vim.lsp.config("rust_analyzer", {
  capabilities = capabilities,
  settings = {
    ["rust-analyzer"] = {
      checkOnSave = true,
      procMacro = { enable = true },
      cargo = { allFeatures = true },
      inlayHints = { enable = true },
    },
  },
})

-- Go (gopls)
vim.lsp.config("gopls", {
  capabilities = capabilities,
  cmd = { "gopls" },
  filetypes = { "go", "gomod" },
  root_markers = { "go.work", "go.mod", ".git" },
  settings = {
    gopls = {
      completeUnimported = true,
      usePlaceholders = true,
      analyses = { unusedparams = true },
      staticcheck = true,
      hints = {
        assignVariableTypes = true,
        compositeLiteralFields = true,
        compositeLiteralTypes = true,
        constantValues = true,
        functionTypeParameters = true,
        parameterNames = true,
        rangeVariableTypes = true,
      },
    },
  },
})

-- ESLint
vim.lsp.config("eslint", {
  capabilities = capabilities,
  settings = { format = { enable = true } },
})

-- Lua (lua_ls)
vim.lsp.config("lua_ls", {
  capabilities = capabilities,
  cmd = { "/opt/homebrew/bin/lua-language-server" },
  settings = {
    Lua = {
      diagnostics = { globals = { "vim" } },
      workspace = { library = vim.api.nvim_get_runtime_file("", true) },
      telemetry = { enable = false },
    },
  },
})

-- Enable all LSP servers
vim.lsp.enable({ "html", "cssls", "rust_analyzer", "gopls", "eslint", "lua_ls" })
