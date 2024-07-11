local startTime = os.time()
local function getStatusLine()
  local actual = os.time()
  local diff = os.difftime(actual, startTime)
  local hours = diff / 3600 % 3600
  local minutes = diff / 60 % 60
  local seconds = diff % 60
  local timeString = string.format("%02d:%02d:%02d", hours, minutes, seconds)

  return "Time wasted : " .. timeString
end

return {
  getStatusLine = getStatusLine,
}
