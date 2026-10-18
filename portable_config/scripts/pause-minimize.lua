-- اسکریپت توقف پخش هنگام مینیمایز شدن پنجره
local did_minimize = false

mp.observe_property("window-minimized", "bool", function(_, value)
    local pause = mp.get_property_native("pause")
    if value == true then
        if pause == false then
            mp.set_property_native("pause", true)
            did_minimize = true
        end
    elseif value == false then
        if did_minimize and (pause == true) then
            mp.set_property_native("pause", false)
            did_minimize = false
        end
    end
end)
