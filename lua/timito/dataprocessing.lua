local local_utils = require("timito.utils")

local dataprocessing = {}
local constants = require("timito.constants")
local SavedTime = require("timito.savedTimeClass")

local uv = vim.uv
function dataprocessing.get_stored_data(fd)
  local raw = uv.fs_read(fd, 2000)
  if raw == nil then
    vim.notify("raw is nil")
  end
  local sttable = {}
  local lines = local_utils.split(raw, "\n")
  for i, line in ipairs(lines) do
    local parts = local_utils.split(line, ",")
    local path = ""
    local time = 0
    for index, value in ipairs(parts) do
      if index == 1 then
        path = value
      elseif index == 2 then
        time = value
      end
    end
    local st = SavedTime:new(path, time)
    table.insert(sttable, st)
    -- print(sttable)
    -- vim.notify(st.path)
  end
end
function dataprocessing.write_data(path, data)
  local fd = uv.fs_open(path, "a", constants.RWD_FS)
  uv.fs_write(fd, data)
end
return dataprocessing
