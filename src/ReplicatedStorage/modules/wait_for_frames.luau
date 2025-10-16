local RunService = game:GetService("RunService")

local function wait_for_frames(frames)
    frames = frames or 1
    for _ = 1, frames do
        RunService.Heartbeat:Wait()
    end
end

return wait_for_frames
