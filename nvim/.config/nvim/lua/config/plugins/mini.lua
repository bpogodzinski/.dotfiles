return {
  {
    'nvim-mini/mini.nvim',
    config = function()
      local statusline = require 'mini.statusline'
      statusline.setup { use_icons = true }

      require('mini.ai').setup({
        n_lines = 500,
      })

      require('mini.surround').setup()

      require('mini.jump').setup({
        mappings = { repeat_jump = ';' },
      })
      vim.keymap.set({ 'n', 'x', 'o' }, ',', function() MiniJump.jump(nil, not MiniJump.state.backward) end)

      require('mini.comment').setup()

      require('mini.icons').setup()

    end
  }
}
