require('lualine').setup({
  options = {
    theme = 'auto',
    section_separators = { left = '', right = '' },
    component_separators = { left = '', right = '' },
    globalstatus = true,
  },
  sections = {
    lualine_a = { 
      { 'mode', icon = '' } -- Technical/CPU icon instead of Vim
    },
    lualine_b = {
      { 'branch', icon = '󱓎' }, 
      { 'diff', symbols = { added = '󰐕 ', modified = '󰏫 ', removed = '󰍴 ' } },
    },
    lualine_c = {
      {
        'filename',
        file_status = true,
        path = 3, 
        symbols = { modified = '󰚠', readonly = '󰌾', unnamed = '' }
      },
    },
    lualine_x = {
      {
        'diagnostics',
        sources = { 'nvim_diagnostic' },
        symbols = { error = '', warn = '!', info = ' ', hint = '󰌵 ' },
      },
      {
        function()
          local msg = 'No LSP'
          local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
          local clients = vim.lsp.get_active_clients()
          if next(clients) == nil then return msg end
          for _, client in ipairs(clients) do
            local filetypes = client.config.filetypes
            if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
              return client.name:upper()
            end
          end
          return msg
        end,
        icon = '󰒋', 
        color = { gui = 'bold' },
        separator = { left = '' }, 
      },
    },
    lualine_y = {
      { 'encoding', fmt = string.upper },
      { 'fileformat', icons_enabled = true },
    },
    lualine_z = {
      { 'location', icon = '' },
    },
  },
})
