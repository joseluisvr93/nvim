local status, nvim_lsp = pcall(require, 'lspconfig')
if (not status) then return end

local protocol = require('vim.lsp.protocol')

local augroup_format = vim.api.nvim_create_augroup("Format", { clear = true })

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
--local on_attach = function(client, bufnr)
--  if client.server_capabilities.documentFormattingProvider then
--    vim.api.nvim_command [[augroup Format]]
--    vim.api.nvim_command [[autocmd! * <buffer>]]
--    vim.api.nvim_command [[autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_seq_sync()]]
--    vim.api.nvim_command [[augroup End]]
--  end
--end

local on_attach = function(_, bufnr)
  -- format on save
  vim.api.nvim_create_autocmd('BufWritePre', {
    buffer = bufnr,
    callback = function()
      vim.lsp.buf.format()
    end
  })
end

local capabilities = require('cmp_nvim_lsp').default_capabilities()
local lsp_config = {
  capabilities = capabilities,
  group = vim.api.nvim_create_augroup('LspFormatting', { clear = true }),
  on_attach = function(_, bufnr)
    on_attach(_, bufnr)
  end
}


require('mason-lspconfig').setup_handlers({
  function(server_name)
    require('lspconfig')[server_name].setup(lsp_config)
  end,
  lua_ls = function()
    require('lspconfig').lua_ls.setup(vim.tbl_extend('force', lsp_config, {
      settings = {
        Lua = {
          diagnostics = {
            globals = { 'vim' }
          }
        }
      }
    }))
  end,
  tsserver = function()
    require('typescript').setup({
      server = vim.tbl_extend('force', lsp_config, {
        on_attach = function(_, bufnr)
          on_attach(_, bufnr)
        end,
        init_options = {
          preferences = {
            importModuleSpecifierPreference = 'project=relative',
            jsxAttributeCompletionStyle = 'none'
          }
        }
      })
    })
  end
})

vim.keymap.set('n', '<leader>o', '<cmd>TypescriptOrganizeImports<cr>')
vim.keymap.set('n', '<leader>a', '<cmd>TypescriptAddMissingImports<cr>')
vim.keymap.set('n', '<leader>r', '<cmd>TypescriptRemoveUnused<cr>')

--nvim_lsp.tsserver.setup {
--  on_attach = on_attach,
--  filetypes = { "typescript", "typescriptreact", "typescript.tsx" }
--}
--
--nvim_lsp.lua_ls.setup {
--  on_attach = on_attach,
--  settings = {
--    Lua = {
--      diagnostics = {
--        -- Get the language server to recognize the 'vim' global
--        globals = { 'vim' }
--      },
--      workspace = {
--        -- Make the server aware of Neovim runtime files
--        library = vim.api.nvim_get_runtime_file("", true)
--      }
--    }
--  }
--}

-- vimls
--local servers = { 'pyright', 'bashls', 'flow', 'vimls' }
--for _, lsp in pairs(servers) do
--  nvim_lsp[lsp].setup {
--    on_attach = on_attach,
--  }
--end
--
--nvim_lsp.diagnosticls.setup {
--  on_attach = on_attach,
--  filetypes = { 'javascript', 'javascriptreact', 'json', 'typescript', 'typescriptreact', 'css', 'less', 'scss',
--    'markdown', 'pandoc' },
--  init_options = {
--    linters = {
--      eslint = {
--        command = 'eslint_d',
--        rootPatterns = { '.git' },
--        debounce = 100,
--        args = { '--stdin', '--stdin-filename', '%filepath', '--format', 'json' },
--        sourceName = 'eslint_d',
--        parseJson = {
--          errorsRoot = '[0].messages',
--          line = 'line',
--          column = 'column',
--          endLine = 'endLine',
--          endColumn = 'endColumn',
--          message = '[eslint] ${message} [${ruleId}]',
--          security = 'severity'
--        },
--        securities = {
--          [2] = 'error',
--          [1] = 'warning'
--        }
--      },
--    },
--    filetypes = {
--      javascript = 'eslint',
--      javascriptreact = 'eslint',
--      typescript = 'eslint',
--      typescriptreact = 'eslint',
--    },
--    formatters = {
--      eslint_d = {
--        command = 'eslint_d',
--        args = { '--stdin', '--stdin-filename', '%filename', '--fix-to-stdout' },
--        rootPatterns = { '.git' },
--      },
--      prettier = {
--        command = 'prettier',
--        args = { '--stdin-filepath', '%filename' }
--      }
--    },
--    formatFiletypes = {
--      css = 'prettier',
--      javascript = 'eslint_d',
--      javascriptreact = 'eslint_d',
--      json = 'prettier',
--      scss = 'prettier',
--      less = 'prettier',
--      typescript = 'eslint_d',
--      typescriptreact = 'eslint_d',
--      markdown = 'prettier',
--    }
--  }
--}
--
---- icon
--vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
--  vim.lsp.diagnostic.on_publish_diagnostics, {
--  underline = true,
--  -- This sets the spacing and the prefix, obviously.
--  virtual_text = {
--    spacing = 4,
--    prefix = ''
--  }
--}
--)
