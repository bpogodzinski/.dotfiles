return {
  {
    'nvim-mini/mini.nvim',
    config = function()
      local statusline = require 'mini.statusline'
      statusline.setup { use_icons = true }

      require('mini.ai').setup({
        mappings = {
          around_next = 'aa',
          inside_next = 'ii',
        },
        n_lines = 500,
      })

      require('mini.surround').setup()

      require('mini.jump').setup({
        mappings = { repeat_jump = ';' },
      })
      vim.keymap.set({ 'n', 'x', 'o' }, ',', function() MiniJump.jump(nil, not MiniJump.state.backward) end)

    end
  }
}
