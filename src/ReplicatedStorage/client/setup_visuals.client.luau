local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local React = require(ReplicatedStorage.vendor.ReactLua.React)
local ReactRoblox = require(ReplicatedStorage.vendor.ReactLua.ReactRoblox)
local hotbar = require(script.Parent.visuals.hotbar)

local local_player = Players.LocalPlayer
local player_gui = local_player:WaitForChild("PlayerGui") :: PlayerGui

local tree = ReactRoblox.createRoot(Instance.new("Folder"))
tree:render(ReactRoblox.createPortal(React.createElement(hotbar), player_gui))