return {
  {
    'huggingface/llm.nvim',
    config = function()
      local llm = require 'llm'
      llm.setup {
        lsp = {
          bin_path = vim.api.nvim_call_function('stdpath', { 'data' }) .. '/mason/bin/llm-ls',
          host = 'localhost',
          port = 12345,
          version = '0.5.2',
        },
        api_token = nil, -- cf Install paragraph
        model = 'codellama:13b', -- the model ID, behavior depends on backend
        backend = 'ollama', -- backend ID, "huggingface" | "ollama" | "openai" | "tgi"
        url = 'http://localhost:1234/api/chat',
        -- url = nil,
        tokens_to_clear = { '<|endoftext|>' }, -- tokens to remove from the model's output
        -- parameters that are added to the request body, values are arbitrary,
        -- you can set any field:value pair here it will be passed as is to the backend
        request_body = {
          parameters = {
            max_new_tokens = 60,
            temperature = 0.2,
            top_p = 0.95,
          },
        },
        -- set this if the model supports fill in the middle
        fim = {
          enabled = true,
          prefix = '<PRE> ',
          middle = ' <MID>',
          suffix = ' <SUF>',
        },
        debounce_ms = 150,
        accept_keymap = '<Tab>',
        dismiss_keymap = '<S-Tab>',
        tls_skip_verify_insecure = false,
        -- llm-ls configuration, cf llm-ls section
        tokenizer = nil, -- cf Tokenizer paragraph
        context_window = 8192, -- max number of tokens for the context window
        enable_suggestions_on_startup = true,
        enable_suggestions_on_files = '*', -- pattern matching syntax to enable suggestions on specific files, either a string or a list of strings
      }
    end,
    opts = {},
  },
}
