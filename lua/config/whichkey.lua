local M = {}

local whichkey = require "which-key"
--local legendary = require "legendary"
local next = next

local conf = {
  window = {
    border = "single", -- none, single, double, shadow
    position = "bottom", -- bottom, top
  },
}
whichkey.setup(conf)

local opts = {
  mode = "n", -- Normal mode
  prefix = "<leader>",
  buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
  silent = true, -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = false, -- use `nowait` when creating keymaps
}

local v_opts = {
  mode = "v", -- Visual mode
  prefix = "<leader>",
  buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
  silent = true, -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = false, -- use `nowait` when creating keymaps
}

local function normal_keymap()
  local keymap_f = nil -- File search
  local keymap_p = nil -- Project search

  keymap_f = {
    name = "Find",
    f = { "<cmd>lua require('telescope.builtin').find_files()<cr>", "Files" },
    b = { "<cmd>lua require('telescope.builtin').buffers()<cr>", "Buffers" },
    h = { "<cmd>lua require('telescope.builtin').help_tags()<cr>", "Help" },
    m = { "<cmd>lua require('telescope.builtin').marks()<cr>", "Marks" },
    o = { "<cmd>lua require('telescope.builtin').oldfiles()<cr>", "Old Files" },
    g = { "<cmd>lua require('telescope.builtin').live_grep()<cr>", "Live Grep" },
    c = { "<cmd>lua require('telescope.builtin').commands()<cr>", "Commands" },
  }

  keymap_t = {
    name = "Tab",
    o = { "<cmd>tabnew<cr>", "NewTab" },
    x = { "<cmd>tabclose<cr>", "CloseTab" },
    n = { "<cmd>tabn<cr>", "NextTab" },
    p = { "<cmd>tabp<cr>", "PreviousTab" },
  }

  keymap_s = {
    name = "SplitWindow",
    v = { "<C-w>v", "Split window vertically" },
    h = { "<C-w>s", "Split window horizontally" },
    e = { "<C-w>=", "Split windows equal width & height" },
    x = { "<cmd>close<cr>", "Close window" },
  }

  local keymap = {
    ["w"] = { "<cmd>update!<CR>", "Save" },
    ["q"] = { "<cmd>lua require('utils').quit()<CR>", "Quit" },
    ["e"] = { "<cmd>NvimTreeToggle<cr>", "Explorer" },
    ["m"] = { "<cmd>MaximizerToggle<cr>", "Window Maximization" },
    ["r"] = { "<cmd>LspRestart<cr>", "Restart LSP" },

    b = {
      name = "Buffer",
      c = { "<Cmd>BDelete this<Cr>", "Close Buffer" },
      f = { "<Cmd>bdelete!<Cr>", "Force Close Buffer" },
      D = { "<Cmd>BWipeout other<Cr>", "Delete All Buffers" },
      b = { "<Cmd>BufferLinePick<Cr>", "Pick a Buffer" },
      p = { "<Cmd>BufferLinePickClose<Cr>", "Pick & Close a Buffer" },
    },

    f = keymap_f,
    t = keymap_t,
    s = keymap_s,

    g = {
      name = "Git",
      b = { "<cmd>GitBlameToggle<CR>", "Blame" },
      s = { "<cmd>lua require('neogit').open()<CR>", "Status - Neogit" },
      g = { "<cmd>lua require('telescope').extensions.gh.gist()<CR>", "Gist" },
      x = { "<cmd>lua require('telescope.builtin').git_branches()<cr>", "Switch Branch" },
    },
  }
  whichkey.register(keymap, opts)
end

function M.setup()
  normal_keymap()
end

return M
