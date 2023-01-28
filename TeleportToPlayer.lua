--Pitulec#2060

targetUsername = ""




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
    size = Vector2.new(390, 460), -- Window size, accepts UDim2s and Vector2s
    position = nil -- Custom position, defaults to roughly the bottom right corner
})
local menu = window:addMenu({
    text = 'All' -- Title of menu
})
local section = menu:addSection({
    text = 'Speed', -- Title of section
    side = 'left', -- Side of the menu that the section is placed on. Defaults to 'auto', but can be 'left' or 'right'
    showMinButton = true, -- Ability to minimize this section. Defaults to true
})
--Toggles an sliders
do
    section:addTextbox({
        text = 'User'}):bindToEvent('onFocusLost', function(text) 
            ui.notify({
            title = "Username Set to",
            message = text,
            duration = 4
        })
        targetUsername = text
    end)
end
do
    section:addButton({
        text = 'Teleport', 
        style = 'small' -- style of the button, can be 'large' or 'small'
    }):bindToEvent('onClick', function() -- Call a function when clicked
        players = game:GetService("Players")
        targetPlayer = players:FindFirstChild(targetUsername)
        players.LocalPlayer.Character:MoveTo(targetPlayer.Character.HumanoidRootPart.Position)
    end)
end