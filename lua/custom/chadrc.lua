---@type ChadrcConfig
local M = {}

M.ui = {

  -- =============================== general ===============================
  blankline = { style = "rainbow", blank = true }, -- style: rainbow/nil, blank = true/false
  cmp = { style = "atom" },
  extended_integrations = { "dap", "rainbowdelimiters", "trouble", "todo" },
  hl_override = {
    CursorLine = { bg = "black2" },
    CursorLineNr = { fg = "yellow" },
    FoldColumn = { bg = "none", fg = "lightbg" },
    LspReferenceRead = { bg = "lightbg", fg = "none" },
    LspReferenceText = { bg = "lightbg", fg = "none" }, -- same Visual highlight but lighter
    LspReferenceWrite = { bg = "lightbg", fg = "none" },
    NvDashAscii = { bg = "green" },
  },
  theme_toggle = { "gruvchad", "gruvchad" },
  theme = "gruvchad",

  -- ============================= statusline ==========================
  statusline = {
    theme = "vscode",
    overriden_modules = function(modules)
      local custom = require("custom.configs.statusline")
      modules[1] = custom.mode()
      modules[2] = custom.fileInfo()
      modules[4] = custom.LSP_Diagnostics()
      modules[9] = custom.LSP_status()
      modules[10] = custom.tabWidth()
      modules[11] = custom.cursorPos()
      modules[12] = ""
      modules[13] = custom.cwd()
      table.insert(modules, 6, custom.others())
    end,
  },

  -- ============================== dashboard ==============================
  nvdash = {
    header = {
      [[ ╓─────────────────────────────────────╖ ]],
      [[ ║           █████████████             ║ ]],
      [[ ║          █▒  ██   ██                ║ ]],
      [[ ║              ██   ██                ║ ]],
      [[ ║              ██   ██                ║ ]],
      [[ ║             ███   ██                ║ ]],
      [[ ║            ▓██▒   ██▒  █            ║ ]],
      [[ ║           ███▓    ▓████             ║ ]],
      [[ ║                                     ║ ]],
      [[ ║    𝜋 𝑖𝑠 𝑖𝑟𝑟𝑎𝑡𝑖𝑜𝑛𝑎𝑙 𝑗𝑢𝑠𝑡 𝑙𝑖𝑘𝑒 𝑚𝑒!    ║ ]],
      [[ ╙─────────────────────────────────────╜ ]],
    },
    buttons = {
      { "  Find Files", "f", "Telescope find_files" },
      { "󱦺  Recent Files", "o", "Telescope oldfiles" },
      { "  Find Text", "w", "Telescope live_grep_args" },
      { "  Bookmarks", "b", "Telescope marks" },
      { "  Themes", "t", "Telescope themes" },
      { "  Projects", "p", "Telescope project" },
      { "󰒲  Lazy", "l", "Lazy" },
      { "  Exit", "q", "q" },
    },
  },
}

M.plugins = "custom.plugins"

M.mappings = require("custom.mappings")

return M
