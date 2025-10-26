-- perceived brightness is basically the measurement of brightness that looks the most accurate to the human eye
-- https://en.wikipedia.org/wiki/Lightness

local function srgb_to_linear(colour_channel)
    if colour_channel <= 0.04045 then
        return colour_channel / 12.92
    else
        return math.pow((colour_channel + 0.055) / 1.055, 2.4)
    end
end

local function luminance_to_l_star(luminance)
    if luminance <= 216 / 24389 then
        return luminance * (24389 / 27)
    else
        return math.pow(luminance, 1/3) * 116 - 16
    end
end

local function get_perceived_brightness(colour)
    local r, g, b = colour.R, colour.G, colour.B
    local luminance = 0.2126 * srgb_to_linear(r) + 0.7152 * srgb_to_linear(g) + 0.0722 * srgb_to_linear(b)
    return luminance_to_l_star(luminance)
end

return get_perceived_brightness
