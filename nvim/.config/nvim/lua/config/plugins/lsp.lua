return {
  "mason-org/mason-lspconfig.nvim",
  opts = {
    ensure_installed = {
      "lua_ls",
      "dockerls",
      "basedpyright",
      "ruff",
      "bashls",
    }
  },
  dependencies = {
    {
      "mason-org/mason.nvim",
      opts = {
        ui = {
          icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗",
          }
        }
      }
    },
    {
      "neovim/nvim-lspconfig",
      config = function()
        vim.api.nvim_create_autocmd('LspAttach', {
          group = vim.api.nvim_create_augroup('kickstart-lsp-attach', { clear = true }),
          callback = function(event)
            local map = function(keys, func, desc, mode)
              mode = mode or 'n'
              vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
            end
            -- Rename the variable under your cursor.
            --  Most Language Servers support renaming across files, etc.
            map('grn', vim.lsp.buf.rename, '[R]e[n]ame')

            -- Execute a code action, usually your cursor needs to be on top of an error
            -- or a suggestion from your LSP for this to activate.
            map('gra', vim.lsp.buf.code_action, '[G]oto Code [A]ction', { 'n', 'x' })

            -- WARN: This is not Goto Definition, this is Goto Declaration.
            --  For example, in C this would take you to the header.
            map('grD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')


            -- Prefer basedpyright hover instead of ruff's
            local client = vim.lsp.get_client_by_id(event.data.client_id)
            if client and client.name == 'ruff' then
              client.server_capabilities.hoverProvider =  false
            end
          end
        })

        local servers = {
          lua_ls = {},
          dockerls = {},
          bashls = {},
          ruff = {},
          basedpyright = {
            settings = {
              basedpyright = {
                disableOrganizeImports = true,
              },
            },
          },
        }

        for name, cfg in pairs(servers) do
          vim.lsp.config(name, cfg)
          vim.lsp.enable(name)
        end
      end
    },
    {
      "WhoIsSethDaniel/mason-tool-installer.nvim",
      opts = {
        ensure_installed = {
          'markdownlint',
          'stylua',
          'shellcheck',
          'shfmt',
          'hadolint',
        },
      },
    },
    {
      "folke/lazydev.nvim",
      ft = "lua",
      opts = {},
    },
    { 'j-hui/fidget.nvim', opts = {} },
  },
}
