local cooldowns = require(script.Parent.cooldowns)

local function remove_cooldown(player: Player, name: string): ()
	if cooldowns[player] then
		cooldowns[player][name] = nil
	end
end

return remove_cooldown
