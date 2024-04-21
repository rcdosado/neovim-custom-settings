return {
  {
    'iamcco/markdown-preview.nvim',
    cmd = { 'MarkdownPreviewToggle', 'MarkdownPreview', 'MarkdownPreviewStop' },
    build = 'cd app && yarn install',
    init = function()
      vim.g.mkdp_filetypes = { 'markdown' }
      vim.g.mkdp_open_to_the_world = 1
      vim.g.mkdp_port = '9999'
      vim.g.mkdp_echo_preview_url = true
    end,
    ft = { 'markdown' },
  },
}
