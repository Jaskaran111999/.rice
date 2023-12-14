local ntfy = require("notify")

ntfy.setup({
  fps = 60,
  level = 2,
  minimum_width = 50,
  render = "minimal",
  stages = "fade",
  timeout = 3000,
})

vim.notify = ntfy
