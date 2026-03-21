-- [[ NAXOR OFFICIAL V55.0 - CLEAN WORKING VERSION ]] --

local Players = game:GetService("Players")
local LP = Players.LocalPlayer
local PlayerGui = LP:WaitForChild("PlayerGui")
local UIS = game:GetService("UserInputService")
local TS = game:GetService("TweenService")
local SoundService = game:GetService("SoundService")
local CAS = game:GetService("ContextActionService")

local CustomImageID = "rbxassetid://111311482551281" 

if PlayerGui:FindFirstChild("Naxor_Official_V5") then
    PlayerGui.Naxor_Official_V5:Destroy()
end

-- ScreenGui
local Screen = Instance.new("ScreenGui", PlayerGui)
Screen.Name = "Naxor_Official_V5"
Screen.ResetOnSpawn = false

-- Theme
local Theme = {
    Main = Color3.fromRGB(8, 8, 8), Card = Color3.fromRGB(12, 12, 12), SubBox = Color3.fromRGB(18, 18, 18),
    Accent = Color3.fromRGB(220, 220, 220), Text = Color3.fromRGB(255, 255, 255),
    DarkText = Color3.fromRGB(150, 150, 150), Green = Color3.fromRGB(0, 255, 100)
}

-- Sound Function
local function PlayClickSound()
    local s = Instance.new("Sound", SoundService)
    s.SoundId = "rbxassetid://6518811702"
    s.Volume = 0.8
    s:Play()
    game:GetService("Debris"):AddItem(s, 2)
end

-- Utils
local Utils = {}
function Utils:ApplyNeon(obj, color, thickness)
    local s = Instance.new("UIStroke", obj)
    s.Color = color or Color3.fromRGB(45, 45, 45)
    s.Thickness = thickness or 1.1
    s.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    return s
end

function Utils:MakeDraggable(Frame, Handle)
    local Dragging, DragStart, StartPos = false, nil, nil
    Handle.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            Dragging = true
            DragStart = input.Position
            StartPos = Frame.Position
            CAS:BindAction("BlockDragCamera", function() return Enum.ContextActionResult.Sink end, false, Enum.UserInputType.MouseMovement, Enum.UserInputType.Touch)
        end
    end)
    Handle.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            Dragging = false
            CAS:UnbindAction("BlockDragCamera")
        end
    end)
    UIS.InputChanged:Connect(function(input)
        if Dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
            local Delta = input.Position - DragStart
            Frame.Position = UDim2.new(StartPos.X.Scale, StartPos.X.Offset + Delta.X, StartPos.Y.Scale, StartPos.Y.Offset + Delta.Y)
        end
    end)
end

-- Main Frame
local Main = Instance.new("Frame", Screen)
Main.Size = UDim2.new(0, 560, 0, 390)
Main.Position = UDim2.new(0.5, -280, 0.5, -195)
Main.BackgroundColor3 = Theme.Main
Main.BorderSizePixel = 0
Instance.new("UICorner", Main).CornerRadius = UDim.new(0, 12)
Utils:ApplyNeon(Main, Theme.Accent, 1.8)

-- Header
local Header = Instance.new("Frame", Main)
Header.Size = UDim2.new(1, 0, 0, 65)
Header.BackgroundTransparency = 1
Utils:MakeDraggable(Main, Header)
local Logo = Instance.new("TextLabel", Header)
Logo.RichText = true
Logo.Text = "N.X.R <font color='#DCDCDC'>>>> </font>"
Logo.Size = UDim2.new(0, 150, 1, 0)
Logo.Position = UDim2.new(0, 25, 0, 0)
Logo.BackgroundTransparency = 1
Logo.TextColor3 = Theme.Accent
Logo.TextSize = 22
Logo.Font = "GothamBold"
Logo.TextXAlignment = "Left"

-- Toggle Button
local ToggleBtn = Instance.new("ImageButton", Screen)
ToggleBtn.Size = UDim2.new(0, 52, 0, 52)
ToggleBtn.Position = UDim2.new(0.02, 15, 0.4, 0)
ToggleBtn.BackgroundColor3 = Theme.Card
ToggleBtn.Visible = true -- visible at start
ToggleBtn.ZIndex = 9999
ToggleBtn.Image = CustomImageID
Instance.new("UICorner", ToggleBtn).CornerRadius = UDim.new(1, 0)
Utils:ApplyNeon(ToggleBtn, Theme.Accent, 1.8)
Utils:MakeDraggable(ToggleBtn, ToggleBtn)
ToggleBtn.MouseButton1Click:Connect(function()
    PlayClickSound()
    Main.Visible = true
    ToggleBtn.Visible = false
end)

-- Close Button
local CloseBtn = Instance.new("TextButton", Header)
CloseBtn.Size = UDim2.new(0, 30, 0, 30)
CloseBtn.Position = UDim2.new(1, -45, 0, 17)
CloseBtn.BackgroundTransparency = 1
CloseBtn.Text = "×"
CloseBtn.TextColor3 = Theme.Accent
CloseBtn.TextSize = 28
CloseBtn.Font = "GothamBold"
CloseBtn.MouseButton1Click:Connect(function()
    PlayClickSound()
    Main.Visible = false
    ToggleBtn.Visible = true
end)

