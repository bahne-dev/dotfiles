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
}

vim.lsp.enable("omnisharp")

vim.api.nvim_create_autocmd("FileType", {
  pattern = "cs",
  callback = function(args)
    vim.keymap.set("n", "gd", function()
      require("omnisharp_extended").lsp_definition()
    end, { buffer = args.buf })
  end,
})
