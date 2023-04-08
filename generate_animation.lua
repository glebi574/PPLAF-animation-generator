__path = __path .. '\\'
dofile(__path .. 'param.lua')

local str = ''
for name, arr in pairs(dofile(__path .. 'origin.lua')) do
	str = str .. name .. ' = {' .. table.concat(arr, ',') .. '}\n'
end

local param = io.open(__path .. 'param.lua', 'r')
str = str .. param:read'*all'
param:close()

local main = io.open(__path .. 'main.lua', 'r')
str = str .. main:read'*all'
main:close()

local file = io.open(__path .. 'output\\_.lua', 'w')
file:write(str)
file:close()

print'_.lua was created'

local type = io.open(__path .. 'output\\_type.lua', 'w')
type:write('return {frame_amount = ' .. frame_amount .. ', file_amount = ' .. file_amount .. ', frames_per_file = ' .. frames_per_file .. '}')
type:close()

print'_type.lua was created'

for i = 1, file_amount do
	local mesh = io.open(__path .. 'output\\' .. i .. '.lua', 'w')
	mesh:write('meshes=require\'/dynamic/' .. __animation_path .. '_.lua\'(' .. i - 1 .. ')')
	mesh:close()
end

print'All frames were created.'