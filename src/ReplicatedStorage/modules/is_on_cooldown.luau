local cooldowns = require(script.Parent.cooldowns)

local function is_on_cooldown(player: Player, name: string): boolean
	local playerCooldowns = cooldowns[player]
	if not playerCooldowns then return false end

	local endTime = playerCooldowns[name]
	return endTime ~= nil and endTime > os.clock()
end

return is_on_cooldown
