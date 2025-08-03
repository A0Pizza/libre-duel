local UserInputService = game:GetService("UserInputService")

local keybinds = require(script.Parent.keybinds)

local debug_enabled = false

local function debug_print(...: any): ()
	if debug_enabled then
		local source = debug.info(2, "s")
		print(source, ...)
	end
end

local function on_input_began(input: InputObject): ()
	if input.KeyCode == keybinds.debug then
		debug_enabled = not debug_enabled
	end
end

UserInputService.InputBegan:Connect(on_input_began)

return debug_print
