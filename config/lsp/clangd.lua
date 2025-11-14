vim.lsp.config('clangd', {
	on_attach = function (client, bufnr)
		vim.api.nvim_buf_create_user_command(bufnr, 'LspClangdSwitchSourceHeader', function()
			switch_source_header(bufnr, client)
		end, { desc = 'Switch between source/header' })

		vim.api.nvim_buf_create_user_command(bufnr, 'LspClangdShowSymbolInfo', function()
			symbol_info(bufnr, client)
		end, { desc = 'Show symbol info' })

		vim.lsp.completion.enable(true, client.id, bufnr, {
			autotrigger = true,
			convert = function(item)
				return { abbr = item.label:gsub('%b()', '') }
			end,
		})

		if not client:supports_method('textDocument/willSaveWaitUntil')
		and client:supports_method('textDocument/formatting') then
			vim.api.nvim_create_autocmd('BufWritePre', {
			group = vim.api.nvim_create_augroup('my.lsp', {clear=false}),
			buffer = bufnr,
			callback = function()
				vim.lsp.buf.format({ bufnr = bufnr, id = client.id, timeout_ms = 1000 })
			end,
		})
		end

		vim.keymap.set("i", "<C-space>", vim.lsp.completion.get, { desc = "trigger autocompletion" })
	end,
})

