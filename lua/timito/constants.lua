local constants = {}

constants.NVIM_DATA_FOLDER_PATH = string.format("%s/timito", vim.fn.stdpath("data"))
constants.DATA_FILE_PROJECTS = string.format("%s/projects", constants.NVIM_DATA_FOLDER_PATH)
constants.RWD_FS = 448

return constants
