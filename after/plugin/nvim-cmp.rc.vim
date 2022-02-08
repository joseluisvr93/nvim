set completeopt=menu,menuone,noselect

lua << EOF

vim.opt_local.spell = true

local feedkey = function(key, mode)
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
end

local has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

  -- Setup nvim-cmp.
  local cmp = require'cmp'
  local lspkind = require'lspkind'
  cmp.register_source('look', require'cmp_look'.new())
  cmp.setup({
    formatting = {
      format = lspkind.cmp_format({
        with_text = true, 
        maxwidth = 50,
        menu = ({
          vsnip = "[VSnip]",
          buffer = "[Buffer]",
          path = "[Path]",
          nvim_lsp = "[LSP]",
          ultisnips = "[Ultisnips]",
          luasnip = "[LuaSnip]",
          look = "[Look]",
          spell = "[Spell]",
          calc = "[Calc]",
          emoji = "[Emoji]",
          tags = "[Tags]",
          nvim_lua = "[Lua]",
          cmp_tabnine = "[TN]",
          treesitter = "[Tree]",
        }),
      }),
    },
    snippet = {
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` user.
      end,
    },
    mapping = {
      ['<C-p>'] = cmp.mapping.select_prev_item(),
      ['<C-n>'] = cmp.mapping.select_next_item(),
      ['<C-d>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.close(),
      ['<C-b>'] = cmp.mapping(function(fallback)
          feedkey("<Plug>(vsnip-expand-or-jump)", "")
      end,{"i","s"}),
      ['<C-j>'] = cmp.mapping(function(fallback)
          feedkey("<Plug>(vsnip-jump-prev)", "")
      end,{"i","s"}),
      ['<CR>'] = cmp.mapping.confirm({
        behavior = cmp.ConfirmBehavior.Replace,
        select = true,
      }),
      --['<Tab>'] = cmp.mapping(function(fallback)
        --if cmp.visible() then
          --cmp.select_next_item()
        --elseif vim.fn.call("vsnip#available",{1}) == 1 then
          --feedkey("<Plug>(vsnip-expand-or-jump)", "")
        --elseif has_words_before() then
            --cmp.complete()
        --else
          --fallback()
        --end
      --end,{"i","s"}),
      --['<S-Tab>'] = cmp.mapping(function(fallback)
        --if cmp.visible() then
          --cmp.select_prev_item()
        --elseif vim.fn.call("vsnip#available",{-1}) == 1 then
          --feedkey("<Plug>(vsnip-jump-prev)", "")
        --else
          --fallback()
        --end
      --end,{"i","s"}),
    },
    sources = {
      { name = 'cmp_tabnine' },
      { name = 'spell' },
      { name = 'vsnip' },
      { name = 'nvim_lsp' },
      { name = "buffer",
        options = {
          get_bufnrs = function()
            return vim.api.nvim_list_bufs()
          end,
        },
      },
      { name = 'path' },
      { name = 'look' , keyword_length = 2},
      { name = 'calc' },
      { name = 'emoji' },
      { name = 'tags' },
      { name = 'nvim_lua' },
      { name = 'treesitter' },
    },
    completion = {
      completeopt = 'menu,menuone,noinsert',
    },
    experimentar = {
      ghost_text = true,
    },
    documentation = {
      border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
    },

  })
  -- Setup lspconfig.
  local lsp = require 'lspconfig'
  local cmp_lsp = require 'cmp_nvim_lsp'

  lsp.vimls.setup {
    capabilities = 
      cmp_lsp.update_capabilities(vim.lsp.protocol.make_client_capabilities())
  }
EOF
