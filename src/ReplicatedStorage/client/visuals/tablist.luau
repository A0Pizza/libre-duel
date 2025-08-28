local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")

local React = require(ReplicatedStorage.vendor.ReactLua.React)

local create_element = React.createElement
local local_player = Players.LocalPlayer
local use_effect = React.useEffect
local use_state = React.useState

local function title()
	return create_element("TextLabel", {
		AnchorPoint = Vector2.new(0.5, 1),
		Size = UDim2.new(1, 0, 0, 40),
		Position = UDim2.fromScale(0.5, 0),
		FontFace = Font.fromId(11702779409, Enum.FontWeight.Regular),
		BackgroundTransparency = 1,
		TextSize = 40,
		RichText = true,
		TextYAlignment = "Top",
		Text = '<font color="#b14c4e">Libre</font> <font color="#0da2dd">Duel</font>',
	})
end

local function player_card(props: {
	colour: Color3,
	image: string,
	name: string,
})
	return create_element("TextLabel", {
		BackgroundColor3 = Color3.fromRGB(0, 0, 0),
		BackgroundTransparency = 0.7,
		FontFace = Font.fromId(11702779409, Enum.FontWeight.Regular),
		TextColor3 = props.colour,
		TextScaled = true,
		Size = UDim2.new(0.5, -5, 0, 38),
		TextXAlignment = "Left",
		Text = props.name,
	},
		create_element("UIPadding",{
			PaddingLeft = UDim.new(0, 40),
			PaddingRight = UDim.new(0, 5),
		}),
		create_element("UICorner",{
			CornerRadius = UDim.new(0, 50),
		}),
		create_element("UIStroke",{
			Color = Color3.fromRGB(255, 255, 255),
			ApplyStrokeMode = "Border",
			Thickness = 2,
		},
			create_element("UIGradient",{
				Color = ColorSequence.new({
					ColorSequenceKeypoint.new(0, props.colour),
					ColorSequenceKeypoint.new(1, Color3.fromRGB(70, 70, 70)),
				}),
				Rotation = -90,
			})
		),
		create_element("ImageLabel",{
			Position = UDim2.fromOffset(-40, 0),
			BackgroundTransparency = 1,
			Size = UDim2.fromOffset(38, 38),
			Image = props.image,
		},
			create_element("UICorner",{
				CornerRadius = UDim.new(1, 0),
			})
		)
	)
end

local function player_list(props: {
	cards: {
		{
			colour: Color3,
			id: number,
			image: string,
			name: string,
		}
	}
})
	local cards = {}
	for index, card in props.cards do
		cards[index] = create_element(player_card, {
			key = card.id,
			colour = card.colour,
			image = card.image,
			name = card.name
		})
	end

	return create_element("Folder", {},
		create_element("UIListLayout", {
			Padding = UDim.new(0, 10),
			FillDirection = "Horizontal",
			SortOrder = "LayoutOrder",
			Wraps = true,
		}),
		cards
	)
end

local PLAYERS = {
	{
		colour = Color3.fromRGB(177, 76, 78),
		id = 1,
		image = "rbxassetid://94738928346033",
		name = "Player1",
	},
	{
		colour = Color3.fromRGB(13, 162, 221),
		id = 2,
		image = "rbxassetid://94738928346033",
		name = "Player2",
	},
	{
		colour = Color3.fromRGB(201, 201, 201),
		id = 3,
		image = "rbxassetid://94738928346033",
		name = "Player3",
	},
}

local function use_ping()
	local ping, set_ping = use_state(0)

	use_effect(function()
		local function on_heartbeat()
			set_ping(local_player:GetNetworkPing())
		end

		local connection = RunService.Heartbeat:Connect(on_heartbeat)

		local function destroy()
			connection:Disconnect()
		end

		return destroy
	end, {})

	return ping
end

local function ping_display()
	local ping = use_ping()

	return create_element("TextLabel", {
		BackgroundTransparency = 1,
		Position = UDim2.fromScale(0.5, 1),
		FontFace = Font.fromId(11702779409, Enum.FontWeight.Regular),
		TextColor3 = Color3.fromRGB(133, 221, 50),
		TextSize = 40,
		Size = UDim2.new(0.5, 0, 0, 40),
		Text = `Ping: {math.round(ping * 1000)} ms`,
	})
end

local function location()
	return create_element("TextLabel", {
		BackgroundTransparency = 1,
		Position = UDim2.fromScale(0, 1),
		FontFace = Font.fromId(11702779409, Enum.FontWeight.Regular),
		TextColor3 = Color3.fromRGB(255, 255, 255),
		TextSize = 40,
		Size = UDim2.new(0.5, 0, 0, 40),
		Text = "Paris, France",
	})
end

local function tablist()
	return create_element("ScreenGui", {
		ScreenInsets = "None",
	},
		create_element("Frame", {
			AnchorPoint = Vector2.new(0.5, 0),
			Position = UDim2.new(0.5, 0, 0, 147),
			Size = UDim2.fromOffset(720, 172),
			BackgroundColor3 = Color3.fromRGB(0, 0, 0),
			BackgroundTransparency = 0.5,
		},
			create_element("UICorner",{
				CornerRadius = UDim.new(0, 30),
			}),
			create_element("UIPadding",{
				PaddingBottom = UDim.new(0, 40),
				PaddingLeft = UDim.new(0, 10),
				PaddingRight = UDim.new(0, 10),
				PaddingTop = UDim.new(0, 40),
			}),
			create_element("UIStroke",{
				Thickness = 2,
				Color = Color3.fromRGB(255, 255, 255),
				ApplyStrokeMode = "Border",
			},
				create_element("UIGradient",{
					Color = ColorSequence.new({
						ColorSequenceKeypoint.new(0, Color3.fromRGB(134, 134, 134)),
						ColorSequenceKeypoint.new(1, Color3.fromRGB(70, 70, 70)),
					}),
					Rotation = -90,
				})
			),
			create_element(title),
			create_element(player_list, {
				cards = PLAYERS
			}),
			create_element(location),
			create_element(ping_display)
		)
	)
end

return tablist
