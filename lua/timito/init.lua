local uv = vim.uv
local lastTimeSave = os.time()
local local_utils = require("timito.utils")
local constants = require("timito.constants")
local dataprocessing = require("timito.dataprocessing")

local function displayTime()
  -- TODO:
  vim.notify("work")
end

local function registerProgress()
  local currentTime = os.time()
  local diff = os.difftime(currentTime, lastTimeSave)
  local current_file = local_utils.get_current_file()
  local cwd = local_utils.get_current_dir()
  local timeString = string.format("adding time: %02d to %s and dir %s", diff, current_file, cwd)
  vim.notify(timeString)
  dataprocessing.write_new_data(cwd, diff)
  if currentTime ~= "" then
    dataprocessing.write_new_data(current_file, diff)
  end
  lastTimeSave = os.time()
end

local function setup()
  uv.fs_mkdir(constants.NVIM_DATA_FOLDER_PATH, constants.RWD_FS)
  local fd = uv.fs_open(constants.DATA_FILE_PROJECTS, "a", constants.RWD_FS)
  uv.fs_close(fd)
  vim.keymap.set("n", "<Leader>ts", "<cmd>Test<cr>")
  vim.api.nvim_create_user_command("ShowTime", displayTime, {})
  vim.api.nvim_create_user_command("Test", registerProgress, {})
end

setup()
