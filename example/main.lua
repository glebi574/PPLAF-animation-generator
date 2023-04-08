
function g(N)
	local ang = d * N
	local vertexes = {}
	local segments = {}
	local index = 0
	for i = 1, particle_amount do
		local sin, cos = math.sin(ang * origin_k[i] + origin_a[i]), math.cos(ang * origin_k[i] + origin_a[i])
		local dy, dx = sin * l, cos * l
		local y, x = sin * origin[i], cos * origin[i]
		table.insert(vertexes, {x, y})
		table.insert(vertexes, {x + dx, y + dy})
		table.insert(segments, {index, index + 1})
		index = index + 2
	end
	return {{vertexes = vertexes, segments = segments, colors = colors}}
end

return g