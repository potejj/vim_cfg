local lsp = require('lsp-zero')
local cmp = require('cmp')
local cmp = require('cmp')
local cmp_format = require('lsp-zero').cmp_format({details = true})

lsp.preset("recommended")

require('mason').setup({})
require('mason-lspconfig').setup({
  -- Replace the language servers listed here 
  -- with the ones you want to install
  ensure_installed = {'tsserver', 'rust_analyzer'},
  
})

cmp.setup({
  sources = {
    {name = 'nvim_lsp'},
    {name = 'buffer'},
  },
  --- (Optional) Show source name in completion menu
  formatting = cmp_format,
})

cmp.setup({
  sources = {
    {name = 'nvim_lsp'},
  },
  mapping = {
    ['<C-Enter>'] = cmp.mapping.confirm({select = true}),
    ['<C-f>'] = cmp.mapping.abort(),
    ['<Up>'] = cmp.mapping.select_prev_item({behavior = 'select'}),
    ['<Down>'] = cmp.mapping.select_next_item({behavior = 'select'}),
    ['<C-d>'] = cmp.mapping.complete(),
    ['<C-p>'] = cmp.mapping(function()
      if cmp.visible() then
        cmp.select_prev_item({behavior = 'insert'})
      else
        cmp.complete()
      end
    end),
    ['<C-n>'] = cmp.mapping(function()
      if cmp.visible() then
        cmp.select_next_item({behavior = 'insert'})
      else
        cmp.complete()
      end
    end),
  },
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
})


local lsp = require("lsp-zero")

lsp.preset("recommended")


-- Fix Undefined global 'vim'



lsp.set_preferences({
    suggest_lsp_servers = false,
    sign_icons = {
        error = 'E',
        warn = 'W',
        hint = 'H',
        info = 'I'
    }
})

local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
  -- see :help lsp-zero-keybindings
  -- to learn the available actions
  lsp_zero.default_keymaps({buffer = bufnr})
end)

lsp_zero.setup_servers({'tsserver', 'rust_analyzer'})


lsp_zero.on_attach(function(client, bufnr)
  lsp_zero.default_keymaps({buffer = bufnr})
end)

require('mason').setup({})
require('mason-lspconfig').setup({
  handlers = {
    lsp_zero.default_setup,
  },
})

lsp.preset("recommended")


-- Fix Undefined global "vim"
lsp.configure("lua_ls", {
    settings = {
        Lua = {
            diagnostics = {
                globals = { "vim" }
            }
        }
    }
})

require('lspconfig').templ.setup({
    cmd = { "templ", "lsp", "-http=localhost:7474", "-log=/home/mpaulson/templ.log" },
    filetypes = { 'templ' },
})

require('lspconfig').tailwindcss.setup({
    filetypes = { '*' },
})

--[[
-- Add templ configuration.
local configs = require'lspconfig/configs'
if not nvim_lsp.templ then
  configs.templ = {
    default_config = {
      cmd = {"templ", "lsp"},
      filetypes = {'templ'},
      root_dir = nvim_lsp.util.root_pattern("go.mod", ".git"),
      settings = {},
    };
  }
end

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
local servers = { 'gopls', 'ccls', 'cmake', 'tsserver', 'templ' }
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup {
    on_attach = on_attach,
    flags = {
      debounce_text_changes = 150,
    },
  }
end
--]]


--[[
-- Fix Undefined global "vim"
lsp.configure("rust_analyzer", {
    cmd = { "" },
})
--]]




lsp.set_preferences({
    suggest_lsp_servers = false,
    sign_icons = {
        error = "E",
        warn = "W",
        hint = "H",
        info = "I"
    }
})


lsp.setup()

