local delay_for_frames = require(script.Parent.delay_for_frames)

local function apply_knockback(source, target, strength: number?) --source being, where the knockback came from
    strength = strength or 1
    target:ApplyImpulse(Vector3.new(0, strength * source.Y, 0))
    delay_for_frames(3) --I am doing this because applying all at once would slow down the X and Z knockback due to ground friction. Ok i am done yapping. Peter out
    hrp:ApplyImpulse(Vector3.new(source.X, 0, source.Z) * strength) --be sure to math.clamp your values to avoid some MASSIVE knockback
end
