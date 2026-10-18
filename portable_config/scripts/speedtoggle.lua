local mp = require 'mp'
local last_speed = 1.0
local normal_speed = 1.0

local function toggle_speed()
    local current = mp.get_property_number("speed", 1.0)
    if math.abs(current - normal_speed) < 0.01 then
        mp.set_property_number("speed", last_speed)
        mp.osd_message("Speed: " .. last_speed .. "x")
    else
        last_speed = current
        mp.set_property_number("speed", normal_speed)
        mp.osd_message("Speed: " .. normal_speed .. "x")
    end
end

mp.add_key_binding("z", "toggle-speed", toggle_speed)
