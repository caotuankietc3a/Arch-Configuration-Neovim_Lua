local which_key = require("which-key")

local setup = {
  plugins = {
    marks = true, -- shows a list of your marks on ' and `
    registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
    spelling = {
      enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
      suggestions = 20, -- how many suggestions should be shown in the list?
    },
    -- the presets plugin, adds help for a bunch of default keybindings in Neovim
    -- No actual key bindings are created
    presets = {
      operators = false, -- adds help for operators like d, y, ... and registers them for motion / text object completion
      motions = true, -- adds help for motions
      text_objects = true, -- help for text objects triggered after entering an operator
      windows = true, -- default bindings on <c-w>
      nav = true, -- misc bindings to work with windows
      z = true, -- bindings for folds, spelling and others prefixed with z
      g = true, -- bindings for prefixed with g
    },
  },
  -- add operators that will trigger motion and text object completion
  -- to enable all native operators, set the preset / operators plugin above
  -- operators = { gc = "Comments" },
  key_labels = {
    -- override the label used to display some keys. It doesn't effect WK in any other way.
    -- For example:
    -- ["<space>"] = "SPC",
    -- ["<cr>"] = "RET",
    -- ["<tab>"] = "TAB",
  },
  icons = {
    breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
    separator = "➜", -- symbol used between a key and it's label
    group = "+", -- symbol prepended to a group
  },
  popup_mappings = {
    scroll_down = "<c-d>", -- binding to scroll down inside the popup
    scroll_up = "<c-u>", -- binding to scroll up inside the popup
  },
  window = {
    border = "rounded", -- none, single, double, shadow
    position = "bottom", -- bottom, top
    margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
    padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
    winblend = 0,
  },
  layout = {
    height = { min = 4, max = 25 }, -- min and max height of the columns
    width = { min = 20, max = 50 }, -- min and max width of the columns
    spacing = 3, -- spacing between columns
    align = "center", -- align columns left, center or right
  },
  ignore_missing = true, -- enable this to hide mappings for which you didn't specify a label
  hidden = {
    "<silent>",
    "<cmd>",
    "<Cmd>",
    "<CR>",
    "call",
    "lua",
    "^:",
    "^ ",
  }, -- hide mapping boilerplate
  show_help = true, -- show help message on the command line when the popup is visible
  triggers = "auto", -- automatically setup triggers
  -- triggers = {"<leader>"} -- or specify a list manually
  triggers_blacklist = {
    -- list of mode / prefixes that should never be hooked by WhichKey
    -- this is mostly relevant for key maps that start with a native binding
    -- most people should not need to change this
    i = { "j", "k" },
    v = { "j", "k" },
  },
}

which_key.setup(setup)

