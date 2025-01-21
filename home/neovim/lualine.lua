require("lualine").setup {
    options = {
        theme = "auto",
        section_separators = { left = "", right = "" },
        component_separators = { left = "", right = "" },
        icons_enabled = true,
        globalstatus = true,
    },
    sections = {
        lualine_a = { { 'mode', fmt = function(res) return res:sub(1, 1) end } },
    },
}
