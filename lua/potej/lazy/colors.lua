
function clearbg(color)
	color = color or "tokyonight"
	vim.cmd.colorscheme(color)

	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none"} )
end

return{
    "folke/tokyonight.nvim",
    lazy = false,
    opts = {},
    config = function()
        clearbg()
    end

}

