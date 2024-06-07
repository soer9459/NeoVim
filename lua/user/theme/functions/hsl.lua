function HSL(h, s, l)
	-- Helper function to convert hue to RGB
	local function hue_to_rgb(p, q, t)
		if t < 0 then t = t + 1 end
		if t > 1 then t = t - 1 end
		if t < 1/6 then return p + (q - p) * 6 * t end
		if t < 1/2 then return q end
		if t < 2/3 then return p + (q - p) * (2/3 - t) * 6 end
		return p
	end
	-- Normalize the input values
	h = (h % 360) / 360
	s = s / 100
	l = l / 100
	local r, g, b
	if s == 0 then
		-- Achromatic color (gray)
		r = l
		g = l
		b = l
	else
		local q = l < 0.5 and l * (1 + s) or l + s - l * s
		local p = 2 * l - q
		r = hue_to_rgb(p, q, h + 1/3)
		g = hue_to_rgb(p, q, h)
		b = hue_to_rgb(p, q, h - 1/3)
	end
	-- Convert the RGB values to hexadecimal format
	r = math.floor(r * 255)
	g = math.floor(g * 255)
	b = math.floor(b * 255)
	return string.format("#%02x%02x%02x", r, g, b)
end

function HSL_H(hex)
	local function hexToRGB(hex)
		local r = tonumber(hex:sub(2, 3), 16) / 255
		local g = tonumber(hex:sub(4, 5), 16) / 255
		local b = tonumber(hex:sub(6, 7), 16) / 255
		return r, g, b
	end
	local function rgbToHSL(r, g, b)
		local max, min = math.max(r, g, b), math.min(r, g, b)
		local h, s, l = 0, 0, (max + min) / 2
		if max ~= min then
			local d = max - min
			s = l > 0.5 and d / (2 - max - min) or d / (max + min)
			if max == r then
				h = (g - b) / d + (g < b and 6 or 0)
			elseif max == g then
				h = (b - r) / d + 2
			elseif max == b then
				h = (r - g) / d + 4
			end
			h = h / 6
		end
		return h, s, l
	end
	local r, g, b = hexToRGB(hex)
	local h, _, _ = rgbToHSL(r, g, b)
	return string.format("%.0f", h * 360)
end

function HSL_S(hex)
	local function hexToRGB(hex)
		local r = tonumber(hex:sub(2, 3), 16) / 255
		local g = tonumber(hex:sub(4, 5), 16) / 255
		local b = tonumber(hex:sub(6, 7), 16) / 255
		return r, g, b
	end
	local function rgbToHSL(r, g, b)
		local max, min = math.max(r, g, b), math.min(r, g, b)
		local h, s, l = 0, 0, (max + min) / 2
		if max ~= min then
			local d = max - min
			s = l > 0.5 and d / (2 - max - min) or d / (max + min)
			if max == r then
				h = (g - b) / d + (g < b and 6 or 0)
			elseif max == g then
				h = (b - r) / d + 2
			elseif max == b then
				h = (r - g) / d + 4
			end
			h = h / 6
		end
		return h, s, l
	end
	local r, g, b = hexToRGB(hex)
	local _, s, _ = rgbToHSL(r, g, b)
	return string.format("%.0f", s * 100)
end

function HSL_L(hex)
	local function hexToRGB(hex)
		local r = tonumber(hex:sub(2, 3), 16) / 255
		local g = tonumber(hex:sub(4, 5), 16) / 255
		local b = tonumber(hex:sub(6, 7), 16) / 255
		return r, g, b
	end
	local function rgbToHSL(r, g, b)
		local max, min = math.max(r, g, b), math.min(r, g, b)
		local h, s, l = 0, 0, (max + min) / 2
		if max ~= min then
			local d = max - min
			s = l > 0.5 and d / (2 - max - min) or d / (max + min)
			if max == r then
				h = (g - b) / d + (g < b and 6 or 0)
			elseif max == g then
				h = (b - r) / d + 2
			elseif max == b then
				h = (r - g) / d + 4
			end
			h = h / 6
		end
		return h, s, l
	end
	local r, g, b = hexToRGB(hex)
	local _, _, l = rgbToHSL(r, g, b)
	return string.format("%.0f", l * 100)
end
