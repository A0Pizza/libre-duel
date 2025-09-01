local ReplicatedStorage = game:GetService("ReplicatedStorage")

local React = require(ReplicatedStorage.vendor.ReactLua.React)

local create_element = React.createElement

local tablist = require(script.Parent.tablist)
local version = require(script.Parent.version)

local function main()
	return create_element(React.Fragment, {},
		create_element(tablist),
		create_element(version)
	)
end

return main
