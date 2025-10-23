local cooldowns = require(script.Parent.cooldowns)

local function is_on_cooldown(player: Player, name: string): boolean
	local player_cooldowns = cooldowns[player]
	if player_cooldowns == nil then
		return false
	end

	local end_time: number? = player_cooldowns[name]
	if end_time == nil then
		return false
	end

	return end_time > os.clock()
end

return is_on_cooldown
