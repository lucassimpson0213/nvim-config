 local M = {}

function M.setup()
  require('base16-colorscheme').setup({
    base00 = '#15130d',
    base01 = '#221f19',
    base02 = '#2c2a23',
    base03 = '#97907f',
    base04 = '#cec6b3',
    base05 = '#e8e2d7',
    base06 = '#e8e2d7',
    base07 = '#e8e2d7',
    base08 = '#ffb4ab',
    base09 = '#b1d188',
    base0A = '#d4c69b',
    base0B = '#dec56b',
    base0C = '#b1d188',
    base0D = '#dec56b',
    base0E = '#d4c69b',
    base0F = '#f0e2b5',
  })

  local hi = function(group, opts)
    vim.api.nvim_set_hl(0, group, opts)
  end

  hi('TelescopeNormal',         { fg = '#e8e2d7',          bg = '#15130d' })
  hi('TelescopeBorder',         { fg = '#97907f',             bg = '#15130d' })
  hi('TelescopePromptNormal',   { fg = '#e8e2d7',          bg = '#15130d' })
  hi('TelescopePromptBorder',   { fg = '#97907f',             bg = '#15130d' })
  hi('TelescopePromptPrefix',   { fg = '#dec56b',             bg = '#15130d' })
  hi('TelescopePromptCounter',  { fg = '#cec6b3',  bg = '#15130d' })
  hi('TelescopePromptTitle',    { fg = '#15130d',             bg = '#dec56b' })
  hi('TelescopePreviewTitle',   { fg = '#15130d',             bg = '#d4c69b' })
  hi('TelescopeResultsTitle',   { fg = '#15130d',             bg = '#b1d188' })
  hi('TelescopeSelection',      { fg = '#e8e2d7',          bg = '#2c2a23' })
  hi('TelescopeSelectionCaret', { fg = '#dec56b',             bg = '#2c2a23' })
  hi('TelescopeMatching',       { fg = '#dec56b',             bold = true })
end

-- Register a signal handler for SIGUSR1 (matugen updates).
-- The handler re-requires this module, which re-runs the code below, so the
-- previous handle is stopped first; otherwise handlers double on every signal.
if _G.__matugen_signal then
  _G.__matugen_signal:stop()
  _G.__matugen_signal:close()
end

local signal = vim.uv.new_signal()
_G.__matugen_signal = signal
signal:start(
  'sigusr1',
  vim.schedule_wrap(function()
    package.loaded['matugen'] = nil
    require('matugen').setup()
  end)
)

return M
