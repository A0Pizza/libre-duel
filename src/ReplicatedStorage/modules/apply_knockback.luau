local Debris = game:GetService("Debris")

--constant_strength keeps knockback consistent no matter how far the player is hit from! you wouldn't really want that set to false unless the knockback is from an explosive.
local function apply_knockback(attacker: Part, target: Part, strength: number?, constant_strength: boolean?): ()
	local strength_result = strength or 1
	constant_strength = constant_strength ~= false

	local direction = target.Position - attacker.Position

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

	linearvelocity.VectorVelocity = Vector3.new(direction.X, 15, direction.Z) * strength_result
	Debris:AddItem(attachment, 0.2) --m~memowwy lyeaks awe bawwd~~~ OwO
end

return apply_knockback