-- Pages
local PagesCont = Instance.new("Frame", Main)
PagesCont.Size = UDim2.new(1, 0, 1, -65)
PagesCont.Position = UDim2.new(0, 0, 0, 65)
PagesCont.BackgroundTransparency = 1
local P = { Home = Instance.new("Frame", PagesCont), Scripts = Instance.new("Frame", PagesCont), GameContent = Instance.new("Frame", PagesCont) }
for _, f in pairs(P) do f.Size = UDim2.new(1,0,1,0); f.BackgroundTransparency = 1; f.Visible = false end
P.Home.Visible = true

-- Scripts Page (Game Cards)
local GameList = Instance.new("ScrollingFrame", P.Scripts)
GameList.Size = UDim2.new(1, -40, 1, -20)
GameList.Position = UDim2.new(0, 20, 0, 10)
GameList.BackgroundTransparency = 1
GameList.ScrollBarThickness = 0
GameList.CanvasSize = UDim2.new(0, 0, 0, 0)
local Layout = Instance.new("UIGridLayout", GameList)
Layout.CellPadding = UDim2.new(0, 15, 0, 15)
Layout.CellSize = UDim2.new(0, 160, 0, 100)
Layout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
    GameList.CanvasSize = UDim2.new(0, 0, 0, Layout.AbsoluteContentSize.Y)
end)

-- Game Content Page
local BackBtn = Instance.new("TextButton", P.GameContent)
BackBtn.Size = UDim2.new(0, 80, 0, 30)
BackBtn.Position = UDim2.new(0, 20, 0, 10)
BackBtn.BackgroundColor3 = Theme.SubBox
BackBtn.Text = "← Back"
BackBtn.TextColor3 = Theme.Accent
BackBtn.Font = "GothamBold"
BackBtn.TextSize = 12
Instance.new("UICorner", BackBtn).CornerRadius = UDim.new(0,6)
Utils:ApplyNeon(BackBtn)
BackBtn.MouseButton1Click:Connect(function()
    PlayClickSound()
    P.GameContent.Visible = false
    P.Scripts.Visible = true
end)

local ContentArea = Instance.new("ScrollingFrame", P.GameContent)
ContentArea.Size = UDim2.new(1, -40, 1, -60)
ContentArea.Position = UDim2.new(0, 20, 0, 50)
ContentArea.BackgroundTransparency = 1
ContentArea.ScrollBarThickness = 2
local ContentLayout = Instance.new("UIListLayout", ContentArea)
ContentLayout.Padding = UDim.new(0,10)
ContentLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
    ContentArea.CanvasSize = UDim2.new(0,0,0,ContentLayout.AbsoluteContentSize.Y + 10)
end)

local function ClearContent()
    for _,v in pairs(ContentArea:GetChildren()) do if not v:IsA("UIListLayout") then v:Destroy() end
end

local function AddHackButton(name, callback)
    local btn = Instance.new("TextButton", ContentArea)
    btn.Size = UDim2.new(1, -10, 0, 40)
    btn.BackgroundColor3 = Theme.SubBox
    btn.Text = name
    btn.TextColor3 = Theme.Text
    btn.Font = "GothamBold"
    btn.TextSize = 12
    Instance.new("UICorner", btn).CornerRadius = UDim.new(0,8)
    Utils:ApplyNeon(btn)
    btn.MouseButton1Click:Connect(function()
        PlayClickSound()
        callback()
    end)
end

local function OpenGameMenu(gameName)
    P.Scripts.Visible = false
    P.GameContent.Visible = true
    ClearContent()
    local title = Instance.new("TextLabel", ContentArea)
    title.Size = UDim2.new(1,0,0,30)
    title.BackgroundTransparency = 1
    title.Text = "Hacks for: " .. gameName
    title.TextColor3 = Theme.Accent
    title.Font = "GothamBold"
    title.TextSize = 14

    if gameName == "Blox Fruits" then
        AddHackButton("Auto Farm Level", function() print("Farming...") end)
        AddHackButton("Teleport to Sea 2", function() print("Teleporting...") end)
    elseif gameName == "Brookhaven" then
        AddHackButton("Unlock All Cars", function() print("Unlocked!") end)
    end
end

local function AddGameCard(name, thumbID)
    local card = Instance.new("TextButton", GameList)
    card.Size = UDim2.new(0,160,0,100)
    card.BackgroundColor3 = Theme.Card
    card.Text = ""
    card.AutoButtonColor = false
    Instance.new("UICorner", card).CornerRadius = UDim.new(0,10)
    Utils:ApplyNeon(card)

    local img = Instance.new("ImageLabel", card)
    img.Size = UDim2.new(1,0,0.7,0)
    img.Image = thumbID
    img.BackgroundTransparency = 1
    img.ScaleType = Enum.ScaleType.Crop
    Instance.new("UICorner", img).CornerRadius = UDim.new(0,10)

    local txt = Instance.new("TextLabel", card)
    txt.Size = UDim2.new(1,0,0.3,0)
    txt.Position = UDim2.new(0,0,0.7,0)
    txt.BackgroundTransparency = 1
    txt.Text = name
    txt.TextColor3 = Theme.Text
    txt.Font = "GothamBold"
    txt.TextSize = 10

    card.MouseButton1Click:Connect(function()
        PlayClickSound()
        OpenGameMenu(name)
    end)
end

-- Add sample games
AddGameCard("Blox Fruits", "rbxassetid://15546522377")
AddGameCard("Brookhaven", "rbxassetid://15546522377")

print("Naxor V55.0 Clean Version Loaded!")
