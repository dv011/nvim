return {
  "MeanderingProgrammer/render-markdown.nvim",
  -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.nvim' }, -- if you use the mini.nvim suite
  dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.icons' }, -- if you use standalone mini plugins
  -- dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" }, -- if you prefer nvim-web-devicons
  ---@module 'render-markdown'
  ---@type render.md.UserConfig
  opts = {
    file_types = {"markdown","vimwiki"},
    vim.treesitter.language.register('markdown', 'vimwiki'),
    only_render_image_at_cursor = false,
    code = {
      -- Turn on / off any sign column related rendering
      sign = false,
      -- Width of the code block background:
      --  block: width of the code block
      --  full:  full width of the window
      width = "block",
      min_width = 45,
      left_pad = 1,
      right_pad = 1,
      language_pad = 1,
      -- Determines how code blocks & inline code are rendered:
      --  none:     disables all rendering
      --  normal:   adds highlight group to code blocks & inline code, adds padding to code blocks
      --  language: adds language icon to sign column if enabled and icon + name above code blocks
      --  full:     normal + language
      style = "full",
    },
    heading = {
      sign = false,
      width = "block",
    },
    html = {
      enabled = false,
      comment = {
	conceal = false,
      },
    },

    -- change the dashed line ---
    dash = {
      width = 80
    },

    -- testing fix for second bullet line not showing
    bullet = {
        enabled = true,
        render_modes = false,
        icons = { '●', '◆', '◇', '∘' },
        ordered_icons = function(ctx)
            local value = vim.trim(ctx.value)
            local index = tonumber(value:sub(1, #value - 1))
            return ('%d.'):format(index > 1 and index or ctx.index)
        end,
        left_pad = 0,
        right_pad = 0,
        highlight = 'RenderMarkdownBullet',
        scope_highlight = {},
    },
  },
}