-- [<leader>]
local opts = {
  mode = "n", -- NORMAL mode
  prefix = "<leader>",
  buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
  silent = true, -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = true, -- use `nowait` when creating keymaps
}
local mappings = {
  ["a"] = { "<cmd>Alpha<cr>", "Alpha" },
  ["b"] = {
    "<cmd>lua require('telescope.builtin').buffers(require('telescope.themes').get_dropdown{previewer = false})<cr>",
    "Buffers",
  },
  ["e"] = { "<cmd>Neotree toggle position=left<cr>", "Explorer" },
  ["E"] = {
    "<cmd>Neotree toggle position=float<cr>",
    "Explorer Float",
  },
  ["w"] = { "<cmd>w!<CR>", "Save" },
  ["q"] = { "<cmd>q!<CR>", "Quit" },
  ["d"] = { "<cmd>Bdelete!<CR>", "Close Buffer" },
  ["h"] = { "<cmd>nohlsearch<CR>", "No Highlight" },
  ["f"] = {
    "<cmd>lua require('telescope.builtin').find_files(require('telescope.themes'))<cr>",
    "Find files",
  },
  -- [[ -- ["F"] = { "<cmd>Telescope live_grep theme=ivy<cr>", "Find Text" }, ]],
  ["F"] = { "<cmd>Telescope live_grep<cr>", "Find Text" },
  ["p"] = {
    "<cmd>lua require('telescope').extensions.projects.projects()<cr>",
    "Projects",
  },
  l = {
    name = "LSP",
    a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action" },
    d = {
      "<cmd>Telescope lsp_document_diagnostics<cr>",
      "Document Diagnostics",
    },
    w = {
      "<cmd>Telescope lsp_workspace_diagnostics<cr>",
      "Workspace Diagnostics",
    },
    f = { "<cmd>lua vim.lsp.buf.formatting()<cr>", "Format" },
    i = { "<cmd>LspInfo<cr>", "Info" },
    I = { "<cmd>LspInstallInfo<cr>", "Installer Info" },
    j = {
      "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>",
      "Next Diagnostic",
    },
    k = {
      "<cmd>lua vim.lsp.diagnostic.goto_prev()<cr>",
      "Prev Diagnostic",
    },
    l = { "<cmd>lua vim.lsp.codelens.run()<cr>", "CodeLens Action" },
    q = {
      "<cmd>lua vim.lsp.diagnostic.set_loclist()<cr>",
      "Quickfix",
    },
    r = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename" },
    s = {
      "<cmd>Telescope lsp_document_symbols<cr>",
      "Document Symbols",
    },
    S = {
      "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>",
      "Workspace Symbols",
    },
  },
  j = {
    name = "Java",
    --[[ o = { "<Cmd>lua require'jdtls'.organize_imports()<CR>", "Organize Imports" }, ]]
    --[[ v = { "<Cmd>lua require('jdtls').extract_variable()<CR>", "Extract Variable" }, ]]
    --[[ c = { "<Cmd>lua require('jdtls').extract_constant()<CR>", "Extract Constant" }, ]]
    --[[ t = { "<Cmd>lua require'jdtls'.test_nearest_method()<CR>", "Test Method" }, ]]
    --[[ T = { "<Cmd>lua require'jdtls'.test_class()<CR>", "Test Class" }, ]]
    u = { "<Cmd>JdtUpdateConfig<CR>", "Update Config" },
    s = { "<Cmd>JdtShowLogs<CR>", "Show Logs" },
    b = { "<Cmd>JdtBytecode<CR>", "Byte Code" },
    r = { "<Cmd>JdtSetRuntime<CR>", "Run Time" },
    w = { "<Cmd>JdtWipeDataAndRestart<CR>", "Wipe Restart" },
  },

  m = {
    name = "Markdown PreView",
    p = { "<Cmd>MarkdownPreview<CR>", "Markdown Preview" },
    s = { "<Cmd>MarkdownPreviewStop<CR>", "Markdown Preview Stop" },
    t = { "<Cmd>MarkdownPreviewToggle<CR>", "Markdown Preview Toggle" },
  },

  g = {
    name = "Git",
    g = { "<cmd>lua _LAZYGIT_TOGGLE()<CR>", "Lazygit" },
    j = { "<cmd>lua require 'gitsigns'.next_hunk()<cr>", "Next Hunk" },
    k = { "<cmd>lua require 'gitsigns'.prev_hunk()<cr>", "Prev Hunk" },
    l = { "<cmd>lua require 'gitsigns'.blame_line()<cr>", "Blame" },
    p = { "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", "Preview Hunk" },
    r = { "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", "Reset Hunk" },
    R = { "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", "Reset Buffer" },
    s = { "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", "Stage Hunk" },
    u = {
      "<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>",
      "Undo Stage Hunk",
    },
    o = { "<cmd>Telescope git_status<cr>", "Open changed file" },
    b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
    c = { "<cmd>Telescope git_commits<cr>", "Checkout commit" },
    d = {
      "<cmd>Gitsigns diffthis HEAD<cr>",
      "Diff",
    },
  },

  t = {
    name = "Terminal",
    n = { "<cmd>lua _NODE_TOGGLE()<cr>", "Node" },
    c = { "<cmd>lua _CPP_TOGGLE()<cr>", "Cpp" },
    C = { "<cmd>lua _CPP_FILEs_TOGGLE()<cr>", "Cpp with arguments" },
    j = { "<cmd>lua _JAVA_TOGGLE()<cr>", "Java" },
    J = { "<cmd>lua _JAVA_PACKAGE_TOGGLE()<cr>", "Java with package" },
    u = { "<cmd>lua _NCDU_TOGGLE()<cr>", "NCDU" },
    t = { "<cmd>lua _HTOP_TOGGLE()<cr>", "Htop" },
    p = { "<cmd>lua _PYTHON_TOGGLE()<cr>", "Python" },
    f = { "<cmd>ToggleTerm direction=float<cr>", "Float" },
    h = { "<cmd>ToggleTerm size=10 direction=horizontal<cr>", "Horizontal" },
    v = { "<cmd>ToggleTerm size=80 direction=vertical<cr>", "Vertical" },
  },

  s = {
    name = "Session",
    s = { "<cmd>SearchSession<cr>", "Search Session" },
    S = { "<cmd>SaveSession<cr>", "Save Session" },
    d = { "<cmd>DeleteSession<cr>", "Delete Session" },
  },
}
which_key.register(mappings, opts)

