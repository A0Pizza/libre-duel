local delay_for_frames = require(script.Parent.delay_for_frames)

local debris = game:GetService("Debris")

local function apply_knockback(vector, target, strength: number?, constant_strength: boolean?) --constant_strength keeps knockback consistent no matter how far the player is hit from! you wouldn't really want that set to false unless the knockback is from an explosive.
	strength = strength or 1
	constant_strength = constant_strength ~= false

	local direction = target.Position - vector.Position

	if constant_strength then
		if direction.Magnitude > 0 then
			direction = direction.Unit * 25
		end
	end

	print("Direction:", direction)

	local attachment = Instance.new("Attachment")
	attachment.Parent = target

	local linearvelocity = Instance.new("LinearVelocity")
	linearvelocity.MaxForce = 150000
	linearvelocity.Attachment0 = attachment
	linearvelocity.Parent = attachment

	linearvelocity.VectorVelocity = Vector3.new(direction.X, 15, direction.Z) * strength
	debris:AddItem(attachment, 0.2) --m~memowwy lyeaks awe bawwd~~~ OwO
end

return apply_knockback
