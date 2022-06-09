local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))() -- Load Kavo Library

local Window = Library.CreateLib("ALCATRAZ - v1.0.2", "DarkTheme") -- Theme and Title

local Aim = Window:NewTab("Aimbot") -- Aimbot Tab
local SilentAims = Aim:NewSection("Silent Aim")
local FOVs = Aim:NewSection("FOV")

local Mods = Window:NewTab("Mods") -- Mods Tab
local PlayerModss = Mods:NewSection("Player Mods")
local GunModss = Mods:NewSection("Gun Mods")

local Credits = Window:NewTab("Extras")
local Creditss = Credits:NewSection("Credits")
local UIs = Credits:NewSection("UI Settings")

do
    local fov_circle = Drawing.new("Circle")
    fov_circle.Thickness = 1
    fov_circle.NumSides = 100
    fov_circle.Radius = 180
    fov_circle.Filled = false
    fov_circle.Visible = false
    fov_circle.ZIndex = 999
    fov_circle.Transparency = 1
    fov_circle.Color = Color3.fromRGB(255, 255, 255)
    
    task.spawn(function()
        while true do
            fov_circle.Position = get_mouse_pos() + Vector2.new(0, 36)
            task.wait()
        end
    end)

SilentAims:NewToggle("Silent Aim", "Toggles Silent Aim. Silent Aim will redirect your bullets to hit a certain part of an enemies body.", function(state)
    config.aimbot.silent_aim = state
end)

SilentAims:NewSlider("Hit Chance", "Changes how many percent of your bullets will hit the enemy player.", 100, 0, function(s)
    config.aimbot.hit_chance = state
end)

Section:NewDropdown("Hit Part", "Changes where your bullets will hit the enemy player.", {"Head", "Torso"}, function(currentOption)
    print(currentOption)
    
    config.aimbot.target_part = state
end)

FOVs:NewToggle("FOV Toggle", "Toggles Silent Aim FOV. Only hits enemies within the FOV circle.", function(state)
    config.aimbot.field_of_view = state
end)

FOVs:NewSlider("FOV Radius", "Changes the FOV radius (size).", 360, 0, function(s)
    config.aimbot.field_of_view_range = state
    fov_circle.Radius = state
end)

FOVs:NewColorPicker("FOV Color", "Changes the color of the FOV circle.", Color3.fromRGB(0,0,0), function(color)
    print(color)
    fov_circle.Color = state
end)

FOVs:NewToggle("FOV visible", "Changes whether your FOV circle is visible to you or not.", function(state)
    fov_circle.Visible = state
end)

FOVs:NewToggle("FOV Fill", "Changes whether your FOV circle is filled or not.", function(state)
    fov_circle.Filled = state
end)

FOVs:NewSlider("FOV Transparency", "Changes the Transparency of your FOV circle.", 1, 0, function(s)
    fov_circle.Transparency = state
end)
end
do
PlayerModss:NewToggle("Walkspeed", "Changes how fast you walk. (Default = 16)", function(state)
    config.character.walkspeed = state
end)

PlayerModss:NewToggle("Jumpower", "Changes how high you jump. (Default = 50)", function(state)
    config.character.jumppower = state
end)

PlayerModss:NewToggle("Auto Deploy", "Automatically will deploy you into the game.", function(state)
    config.character.auto_deploy = state
end)

PlayerModss:NewToggle("Fake Lag", "Lags the whole server.", function(state)
    config.character.fake_lag = state
end)

PlayerModss:NewSlider("Walkspeed", "Amount of speed your character has.", 250, 0, function(s) -- 500 (MaxValue) | 0 (MinValue)
    set_speed(state)
end)

PlayerModss:NewSlider("Jumpower", "Amount of Jump Power your character has.", 250, 0, function(s) -- 500 (MaxValue) | 0 (MinValue)
    set_jump_power(state)
end)

PlayerModss:NewSlider("Fake Lag", "Amount of fake lag the server has.", 250, 0, function(s) -- 500 (MaxValue) | 0 (MinValue)
    config.character.fake_lag_limit = state
end)

PlayerModss:NewToggle("Anti Aim", "Fakes your stance in-game to trick enemies.", function(state)
    config.character.antiaim = state
end)

PlayerModss:NewDropdown("Anti Aim Stance", "What stance to use for anti aim.", {"Prone", "Crouch", "Stand"}, function(currentOption)
    print(currentOption)
    config.character.antiaim_stance = state
end)

GunModss:NewToggle("Instant Reload", "Instantly reloads your gun.", function(state)
    config.gunmod.fast_reload = state
end)

GunModss:NewToggle("Instant Equip", "Instantly Equips your weapon of choice.", function(state)
    config.gunmod.fast_reload = state
end)
end
do
UIs:NewKeybind("Press P to toggle the UI.", "hides/shows the UI", Enum.KeyCode.P, function()
	Library:ToggleUI()
end)

Credits:NewLabel("Made By Payson Holmes")
Credits:NewLabel("FOR PHANTOM FORCES ONLY!")
end
game:GetService("StarterGui"):SetCore("SendNotification",{
Title = "ALCATRAZ - v1.0.2",
Text = "Made By Payson Holmes", 
Duration = 8 
})
game:GetService("StarterGui"):SetCore("SendNotification",{
    Title = "Support",
    Text = "https://dsc.gg/PDennSploit", 
    Duration = 8 
    })
print("=========================")
print("ALCATRAZ By Payson Holmes")
print("=========================")

if game.PlaceId == 292439477
then game:GetService("StarterGui"):SetCore("SendNotification",{
    Title = "Script Loaded",
    Text = "Supported Game Found: Phantom Forces", 
    Duration = 3 
    })
else
game:GetService("StarterGui"):SetCore("SendNotification",{
    Title = "!!!UNSUPPORTED GAME!!!",
    Text = "This script was designed for Phantom Forces. ALCATRAZ may not work in your game.", 
    Duration = 10 
    })

end
