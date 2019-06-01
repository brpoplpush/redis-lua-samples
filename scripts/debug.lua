local num_keys = redis.call("DBSIZE")
local x = num_keys - 10

local function cursor(y)
  if (y < 0) then return 0 else return y end
end

-- Scan the last ten elements
return redis.call("SCAN", cursor(x))
