-- Floating Help
vim.api.nvim_create_autocmd("BufEnter", {
  pattern = "*.txt",
  callback = function()
    if vim.bo.filetype == "help" then
      local buf = vim.api.nvim_get_current_buf()
      vim.cmd("wincmd c")
      vim.api.nvim_open_win(buf, true, {
        relative = "editor",
        width = math.floor(vim.o.columns * 0.8),
        height = math.floor(vim.o.lines * 0.8),
        col = math.floor(vim.o.columns * 0.1),
        row = math.floor(vim.o.lines * 0.1),
        border = "rounded",
      })
      vim.cmd("setlocal nocursorline nonumber norelativenumber")

      vim.api.nvim_buf_set_keymap(buf, "n", "q", "<cmd>close<CR>", { noremap = true, silent = true })
    end
  end,
})

-- Yank Highlight
vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking (copying) text",
  group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
  callback = function()
    vim.highlight.on_yank({
      higroup = "Visual", -- Nhóm highlight để sử dụng
      timeout = 200, -- Thời gian highlight (ms)
      on_macro = true, -- Hỗ trợ highlight khi dùng macro
    })
  end,
})
