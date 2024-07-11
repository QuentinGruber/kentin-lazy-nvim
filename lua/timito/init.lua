local NVIM_DATA_FOLDER_PATH = string.format("%s/timito", vim.fn.stdpath("data"))
local DATA_FILE_PROJECTS = string.format("%s/projects", NVIM_DATA_FOLDER_PATH)
local RWD_FS = 448
local uv = vim.uv
local lastTimeSave = os.time()

-- Define the Person class
SavedTime = {}
SavedTime.__index = SavedTime

-- Constructor
function SavedTime:new(path, time)
  local obj = {
    path = path,
    time = time,
  }
  setmetatable(obj, SavedTime)
  return obj
end

-- Method
function SavedTime:addTime(time)
  self.time = self.time + time
end
local function displayTime()
  -- TODO:
  vim.notify("work")
end

-- Function to split a string by a given delimiter
local function split(input, delimiter)
  local result = {}
  for match in (input .. delimiter):gmatch("(.-)" .. delimiter) do
    table.insert(result, match)
  end
  return result
end

local function get_current_file()
  return vim.api.nvim_buf_get_name(vim.api.nvim_get_current_buf())
end

local function get_current_dir()
  return vim.uv.cwd()
end
local function get_fd_file()
  return uv.fs_open(DATA_FILE_PROJECTS, "r+", RWD_FS)
end
local function get_stored_data(fd)
  local raw = uv.fs_read(fd, 2000)
  if raw == nil then
    vim.notify("raw is nil")
  end
  local sttable = {}
  local lines = split(raw, "\n")
  for i, line in ipairs(lines) do
    local parts = split(line, ",")
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
local function write_data(path, data)
  local fd = uv.fs_open(path, "a", RWD_FS)
  uv.fs_write(fd, data)
end

local function registerProgress()
  local currentTime = os.time()
  local diff = os.difftime(currentTime, lastTimeSave)
  local current_file = get_current_file()
  local cwd = get_current_dir()
  local timeString = string.format("adding time: %02d to %s and dir %s", diff, current_file, cwd)
  vim.notify(timeString)
  local data = string.format("%s,%d\n", cwd, diff)
  write_data(DATA_FILE_PROJECTS, data)
  lastTimeSave = os.time()
end

local function setup()
  uv.fs_mkdir(NVIM_DATA_FOLDER_PATH, RWD_FS)
  local fd = uv.fs_open(DATA_FILE_PROJECTS, "a", RWD_FS)
  uv.fs_close(fd)
  get_stored_data(get_fd_file())
  vim.keymap.set("n", "<Leader>ts", "<cmd>Test<cr>")
  vim.api.nvim_create_user_command("ShowTime", displayTime, {})
  vim.api.nvim_create_user_command("Test", registerProgress, {})
end

setup()
