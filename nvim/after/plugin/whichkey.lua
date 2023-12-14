local wk = require "which-key"

local conf = {
  window = {
    border = "shadow", -- none, single, double, shadow
    position = "bottom", -- bottom, top
    padding = { 1, 2, 1, 2}, -- extra window padding [top, right, bottom, left]
  },
  layout = {
    align = "center",
  },
  plugins = {
    marks = true, -- shows a list of your marks on ' and `
    registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
    presets = {
      operators = true, -- adds help for operators like d, y, ...
      motions = true, -- adds help for motions
      text_objects = true, -- help for text objects triggered after entering an operator
      nav = true, -- misc bindings to work with windows
      z = true, -- bindings for folds, spelling and others prefixed with z
      g = true, -- bindings for prefixed with g
    },
  },
  triggers_nowait = {
    -- marks
    "`",
    "'",
    "g`",
    "g'",
    -- registers
    '"',
    "<c-r>",
    -- spelling
    "z=",
  },
}

local opts = {
  mode = "n", -- Normal mode
  prefix = "<leader>",
  buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
  silent = true, -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = false, -- use `nowait` when creating keymaps
}

local mappings = {
  f = {
    name = "Find Files ",
    f = { "<cmd>Telescope find_files<cr>", "Fuzzy search" },
    g = { "<cmd>Telescope live_grep<cr>", "Live Grep" },
    b = { "<cmd>Telescope buffers<cr>", "Search buffers" },
  },
  z = {
    name = "Packer ",
    c = { "<cmd>PackerCompile<cr>", "Compile" },
    i = { "<cmd>PackerInstall<cr>", "Install" },
    s = { "<cmd>PackerSync<cr>", "Sync" },
    S = { "<cmd>PackerStatus<cr>", "Status" },
    u = { "<cmd>PackerUpdate<cr>", "Update" },
  },
  h = {
    name = "Git Hunks ",
    s = { "<cmd>Gitsigns stage_hunk<cr>", "Stage hunk" },
    r = { "<cmd>Gitsigns reset_hunk<cr>", "Reset hunk" },
    S = { "<cmd>Gitsigns stage_buffer<cr>", "Stage whole file" },
    R = { "<cmd>Gitsigns reset_buffer<cr>", "Reset whole file" },
    u = { "<cmd>Gitsigns undo_stage_hunk<cr>", "Undo stage hunk" },
    p = { "<cmd>Gitsigns preview_hunk<cr>", "Preview hunk" },
    j = { "<cmd>Gitsigns next_hunk<cr>", "Next hunk" },
    k = { "<cmd>Gitsigns prev_hunk<cr>", "Previous hunk" },
  },
  g = {
    name = "Octo",
    p = {
      name = "Pull Request ",
      l = { "<cmd>Octo pr list<cr>", "List Pull Requests" },
      ch = { "<cmd>Octo pr changes<cr>", "Changes" },
      cm = { "<cmd>Octo pr commits<cr>", "Commits" },
      d = { "<cmd>Octo pr diff<cr>", "Diff" },
      o = { "<cmd>Octo pr browser<cr>", "Open in browser  " },
    },
    r = {
      name = "Repository ",
      o = { "<cmd>Octo repo browser<cr>", "Open in browser  " },
    },
    t = {
      name = "Thread ",
      r = { "<cmd>Octo thread resolve<cr>", "Resolve " },
      x = { "<cmd>Octo thread unresolve<cr>", "Un-esolve " },
    },
    a = { "<cmd>Octo reviewer add<cr>", "Add reviewer " },
    s = {
      name = "Review ",
      s = { "<cmd>Octo review start<cr>", "Start Review" },
      p = { "<cmd>Octo review submit<cr>", "Submit" },
      r = { "<cmd>Octo review resume<cr>", "Resume" },
      f = { "<cmd>Octo review comments<cr>", "Comments" },
      c = { "<cmd>Octo review commit<cr>", "Pick commit" },
      x = { "<cmd>Octo review close<cr>", "Close" },
      d = { "<cmd>Octo review discard<cr>", "Discard" },
    },
  },
}

vim.timeoutlen = 300

wk.setup(conf)
wk.register(mappings, opts)
