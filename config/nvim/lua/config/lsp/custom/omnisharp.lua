vim.lsp.config.omnisharp = {
	cmd = {
		"OmniSharp",
		"-z",
		"--hostPID", tostring(vim.fn.getpid()),
		"DotNet:enablePackageRestore=false",
		"--encoding", "utf-8",
		"--languageserver",
	},
	filetypes = { "cs" },
	root_markers = { ".git" },
	capabilities = {
		workspace = { workspaceFolders = false },
	},
	settings = {
		RoslynExtensionsOptions = { EnableDecompilationSupport = true },
	},
	on_attach = function(_, bufnr)
		vim.keymap.set("n", "gd", function()
			require("omnisharp_extended").lsp_definition()
		end, { buffer = bufnr, desc = "Go to definition" })
	end,
}

vim.lsp.enable("omnisharp")
