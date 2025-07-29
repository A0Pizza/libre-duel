local sounds = {
    block_place = {2164165859, 6586979979}, --multiple sounds can be added for variety
    player_damaged = {6586979979},
    player_killed = {696969},
}
--[[

placeholder sounds for now
if anyone has some better sounds that can be used here, please submit a pull request

--]]

local function play_sound(sound)
    local soundlist = sounds[sound]
    local soundid = soundlist and soundlist[math.random(1, #soundlist)]
    assert(soundlist, "Sound list cannot be nil.")
    assert(soundid, "Sound ID cannot be nil.")
    local instance = Instance.new("Sound")
    instance.Parent = game:WaitForChild("SoundService")
    instance.PlayOnRemove = true
    instance.SoundId = `rbxassetid://{soundid}`
    instance:Destroy()
end

return play_sound