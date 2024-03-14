local options = {
	expandtab = true,
	shiftwidth = 4,
	tabstop = 4,
	smartindent = true,
	cursorline = true,
	number = true,
	relativenumber = false,
	numberwidth = 4,
	backup = false,
	clipboard = 'unnamedplus',
	ignorecase = true,
	inccommand = 'nosplit',
	termguicolors = true,
    linebreak  = true,
}

for key, value in pairs(options) do
	vim.opt[key] = value
end
