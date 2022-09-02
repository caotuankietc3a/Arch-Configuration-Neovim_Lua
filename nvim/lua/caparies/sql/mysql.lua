require("lspconfig").sqls.setup({
	on_attach = function(client, bufnr)
		require("caparies.lsp.handlers").on_attach(client, bufnr)
		require("sqls").on_attach(client, bufnr)
	end,
	capabilities = require("caparies.lsp.handlers").capabilities,
	settings = {
		sqls = {
			connections = {
				{
					driver = "mysql",
					dataSourceName = "root:Hokgadau170102#@tcp(127.0.0.1:3306)/web_customer_tracker",
				},
				{
					driver = "mysql",
					dataSourceName = "student-spring-hibernate:student-spring-hibernate@tcp(127.0.0.1:3306)/web_customer_tracker",
				},
			},
		},
	},
})
