local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")

local notification_management = require(script.Parent.Parent.modules.notification_management)
local React = require(ReplicatedStorage.vendor.ReactLua.React)

local create_element = React.createElement
type notification = notification_management.notification
local use_effect = React.useEffect
local use_state = React.useState

local lifetime_until_fade = 3
local fade_duration = 0.5
local lifetime_total = lifetime_until_fade + fade_duration

local function use_fade_out(created_at: number): number
	local transparency, set_transparency = use_state(0)
	
	local function effect_fade_out()
		local time_since_creation = tick() - created_at
		local time_until_fade = lifetime_until_fade - time_since_creation
		
		local function thread_fade(): ()
			local time_since_start_fading = 0

			if time_until_fade > 0 then
				local time_waited = task.wait(time_until_fade)
				time_since_start_fading += time_waited
			end

			while true do
				local new_transparency = time_since_start_fading / fade_duration
				set_transparency(new_transparency)

				local time_waited = task.wait()
				time_since_start_fading += time_waited
			end
		end

		local task_fade = task.spawn(thread_fade)
		
		local function disconnect(): ()
			task.cancel(task_fade)
		end

		return disconnect
	end
	
	use_effect(effect_fade_out, {})

	return transparency
end

local function notification_component(props: {
	notification: notification,
	index: number,
})
	local notification = props.notification
	local index = props.index
	
	local transparency = use_fade_out(notification.created_at)
	
	return create_element("Frame", {
		Size = UDim2.new(1, 0, 0, 26), -- Slightly bigger from 22 to 26
		Position = UDim2.new(0, 0, 1, -(index * 30)),
		AnchorPoint = Vector2.new(0, 1),
		BackgroundColor3 = Color3.fromRGB(0, 0, 0),
		BackgroundTransparency = 0.5 + (transparency * 0.5),
	}, {
		create_element("UICorner", { CornerRadius = UDim.new(0, 13) }),
		create_element("UIStroke", {
			Thickness = 1,
			Color = Color3.fromRGB(255, 255, 255),
			ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
			Transparency = transparency,
		}, {
			create_element("UIGradient", {
				Color = ColorSequence.new({
					ColorSequenceKeypoint.new(0, Color3.fromRGB(134, 134, 134)),
					ColorSequenceKeypoint.new(1, Color3.fromRGB(70, 70, 70)),
				}),
				Rotation = -90,
			}),
		}),
		create_element("UIPadding", {
			PaddingTop = UDim.new(0, 2),
			PaddingBottom = UDim.new(0, 2),
			PaddingLeft = UDim.new(0, 2),
			PaddingRight = UDim.new(0, 2),
		}),
		
		create_element("TextLabel", {
			Size = UDim2.new(1, 0, 1, 0),
			BackgroundTransparency = 1,
			FontFace = Font.fromId(11702779409, Enum.FontWeight.Regular),
			TextSize = 15, -- Slightly bigger from 14 to 15
			Text = notification.message,
			TextColor3 = Color3.fromRGB(255, 255, 255),
			TextXAlignment = Enum.TextXAlignment.Center,
			TextYAlignment = Enum.TextYAlignment.Center,
			TextScaled = false,
			TextTransparency = transparency,
			RichText = true,
		}),
	} :: {any})
end

local function use_notifications(): {notification}
	local notifications, set_notifications = use_state({} :: {notification})

	local function effect_notifications()
		local function on_fire()
			set_notifications(table.clone(notification_management.existing))
		end

		local connection = notification_management.on_change:Connect(on_fire)

		local function disconnect(): ()
			connection:Disconnect()
		end

		return disconnect
	end

	use_effect(effect_notifications, {})

	return notifications
end

local function notifications_container()
	local notifications = use_notifications()
	
	local notification_elements = {}
	local notifications_length = #notifications
	for index, notification in notifications do
		local display_order = notifications_length - index + 1 -- Convert to bottom-up index
		table.insert(notification_elements, create_element(notification_component, {
			key = notification.id,
			notification = notification,
			index = display_order,
		}))
	end
	
	return create_element("ScreenGui", {
		ScreenInsets = "None",
		ResetOnSpawn = false,
		ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
	}, {
		create_element("Frame", {
			AnchorPoint = Vector2.new(0, 1),
			Position = UDim2.new(0, 15, 1, -15),
			Size = UDim2.new(0, 240, 0, 180),
			BackgroundTransparency = 1,
		}, notification_elements)
	})
end

local function cleanup_notifications(): ()
	local current_time = tick()

	for index, notification in notification_management.existing do
		if current_time - notification.created_at >= lifetime_total then
			notification_management.remove(index)
		end
	end
end

RunService.Heartbeat:Connect(cleanup_notifications)

return notifications_container
