local M = {}

-- Popup terminal state
local popup_term = {
  buf = nil,
  win = nil,
}

-- Function to create popup terminal
function M.toggle_popup_terminal()
  if popup_term.win and vim.api.nvim_win_is_valid(popup_term.win) then
    -- Close the popup if it's open
    vim.api.nvim_win_close(popup_term.win, true)
    popup_term.win = nil
  else
    -- Create or reuse terminal buffer
    if not popup_term.buf or not vim.api.nvim_buf_is_valid(popup_term.buf) then
      popup_term.buf = vim.api.nvim_create_buf(false, true)
      vim.bo[popup_term.buf].buftype = 'terminal'
    end

    -- Calculate popup size
    local width = math.floor(vim.o.columns * 0.8)
    local height = math.floor(vim.o.lines * 0.8)
    local row = math.floor((vim.o.lines - height) / 2)
    local col = math.floor((vim.o.columns - width) / 2)

    -- Create floating window
    popup_term.win = vim.api.nvim_open_win(popup_term.buf, true, {
      relative = 'editor',
      width = width,
      height = height,
      row = row,
      col = col,
      style = 'minimal',
      border = 'rounded',
    })

    -- Start terminal if buffer is empty
    if vim.api.nvim_buf_line_count(popup_term.buf) == 1 and
       vim.api.nvim_buf_get_lines(popup_term.buf, 0, 1, false)[1] == '' then
      vim.fn.termopen(vim.o.shell)
    end

    -- Enter insert mode
    vim.cmd('startinsert')
  end
end

return M
