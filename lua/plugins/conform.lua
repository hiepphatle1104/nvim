return {
  "stevearc/conform.nvim",
  config = function()
    local conform = require("conform")
    conform.setup({
      formatters_by_ft = {
        lua = { "stylua" },
        python = { "black", "isort" },
        javascript = { "prettierd", "prettier" },
        html = { "prettierd", "prettier" },
        css = { "prettierd", "prettier" },
        typescript = { "prettierd", "prettier" },
        jsx = { "prettierd", "prettier" },
        go = { "gofumpt", "goimports", "golines" },
        json = { "prettierd", "prettier" },
        markdown = { "prettierd", "prettier" },
        groovy = { "groovyls" },
        proto = { "buf" },
      },
      format_on_save = {
        timeout_ms = 500,
        lsp_fallback = true,
      },
    })

    -- Keymaps
    vim.keymap.set("n", "<leader>fm", function()
      conform.format({ async = true, lsp_fallback = true })
    end, { desc = "Format code" })
  end,
}
