local startTime = os.time()
local function getStatusLine()
  local actual = os.time()
  local diff = os.difftime(actual, startTime)
  local suffix = " seconds"
  local timeToDisplay = diff
  if diff > 60 then
    timeToDisplay = timeToDisplay / 60
    suffix = " minutes"
  end
  return "Time wasted : " .. timeToDisplay .. suffix
end

return {
  getStatusLine = getStatusLine,
}
