-- part 1
local left = {}
local right = {}
for line in io.lines("input.txt") do
    local i = 1
    local l, r = line:match("(%d+)%s+(%d+)")
    table.insert(left, tonumber(l))
    table.insert(right, tonumber(r))
end

table.sort(left)
table.sort(right)

local dist = 0
for i = 1, #left do
  dist = dist + math.abs(left[i] - right[i])
end

print(dist)

-- part 2
local freq = {}
for _, v in ipairs(right) do
  if freq[v] then
    freq[v] = freq[v] + 1
  else
    freq[v] = 1
  end
end

local sim_score = 0
for _, n in ipairs(left) do
  local count = freq[n] or 0
  sim_score = sim_score + (n * count)
end

print(sim_score)
