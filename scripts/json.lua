-- https://www.kyne.com.au/~mark/software/lua-cjson-manual.html
-- local mykey = KEYS[1]

-- the original purpose of this script was to provide
-- a two-way serialization JSON string to Redis Hash and back

local json_text = '{ "foo": "a", "bar": {"a": "oof"}, "baz": [1] }'
local parsed = cjson.decode(json_text)

-- return parsed
-- (empty list or set)
-- Known limitation of tables
-- https://stackoverflow.com/questions/51710571/cjson-decode-in-lua-returns-array-of-empty-arrays-redis-cli

if type(parsed) == 'table' then
  local keys = {}
  local values = {}
  local index = 1

  for k,v in pairs(parsed) do
    keys[index] = k
    if type(v) == 'table' then
      values[index] = cjson.encode(v) -- or try just: v
    else
      values[index] = v
    end
    index = index + 1
  end

  return values

else
  return -1
end
