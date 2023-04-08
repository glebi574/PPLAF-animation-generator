origin_a = {4.0031881572935,2.1997646845845,5.9265158838941,2.9641443351535,0.071268402067216,2.9399071430752,5.9129189622889,4.6641116613602,1.964217146489,5.1191714926901}
origin = {25.903603576771,185.25499990714,118.90285404193,81.946037783757,182.3057385889,36.512008880217,190.43010903221,184.26823919063,28.457228742021,8.7779689920135}
colors = {1689281716,1689216189,1690330301,1690068128,1688036548,1689609385,1690592456,1687643322,1690789025,1687774365,1688298664,1689806015,1690199209,1690461339,1688429739,1687708825,1688691897,1690461380,1687905437,1689347252}
origin_k = {1,1,1,1,1,1,1,1,1,1}
frame_amount = 30
file_amount = 30
frames_per_file = 1

particle_amount = 10
TAU = math.pi * 2
d = TAU / frame_amount
l = 2.5
r = 200
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