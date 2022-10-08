
-- TODO:
-- HACK:
-- WARN:
-- PERF:
-- NOTE:
-- TEST:
-- FIX:
-- TODO doesn't work since it requires a colon
-- todo:
-- wat:

require("todo-comments").setup {
    signs = true,
    keywords = {
      TODO = { icon = "•", color = "info", alt = { "todo", "wat" } },
      FIX  = { icon = "", color = "error", alt = { "FIXME", "BUG" } },
      HACK = { icon = "", color = "warning" },
      WARN = { icon = "•", color = "warning", alt = { "WARNING", "XXX" } },
      PERF = { icon = "", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
      NOTE = { icon = "•", color = "hint", alt = { "INFO" } },
      TEST = { icon = "", color = "test", alt = { "TESTING", "PASSED", "FAILED" } },
    },
    gui_style = { fg = "NONE", bg = "NONE" },
    colors = {
      error =   { "#DC2626" },
      warning = { "DiagnosticWarning", "WarningMsg", "#FBBF24" },
      info =    { "#FFF36D" }, -- TODO: colorscheme overwrites this ...
      hint =    { "DiagnosticHint", "#10B981" },
      default = { "Identifier", "#7C3AED" },
      test =    { "Identifier", "#FF00FF" }
    },
    search = {
      -- regex for matching keywords
      -- pattern = [[\b(KEYWORDS)\b]], -- match without the extra colon
    }
  }

