--// SERVICES
local player = game.Players.LocalPlayer
local gui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))

gui.Name = "JekakTradeUI"
gui.ResetOnSpawn = false

--// LOADING SCREEN
local loadingFrame = Instance.new("Frame", gui)
loadingFrame.Size = UDim2.new(1,0,1,0)
loadingFrame.BackgroundColor3 = Color3.fromRGB(10,10,10)

local loadingText = Instance.new("TextLabel", loadingFrame)
loadingText.Size = UDim2.new(1,0,0.1,0)
loadingText.Position = UDim2.new(0,0,0.4,0)
loadingText.BackgroundTransparency = 1
loadingText.TextColor3 = Color3.fromRGB(0,255,200)
loadingText.TextScaled = true
loadingText.Font = Enum.Font.GothamBold
loadingText.Text = "Jekak Trade Script\n0%"

-- loading animation 5 detik
for i = 0,100 do
    loadingText.Text = "Jekak Trade Script\n"..i.."%"
    task.wait(0.05) -- 100 x 0.05 = 5 detik
end

loadingFrame:Destroy()

--// OPEN BUTTON
local openBtn = Instance.new("TextButton", gui)
openBtn.Size = UDim2.new(0,120,0,40)
openBtn.Position = UDim2.new(0,10,0.5,0)
openBtn.Text = "OPEN"
openBtn.BackgroundColor3 = Color3.fromRGB(20,20,20)
openBtn.TextColor3 = Color3.fromRGB(0,255,200)
openBtn.Font = Enum.Font.GothamBold
openBtn.TextScaled = true

-- neon stroke
local stroke = Instance.new("UIStroke", openBtn)
stroke.Color = Color3.fromRGB(0,255,200)
stroke.Thickness = 2

--// MAIN MENU
local mainFrame = Instance.new("Frame", gui)
mainFrame.Size = UDim2.new(0,300,0,220)
mainFrame.Position = UDim2.new(0.5,-150,0.5,-110)
mainFrame.BackgroundColor3 = Color3.fromRGB(15,15,15)
mainFrame.Visible = false

local mainStroke = Instance.new("UIStroke", mainFrame)
mainStroke.Color = Color3.fromRGB(0,255,200)
mainStroke.Thickness = 2

-- TITLE
local title = Instance.new("TextLabel", mainFrame)
title.Size = UDim2.new(1,0,0,40)
title.BackgroundTransparency = 1
title.Text = "Jekak Trade Script"
title.TextColor3 = Color3.fromRGB(0,255,200)
title.Font = Enum.Font.GothamBold
title.TextScaled = true

-- CLOSE BUTTON
local closeBtn = Instance.new("TextButton", mainFrame)
closeBtn.Size = UDim2.new(0,30,0,30)
closeBtn.Position = UDim2.new(1,-35,0,5)
closeBtn.Text = "X"
closeBtn.BackgroundColor3 = Color3.fromRGB(20,20,20)
closeBtn.TextColor3 = Color3.fromRGB(255,50,50)
closeBtn.Font = Enum.Font.GothamBold

--// BUTTON 1 (Freeze Trade)
local freezeBtn = Instance.new("TextButton", mainFrame)
freezeBtn.Size = UDim2.new(0.9,0,0,50)
freezeBtn.Position = UDim2.new(0.05,0,0.3,0)
freezeBtn.Text = "Freeze Trade"
freezeBtn.BackgroundColor3 = Color3.fromRGB(20,20,20)
freezeBtn.TextColor3 = Color3.fromRGB(0,255,200)
freezeBtn.Font = Enum.Font.GothamBold
freezeBtn.TextScaled = true

local freezeDesc = Instance.new("TextLabel", freezeBtn)
freezeDesc.Size = UDim2.new(1,0,0,15)
freezeDesc.Position = UDim2.new(0,0,1,0)
freezeDesc.BackgroundTransparency = 1
freezeDesc.Text = "Freeze Victim's Trade UI"
freezeDesc.TextColor3 = Color3.fromRGB(150,150,150)
freezeDesc.TextScaled = true

--// BUTTON 2 (Force Accept)
local acceptBtn = Instance.new("TextButton", mainFrame)
acceptBtn.Size = UDim2.new(0.9,0,0,50)
acceptBtn.Position = UDim2.new(0.05,0,0.6,0)
acceptBtn.Text = "Force Accept"
acceptBtn.BackgroundColor3 = Color3.fromRGB(20,20,20)
acceptBtn.TextColor3 = Color3.fromRGB(0,255,200)
acceptBtn.Font = Enum.Font.GothamBold
acceptBtn.TextScaled = true

local acceptDesc = Instance.new("TextLabel", acceptBtn)
acceptDesc.Size = UDim2.new(1,0,0,15)
acceptDesc.Position = UDim2.new(0,0,1,0)
acceptDesc.BackgroundTransparency = 1
acceptDesc.Text = "Force Accept For Victim's Trade"
acceptDesc.TextColor3 = Color3.fromRGB(150,150,150)
acceptDesc.TextScaled = true

--// POPUP FUNCTION
local function showPopup(text)
    local popup = Instance.new("TextLabel", gui)
    popup.Size = UDim2.new(0,250,0,50)
    popup.Position = UDim2.new(0.5,-125,0.8,0)
    popup.BackgroundColor3 = Color3.fromRGB(20,20,20)
    popup.TextColor3 = Color3.fromRGB(0,255,200)
    popup.Font = Enum.Font.GothamBold
    popup.TextScaled = true
    popup.Text = text

    local pStroke = Instance.new("UIStroke", popup)
    pStroke.Color = Color3.fromRGB(0,255,200)

    task.wait(2)
    popup:Destroy()
end

--// BUTTON ACTIONS (UI ONLY)
freezeBtn.MouseButton1Click:Connect(function()
    showPopup("Freeze Trade Success!")
end)

acceptBtn.MouseButton1Click:Connect(function()
    showPopup("Victim Accepted The Trade Forcly!")
end)

--// OPEN/CLOSE LOGIC
openBtn.MouseButton1Click:Connect(function()
    mainFrame.Visible = not mainFrame.Visible
end)

closeBtn.MouseButton1Click:Connect(function()
    mainFrame.Visible = false
end)
