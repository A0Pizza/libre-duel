local cooldowns = require(script.Parent.cooldowns)

local function is_on_cooldown(player: Player, name: string): boolean
	local player_cooldowns = cooldowns[player]
	if not player_cooldowns then return false end

	local end_time = player_cooldowns[name]
	return end_time > os.clock()
end

return is_on_cooldown
