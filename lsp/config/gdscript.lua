return {
  -- cmd = { "ncat", "127.0.0.1", "6005" },
  cmd = vim.lsp.rpc.connect("127.0.0.1", "6005"),
}
