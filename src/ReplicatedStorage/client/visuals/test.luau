local ReplicatedStorage = game:GetService("ReplicatedStorage")

local React = require(ReplicatedStorage.vendor.ReactLua.React)

local create_element = React.createElement

local function main()
	return create_element(
		"ScreenGui",
		{},
		create_element(
			"Frame",
			{
				AnchorPoint = Vector2.new(0.5, 0.5),
				Position = UDim2.fromScale(0.5, 0.5),
				Size = UDim2.fromOffset(300, 200)
			},
			create_element(
				"TextLabel",
				{
					BackgroundColor3 = Color3.new(0.8, 0.8, 1),
					Size = UDim2.fromScale(1, 0.5),
					Text = "Libre Duel",
					TextScaled = true
				}
			)
		)
	)
end

return main