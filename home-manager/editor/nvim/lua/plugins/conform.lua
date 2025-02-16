return {
	"conform.nvim",
	opts = {
		formatters_by_ft = {
			cpp = { "clang_format" },
		},
		formatters = {
			clang_format = {
				prepend_args = { "-style={BasedOnStyle: LLVM, IndentWidth: " .. vim.opt.shiftwidth:get() .. "}" },
			},
			prettier = {
				prepend_args = { "--tab-width", vim.opt.shiftwidth:get() },
			},
		},
	},
}
