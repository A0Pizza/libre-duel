local function delay_for_frames(frames: number, callback: () -> ())
	task.spawn(function()
		frames = frames or 1
		for _ = 1, frames do
			RunService.Heartbeat:Wait()
		end
		callback()
	end)
end

return delay_for_frames
