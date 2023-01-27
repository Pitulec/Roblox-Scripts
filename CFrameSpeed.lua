--Pitulec#2060
getgenv().cframespeedtoggle = false
getgenv().cframespeedslider = 1
game:GetService("RunService").Heartbeat:Connect(
    function()
        if getgenv().cframespeedtoggle == true then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame +
                game.Players.LocalPlayer.Character.Humanoid.MoveDirection * getgenv().cframespeedslider / 100
end
end)

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
        text = 'CFrameSpeed', 
        state = false -- Starting state of the toggle - doesn't automatically call the callback
    })
    toggle:bindToEvent('onToggle', function(newState) -- Call a function when toggled
        ui.notify({
            title = 'toggle',
            message = 'Toggle was toggled to ' .. tostring(newState),
            duration = 3
        })
     getgenv().cframespeedtoggle = newState
    end)
end
do
section:addSlider({
    text = 'Walkspeed',
    min = 1,
    max = 15,
    step = 1,
    val = 1
}, function(newState) 
    getgenv().cframespeedslider = newState
end)
end