local appearance = {}

function appearance.setup()
  appearance.config_color_scheme()
  appearance.config_line_numbers()
end

function appearance.config_line_numbers()
  vim.wo.number = true
  vim.wo.cursorline = true
  vim.wo.cursorlineopt = "number"
end

function appearance.config_color_scheme()
  local onedark = require("onedark")
  -- options: dark, darker, cool, deep, warm, warmer, light
  onedark.setup { style = "deep" }
  onedark.load()
end

return appearance
