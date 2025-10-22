local ReplicatedStorage = game:GetService("ReplicatedStorage")

local apply_knockback = require(ReplicatedStorage.modules.apply_knockback)

local add_cooldown = require(ReplicatedStorage.modules.add_cooldown)
local is_on_cooldown = require(ReplicatedStorage.modules.is_on_cooldown)

local play_sound_excluding = require(script.Parent.modules.play_sound_excluding)
local player_range_server = require(script.Parent.modules.player_range_server)

local sword_damage = require(ReplicatedStorage.modules.sword_damage)
local sword_cooldown_server = require(script.Parent.modules.sword_cooldown_server)

local function on_event(player: Player, target_character: unknown): ()
	if typeof(target_character) ~= "Instance" then
		return
	end

	if not target_character:IsA("Model") then
		return
	end

	local target_root = target_character:FindFirstChild("HumanoidRootPart") :: Part?
	if target_root == nil then
		return
	end

	local target_position = target_root.CFrame.Position

	local attacker_character = player.Character
	if attacker_character == nil then
		return
	end

	local attacker_root = attacker_character:FindFirstChild("HumanoidRootPart") :: Part?
	if attacker_root == nil then
		return
	end

	local attacker_position = attacker_root.CFrame.Position
	
	local distance = (target_position - attacker_position).Magnitude
	if distance > player_range_server then
		return
	end

	local target_humanoid = target_character:FindFirstChildOfClass("Humanoid")
	if target_humanoid == nil then
		return
	end
	if attacker_character.Humanoid.Health > 0 and target_humanoid.Health > 0 and is_on_cooldown(player, "attack_melee") == false then --me when the basic sanity checks

		target_humanoid.Health -= sword_damage

		local attack_vector = target_position - attacker_position

		local target_player = game.Players:GetPlayerFromCharacter(target_character)
		apply_knockback(attacker_root, target_root, 1.2, true)

		play_sound_excluding(player, "player_damaged", target_position)

		add_cooldown(player, "attack_melee", sword_cooldown_server)
	end
end

ReplicatedStorage.remotes.attack_player.OnServerEvent:Connect(on_event)
