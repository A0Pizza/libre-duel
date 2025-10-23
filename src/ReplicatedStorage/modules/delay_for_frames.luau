local RunService = game:GetService("RunService")

local function delay_for_frames(frames: number?, callback: () -> ()): ()
	task.spawn(function()
		local frames_value = frames or 1
		for _ = 1, frames_value do
			RunService.Heartbeat:Wait()
		end
		callback()
	end)
end

return delay_for_frames
