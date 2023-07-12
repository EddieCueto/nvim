-- define colorscheme here
--[[
local colorscheme = "rose"

local is_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not is_ok then
    vim.notify("colorscheme " .. colorscheme .. " not found!")
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

