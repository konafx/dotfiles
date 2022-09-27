local ok, telescope = pcall(require, 'telescope')
if not ok then return end

local actions = require('telescope.actions')
local builtin = require('telescope.builtin')

local function telescope_buffer_dir()
  return vim.fn.expand('%:p:h')
end

local fb_actions = telescope.extensions.file_browser.actions

telescope.setup {
  defaults = {
    mappings = {
      n = {
        ['q'] = actions.close
      },
    },
    file_ignore_patterns = {
      '.git/', '.cache', '%.o', '%.a', '%.out', '%.class', '%.pdf', '%.mkv', '%.mp4', '%.zip'
    }
  },
  extensions = {
    file_browser = {
      theme = "dropdown",
      -- disables netrw and use telescope-file-browser in its place
      hijack_netrw = true,
      mappings = {
        -- your custom insert mode mappings
        ["i"] = {
          ["<C-w>"] = function() vim.cmd('normal vbd') end,
        },
        ["n"] = {
          -- your custom normal mode mappings
          ["N"] = fb_actions.create,
          ["h"] = fb_actions.goto_parent_dir,
          ["<C-h>"] = fb_actions.toggle_hidden,
          ["/"] = function()
            vim.cmd('startinsert')
          end
        },
      },
    },
  },
}

telescope.load_extension('file_browser')

vim.keymap.set('', '[telescope]', '<Nop>')
vim.keymap.set('n', '<Leader>f', '[telescope]', { remap = true })

vim.keymap.set('n', '[telescope]f',
  function()
    builtin.find_files({
      no_ignore = false,
      hidden = true
    })
  end)
vim.keymap.set('n', '[telescope]g', function()
  builtin.live_grep()
end)
vim.keymap.set('n', '[telescope]b', function()
  builtin.buffers()
end)
vim.keymap.set('n', '[telescope]t', function()
  builtin.help_tags()
end)
vim.keymap.set('n', '[telescope]r', function()
  builtin.resume()
end)
vim.keymap.set('n', '[telescope]e', function()
  builtin.diagnostics()
end)
vim.keymap.set("n", "sf", function()
  telescope.extensions.file_browser.file_browser({
    path = "%:p:h",
    cwd = telescope_buffer_dir(),
    respect_gitignore = false,
    hidden = true,
    grouped = true,
    previewer = false,
    initial_mode = "normal",
    layout_config = { height = 40 }
  })
end)
