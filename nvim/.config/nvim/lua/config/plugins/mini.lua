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

      require('mini.comment').setup()

      require('mini.tabline').setup()

    end
  }
}
