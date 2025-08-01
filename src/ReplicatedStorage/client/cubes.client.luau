local UserInputService = game:GetService("UserInputService")

local place_cube = require(script.Parent.modules.place_cube)

local function on_input_began(input: InputObject): ()
	if input.UserInputType ~= Enum.UserInputType.MouseButton1 then
		return
	end

	place_cube()
end

UserInputService.InputBegan:Connect(on_input_began)
