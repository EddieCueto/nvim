-- GRUVBOX --
--[[
local colorscheme = "rose-pine"
-- local colorscheme = "gruvbox-baby"

-- OTHER ---

-- local colorscheme = "duskfox"
-- local colorscheme = "melange"
-- local colorscheme = "tokyonight-night"

-- local colorscheme = "onedark"
--   -- style options: dark, darker, cool, deep, warm, warmer, light
--   require('onedark').setup {
--       style = 'dark'
--   }
--   require('onedark').load()

-- GENERAL --

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  return
end
]]--

function ColorSchemes(color)
    color = color or "rose-pine"
    vim.cmd.colorscheme(color)

    --vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    --vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

ColorSchemes()


