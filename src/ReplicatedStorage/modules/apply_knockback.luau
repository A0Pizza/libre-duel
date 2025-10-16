local delay_for_frames = require(script.Parent.delay_for_frames)

local debris = game:GetService("Debris")

local function apply_knockback(vector, target, strength: number?, constant_strength: boolean?) --constant_strength keeps knockback consistent no matter how far the player is hit from! you wouldn't really want that set to false unless the knockback is from an explosive.
	strength = strength or 1

	if constant_strength == nil then
		constant_strength = true
	end

	local direction = target.Position - vector.Position

	if constant_strength then
		if direction.Magnitude > 0 then
			direction = direction.Unit * 45
		end
	end

	print("Direction:", direction)

	local attachment = Instance.new("Attachment")
	attachment.Parent = target

	local linearvelocity = Instance.new("LinearVelocity")
	linearvelocity.MaxForce = math.huge
	linearvelocity.Attachment0 = attachment
	linearvelocity.Parent = attachment

	linearvelocity.VectorVelocity = Vector3.new(0, 25, 0) * strength --have to apply vertical velocity first because roblox is goofy
	task.wait(0.08)
	linearvelocity.VectorVelocity = Vector3.new(direction.X, 20, direction.Z) * strength
	debris:AddItem(attachment, 0.05) --m~memowwy lyeaks awe bawwd~~~ OwO
end

return apply_knockback
