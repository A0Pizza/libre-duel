local CollectionService = game:GetService("CollectionService")

local cube_size = require(script.Parent.cube_size)

local function cube_in_hitbox(position: Vector3): boolean
	local parts = workspace:GetPartBoundsInBox(
		CFrame.new(position),
		Vector3.new(cube_size, cube_size, cube_size)
	)

	for _, part in parts do
		if CollectionService:HasTag(part, "hitbox") then
			return true
		end
	end

	return false
end

return cube_in_hitbox