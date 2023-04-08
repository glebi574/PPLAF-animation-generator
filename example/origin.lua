origin = {}
origin_a = {}
origin_k = {}
colors = {}

function make_color(r, g, b, a)
	return ((r * 256 + g) * 256 + b) * 256 + a
end

for i = 1, particle_amount do
	table.insert(origin, 5 + math.random() * r)
	table.insert(origin_a, math.random() * TAU)
	table.insert(origin_k, math.random(1, 1))
	for n = 1, 2 do
		table.insert(colors, make_color(100, math.random(150, 200), 100, math.random(150, 200)))
	end
end

return {origin = origin, origin_a = origin_a, origin_k = origin_k, colors = colors}