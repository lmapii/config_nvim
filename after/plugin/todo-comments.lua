
-- TODO:
-- HACK:
-- WARN:
-- PERF:
-- NOTE:
-- TEST:
-- FIX:
-- TODO asdf
-- todo:
-- wat:

require("todo-comments").setup {
    signs = false,
    keywords = {
      TODO = { icon = "", color = "info", alt = { "todo", "wat" }}
    },
    gui_style = { fg = "NONE", bg = "NONE" },
    colors = {
      error =   { "DiagnosticError", "ErrorMsg", "#DC2626" },
      warning = { "DiagnosticWarning", "WarningMsg", "#FBBF24" },
      info =    { "#FFF36D" }, -- TODO: colorscheme overwrites this ...
      hint =    { "DiagnosticHint", "#10B981" },
      default = { "Identifier", "#7C3AED" },
      test =    { "Identifier", "#FF00FF" }
    },
  }

