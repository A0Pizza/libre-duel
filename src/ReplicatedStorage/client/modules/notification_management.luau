local ReplicatedStorage = game:GetService("ReplicatedStorage")

local signal = require(ReplicatedStorage.vendor.signal)

export type notification = {
	id: number,
	message: string,
	created_at: number,
}

local current_id = 0
local existing_notifications: {notification} = {}
local on_change = signal.new()

local function notification_add(message: string): ()
	current_id += 1
	
	local new_notification: notification = {
		id = current_id,
		message = message,
		created_at = tick()
	}

	table.insert(existing_notifications, new_notification)
	on_change:Fire()
end

local function notification_remove(index: number): ()
	assert(existing_notifications[index] ~= nil, `Index "{index}" is nil.`)
	table.remove(existing_notifications, index)
	on_change:Fire()
end

local notification_management = {
	add = notification_add,
	on_change = on_change,
	existing = existing_notifications,
	remove = notification_remove,
}

return notification_management