-- fold [f]
local fold_opts = {
  mode = "n", -- NORMAL mode
  prefix = "f",
  buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
  silent = true, -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = true, -- use `nowait` when creating keymaps
}
local fold_mappings = {
  ["d"] = { "zd", "Delete fold under cursor" },
  ["o"] = {
    "zo<cmd>IndentBlanklineEnable<CR>",
    "Open fold under cursor",
  },
  ["O"] = { "zO", "Open all folds under cursor" },
  ["c"] = { "zc", "Close fold under cursor" },
  ["C"] = { "zC", "Close all folds under cursor" },
  ["a"] = {
    "za<cmd>IndentBlanklineEnable<CR>",
    "Toggle fold under cursor",
  },
  ["A"] = { "zA", "Toggle all folds under cursor" },
  ["v"] = { "zv", "Show cursor line" },
  ["M"] = { require("ufo").closeAllFolds, "Close all folds" },
  ["R"] = { require("ufo").openAllFolds, "Open all folds" },
  ["m"] = { "zm", "Fold more" },
  ["r"] = { "zr", "Fold less" },
  ["x"] = { "zx", "Update folds" },
  ["z"] = { "zz", "Center this line" },
  ["t"] = { "zt", "Top this line" },
  ["b"] = { "zb", "Bottom this line" },
  ["g"] = { "zg", "Add word to spell list" },
  ["w"] = { "zw", "Mark word as bad/misspelling" },
  ["e"] = { "ze", "Right this line" },
  ["E"] = { "zE", "Delete all folds in current buffer" },
  ["s"] = { "zs", "Left this line" },
  ["H"] = { "zH", "Half screen to the left" },
  ["L"] = { "zL", "Half screen to the right" },
}
which_key.register(fold_mappings, fold_opts)

which_key.register({ ["f"] = { "zf", "Create fold" } }, {
  mode = "v",
  prefix = "f",
  buffer = nil,
  silent = true,
  noremap = true,
  nowait = true,
})

-- search [s]
local search_opts = {
  mode = "n", -- NORMAL mode
  prefix = "s",
  buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
  silent = true, -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = true, -- use `nowait` when creating keymaps
}
local search_mapping = {
  ["b"] = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
  ["c"] = { "<cmd>Telescope colorscheme<cr>", "Colorscheme" },
  ["h"] = { "<cmd>Telescope help_tags<cr>", "Find Help" },
  ["M"] = { "<cmd>Telescope man_pages<cr>", "Man Pages" },
  ["r"] = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
  ["R"] = { "<cmd>Telescope registers<cr>", "Registers" },
  ["k"] = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
  ["C"] = { "<cmd>Telescope commands<cr>", "Commands" },
}
which_key.register(search_mapping, search_opts)

local goto_mapping = {
  ["d"] = { "<cmd>Telescope lsp_definitions<cr>", "Go to definition" },
  ["r"] = { "<cmd>Telescope lsp_references<cr>", "Go to references" },
  ["i"] = {
    "<cmd>Telescope lsp_implementations<cr>",
    "Go to implementations",
  },
  ["b"] = { "<cmd>BufferLinePick<CR>", "Bufferline: pick buffer" },
}
-- Go to [g]
local goto_opts = {
  mode = "n", -- NORMAL mode
  prefix = "g",
  buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
  silent = true, -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = true, -- use `nowait` when creating keymaps
}

which_key.register(goto_mapping, goto_opts)
