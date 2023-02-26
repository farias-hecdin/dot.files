local W = {}

-- Clock
W.app_clock = function()
  return " " .. os.date("%I:%M%p")
end

-- Word counter
W.app_counter = function()
  local wc = vim.api.nvim_eval("wordcount()")
  local icon = " "
  if wc["visual_words"] then
    return icon .. wc["visual_words"]
  else
    return icon .. wc["words"]
  end
end

-- Startuptime
W.app_lazy = function()
  local stats = require("lazy").stats()
  local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
  return " " .. ms .. "ms"
end

-- Date
W.app_date = function()
  local time = " " .. os.date("%I:%M%p")
  local date = " " .. os.date("(%A) %v")
  return date .. "   " .. time
end

return W
