local Players = game:GetService("Players")

type cooldowns = {
	[Player]: {
		[string]: number
	}
}

local cooldowns: cooldowns = {}

local function on_player_removing(player: Player): ()
	cooldowns[player] = nil
end

Players.PlayerRemoving:Connect(on_player_removing)

return cooldowns
