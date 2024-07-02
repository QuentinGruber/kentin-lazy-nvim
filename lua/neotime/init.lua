local count = 0
local function getStatusLine()
  count = count + 1
  return count
end

return {
  getStatusLine = getStatusLine,
}
