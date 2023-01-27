--Pitulec#2060

--GUI
local uiLoader = loadstring(game:HttpGet('https://raw.githubusercontent.com/topitbopit/dollarware/main/library.lua'))
local ui = uiLoader({
    rounding = true, -- Whether certain features get rounded 
    theme = 'orange', -- The theme. Available themes are: cherry, orange, lemon, lime, raspberry, blueberry, grape, watermelon
    smoothDragging = true -- Smooth dragging
})
ui.autoDisableToggles = true -- All toggles will automatically be disabled when the ui is destroyed (window is closed)

--Tabs
local window = ui.newWindow({
    text = '$ Pitulec.lua $', -- Title of window 
    resize = true, -- Ability to resize
    size = Vector2.new(550, 376), -- Window size, accepts UDim2s and Vector2s
    position = nil -- Custom position, defaults to roughly the bottom right corner
})
local menu = window:addMenu({
    text = 'All' -- Title of menu
})
local section = menu:addSection({
    text = 'All', -- Title of section
    side = 'left', -- Side of the menu that the section is placed on. Defaults to 'auto', but can be 'left' or 'right'
    showMinButton = true, -- Ability to minimize this section. Defaults to true
})
--Toggles an sliders
do 
    local toggle = section:addToggle({
        text = 'Box', 
        state = false -- Starting state of the toggle - doesn't automatically call the callback
    })
    toggle:bindToEvent('onToggle', function(newState) -- Call a function when toggled
       getgenv().WallHack.Visuals.BoxSettings.Enabled = newState
    end)
end
do 
    local toggle = section:addToggle({
        text = 'Tracer', 
        state = false -- Starting state of the toggle - doesn't automatically call the callback
    })
    toggle:bindToEvent('onToggle', function(newState) -- Call a function when toggled
       getgenv().WallHack.Visuals.TracersSettings.Enabled = newState
    end)
end
do 
    local toggle = section:addToggle({
        text = 'Distance', 
        state = false -- Starting state of the toggle - doesn't automatically call the callback
    })
    toggle:bindToEvent('onToggle', function(newState) -- Call a function when toggled
        getgenv().WallHack.Visuals.ESPSettings.DisplayDistance = newState

    end)
    
end
do 
    local toggle = section:addToggle({
        text = 'Health', 
        state = false -- Starting state of the toggle - doesn't automatically call the callback
    })
    toggle:bindToEvent('onToggle', function(newState) -- Call a function when toggled
        getgenv().WallHack.Visuals.ESPSettings.DisplayHealth = newState

    end)
end
do 
    local toggle = section:addToggle({
        text = 'Name', 
        state = false -- Starting state of the toggle - doesn't automatically call the callback
    })
    toggle:bindToEvent('onToggle', function(newState) -- Call a function when toggled
        getgenv().WallHack.Visuals.ESPSettings.DisplayName = newState

    end)
end

--ESP
loadstring(game:HttpGet("https://raw.githubusercontent.com/fajkaa/Wall/main/Resources/Scripts/Main.lua"))()
getgenv().WallHack.Visuals = {
    ESPSettings = {
        Enabled = true,
        TextColor = "224, 123, 0",
        TextSize = 20,
        Center = true,
        Outline = false,
        OutlineColor = "224, 123, 0",
        TextTransparency = 1,
        TextFont = Drawing.Fonts.Plex, -- UI, System, Plex, Monospace
        DisplayDistance = false,
        DisplayHealth = false,
        DisplayName = false
    },

    TracersSettings = {
        Enabled = false,
        Type = 1, -- 1 - Bottom; 2 - Center; 3 - Mouse
        Transparency = 1,
        Thickness = 1,
        Color = "224, 123, 0",
    },

    BoxSettings = {
        Enabled = false,
        Type = 2; -- 1 - 3D; 2 - 2D;
        Color = "224, 123, 0",
        Transparency = 1,
        Thickness = 1,
        Filled = false, -- For 2D
        Increase = 1
    },

    HeadDotSettings = {
        Enabled = false,
        Color = "224, 123, 0",
        Transparency = 0.5,
        Thickness = 1,
        Filled = false,
        Sides = 30,
        Size = 2
    }
}

getgenv().WallHack.Crosshair = {
  CrosshairSettings = {
    Enabled = false,
    Type = 2, -- 1 - Mouse; 2 - Center
    Size = 1,
    Thickness = 0.0001,
    Color = "224, 123, 0",
    Transparency = 0.001,
    GapSize = 0,
    CenterDot = false,
    CenterDotColor = "224, 123, 0",
    CenterDotSize = 1,
    CenterDotTransparency = 1,
    CenterDotFilled = false
  },
}

getgenv().WallHack.Settings = {
    SendNotifications = false,
    SaveSettings = false, -- Re-execute upon changing
    ReloadOnTeleport = false,
    Enabled = true,
    TeamCheck = false,
    AliveCheck = false
}