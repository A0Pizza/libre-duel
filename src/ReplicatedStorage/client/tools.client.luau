local UserInputService = game:GetService("UserInputService")

local place_cube = require(script.Parent.modules.place_cube)

type tool = "sword" | "cube"

local tool: tool = "cube"

local function switch_tool(): ()
	if tool == "sword" then
		tool = "cube"
	else
		tool = "sword"
	end
end

local function on_input_began(input: InputObject): ()
	if input.KeyCode == Enum.KeyCode.E then
		switch_tool()
	elseif input.UserInputType == Enum.UserInputType.MouseButton1 then
		if tool == "sword" then

		else
			place_cube()
		end
	end
end

UserInputService.InputBegan:Connect(on_input_began)
