local wait_for_frames = require(script.Parent.wait_for_frames)

local function delay_for_frames(frames: number, callback: () -> ())
	task.spawn(function()
		wait_for_frames(frames)
		callback()
	end)
end

return delay_for_frames
