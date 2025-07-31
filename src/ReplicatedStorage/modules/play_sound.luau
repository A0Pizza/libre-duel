local sounds = {
    block_place = {2164165859, 6586979979}, --multiple sounds can be added for variety
    player_damaged = {6586979979},
    player_killed = {696969},
}
--[[

placeholder sounds for now
if anyone has some better sounds that can be used here, please submit a pull request

--]]

local function play_sound(name: string, position: Vector3): ()
    local list = sounds[name]
    local id = list and list[math.random(1, #list)]
    assert(list, "Sound list cannot be nil.")
    assert(id, "Sound ID cannot be nil.")

    local part = Instance.new("Part")
    local sound = Instance.new("Sound")

    part.Parent = game:WaitForChild("Workspace")
    sound.Parent = part

    print(position)
    part.Position = position
    sound.PlayOnRemove = true
    sound.SoundId = `rbxassetid://{id}`

    part:Destroy()
end

return play_sound