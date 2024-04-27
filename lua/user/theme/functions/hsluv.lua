-- Function to change hue, saturation, and brightness of a hex color
function HSB(hex, hueOffset, saturationOffset, brightnessOffset)
    hex = hex:gsub("#", "")
    -- Convert hex color to RGB
    local r = tonumber(hex:sub(1, 2), 16)
    local g = tonumber(hex:sub(3, 4), 16)
    local b = tonumber(hex:sub(5, 6), 16)

    -- Convert RGB to HSB (Hue, Saturation, Brightness)
    local max = math.max(r, g, b)
    local min = math.min(r, g, b)
    local delta = max - min

    local hue = 0
    if delta ~= 0 then
        if max == r then
            hue = ((g - b) / delta) % 6
        elseif max == g then
            hue = ((b - r) / delta) + 2
        else
            hue = ((r - g) / delta) + 4
        end
        hue = hue * 60
    end

    local brightness = max / 255
    local saturation = 0
    if max ~= 0 then
        saturation = delta / max
    end

    -- Apply offsets
    hue = (hue + hueOffset) % 360
    saturation = math.max(0, math.min(1, saturation + saturationOffset))
    brightness = math.max(0, math.min(1, brightness + brightnessOffset))

    -- Convert HSB back to RGB
    local c = brightness * saturation
    local x = c * (1 - math.abs((hue / 60) % 2 - 1))
    local m = brightness - c

    local rgb
    if hue < 60 then
        rgb = {c, x, 0}
    elseif hue < 120 then
        rgb = {x, c, 0}
    elseif hue < 180 then
        rgb = {0, c, x}
    elseif hue < 240 then
        rgb = {0, x, c}
    elseif hue < 300 then
        rgb = {x, 0, c}
    else
        rgb = {c, 0, x}
    end

    r = math.floor((rgb[1] + m) * 255)
    g = math.floor((rgb[2] + m) * 255)
    b = math.floor((rgb[3] + m) * 255)

    -- Convert RGB back to hex
    local newHex = string.format("#%02X%02X%02X", r, g, b)
    return newHex
end
