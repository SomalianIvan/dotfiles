vim.api.nvim_exec(
  [[
nmap ; :
vmap ; :
]],

  true
)

-- Function to open Grokt search for the word under the cursor
function OpenGroktSearch()
  -- Get the word under the cursor
  local word = vim.fn.expand "<cword>"

  -- URL encode the word to handle spaces or special characters
  local url_encoded_word = vim.fn.shellescape(word)

  -- Construct the Grokt search URL
  local url = "https://grokt.shopify.io/results?q=" .. url_encoded_word

  -- Command to open the URL in the default browser
  local command = "open '" .. url .. "'"

  -- Execute the command
  vim.fn.system(command)

  -- Print a message in Neovim (optional)
  print("Searching for: " .. word)
end

-- Set up the key mapping
vim.api.nvim_set_keymap("n", "<Leader>fg", ":lua OpenGroktSearch()<CR>", { noremap = true, silent = true })
