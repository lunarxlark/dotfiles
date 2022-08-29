local M = {}

M.load = function(opt)
  require("config." .. opt)
end

return M
