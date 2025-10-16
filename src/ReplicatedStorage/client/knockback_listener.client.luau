local ReplicatedStorage = game:GetService("ReplicatedStorage")

local apply_knockback = require(ReplicatedStorage.modules.apply_knockback)

local apply_client_knockback = ReplicatedStorage.remotes.apply_client_knockback

local debug_print = require(script.Parent.modules.debug_print)

local function knockback_received(source, target, strength, constant_strength)
    apply_knockback(source, target, strength, constant_strength)
end

apply_client_knockback.OnClientEvent:Connect(knockback_received)
