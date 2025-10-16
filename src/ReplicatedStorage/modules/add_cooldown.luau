local cooldowns = require(script.Parent.cooldowns)

local function add_cooldown(player: Player, name: string, duration: number)
	cooldowns[player] = cooldowns[player] or {}
	cooldowns[player][name] = os.clock() + duration
end

return add_cooldown
