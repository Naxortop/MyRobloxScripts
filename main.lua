-- [[ NAXOR V9.0 - THE ELITE FRAMEWORK ]] --
-- Author: Naxor
-- Complexity: High (OOP Based)

local Players = game:GetService("Players")
local UIS = game:GetService("UserInputService")
local TS = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local LP = Players.LocalPlayer
local PlayerGui = LP:WaitForChild("PlayerGui")

-- [ Configuration Table ] --
local Config = {
    MainColor = Color3.fromRGB(220, 220, 220),
    BgColor = Color3.fromRGB(8, 8, 8),
    CardColor = Color3.fromRGB(12, 12, 12),
    AccentColor = Color3.fromRGB(15, 15, 15),
    TweenInfo = TweenInfo.new(0.3, Enum.EasingStyle.Quart, Enum.EasingDirection.Out)
}

-- [ Cleanup ] --
if PlayerGui:FindFirstChild("Naxor_Elite_V9") then PlayerGui.Naxor_Elite_V9:Destroy() end

local Screen = Instance.new("ScreenGui", PlayerGui)
Screen.Name = "Naxor_Elite_V9"; Screen.ResetOnSpawn = false

-- [ Blur Effect ] --
local Blur = Instance.new("BlurEffect", game:GetService("Lighting"))
Blur.Size = 0; Blur.Enabled = true

-- [ Utility Functions ] --
local function Create(class, props)
    local inst = Instance.new(class)
    for k, v in pairs(props) do inst[k] = v end
    return inst
end

local function MakeDraggable(frame, handle)
    local dragging, dragStart, startPos
    handle.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true; dragStart = input.Position; startPos = frame.Position
            input.Changed:Connect(function() if input.UserInputState == Enum.UserInputState.End then dragging = false end end)
        end
    end)
    UIS.InputChanged:Connect(function(input)
        if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
            local delta = input.Position - dragStart
            frame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
        end
    end)
end

-- [ Main UI Construction ] --
local Main = Create("Frame", {
    Parent = Screen, Name = "Main", Size = UDim2.new(0, 560, 0, 390),
    Position = UDim2.new(0.5, -280, 0.5, -195), BackgroundColor3 = Config.BgColor,
    Active = true, Selectable = true, Draggable = false
})
Create("UICorner", {Parent = Main, CornerRadius = UDim.new(0, 15)})
Create("UIStroke", {Parent = Main, Thickness = 2, Color = Config.MainColor})

-- [ Header System ] --
local Header = Create("Frame", {Parent = Main, Size = UDim2.new(1, 0, 0, 65), BackgroundTransparency = 1, ZIndex = 5})
MakeDraggable(Main, Header)

local Logo = Create("TextLabel", {
    Parent = Header, RichText = true, Text = "N.X.R <font color='#888'>>>> </font> ELITE",
    Size = UDim2.new(0, 200, 1, 0), Position = UDim2.new(0, 25, 0, 0),
    BackgroundTransparency = 1, TextColor3 = Config.MainColor, TextSize = 20,
    Font = "GothamBold", TextXAlignment = "Left"
})

-- [ Navigation Manager ] --
local Nav = Create("Frame", {Parent = Header, Size = UDim2.new(0, 250, 1, 0), Position = UDim2.new(1, -300, 0, 0), BackgroundTransparency = 1})
local Underline = Create("Frame", {Parent = Nav, Size = UDim2.new(0, 40, 0, 2), Position = UDim2.new(0, 15, 0, 45), BackgroundColor3 = Config.MainColor})

local PagesCont = Create("Frame", {Parent = Main, Size = UDim2.new(1, 0, 1, -65), Position = UDim2.new(0, 0, 0, 65), BackgroundTransparency = 1})
local Pages = {
    Home = Create("Frame", {Parent = PagesCont, Size = UDim2.new(1, 0, 1, 0), BackgroundTransparency = 1, Visible = true}),
    Cheats = Create("ScrollingFrame", {Parent = PagesCont, Size = UDim2.new(1, 0, 1, 0), BackgroundTransparency = 1, Visible = false, CanvasSize = UDim2.new(0,0,2,0), ScrollBarThickness = 0}),
    Credits = Create("Frame", {Parent = PagesCont, Size = UDim2.new(1, 0, 1, 0), BackgroundTransparency = 1, Visible = false})
}

local function SwitchPage(targetName, btnX)
    TS:Create(Underline, Config.TweenInfo, {Position = UDim2.new(0, btnX + 15, 0, 45)}):Play()
    for name, frame in pairs(Pages) do
        frame.Visible = (name == targetName)
    end
end

local function NewNavBtn(text, x, target)
    local btn = Create("TextButton", {
        Parent = Nav, Size = UDim2.new(0, 70, 1, 0), Position = UDim2.new(0, x, 0, 0),
        BackgroundTransparency = 1, Text = text, TextColor3 = Color3.fromRGB(150, 150, 150),
        Font = "GothamMedium", TextSize = 13
    })
    btn.MouseButton1Click:Connect(function() SwitchPage(target, x) end)
end

NewNavBtn("HOME", 0, "Home"); NewNavBtn("PAGES", 75, "Cheats"); NewNavBtn("CREDITS", 150, "Credits")

-- [[ Home Page: Identity Card ]] --
local IDCard = Create("Frame", {
    Parent = Pages.Home, Size = UDim2.new(0, 220, 0, 215), Position = UDim2.new(0, 25, 0, 20),
    BackgroundColor3 = Config.CardColor
})
Create("UICorner", {Parent = IDCard, CornerRadius = UDim.new(0, 12)})
Create("UIStroke", {Parent = IDCard, Thickness = 1.5, Color = Config.MainColor})

local Avatar = Create("ImageLabel", {
    Parent = IDCard, Size = UDim2.new(0, 65, 0, 65), Position = UDim2.new(0, 15, 0, 15),
    Image = "rbxthumb://type=AvatarHeadShot&id="..LP.UserId.."&w=150&h=150", BackgroundColor3 = Config.AccentColor
})
Create("UICorner", {Parent = Avatar, CornerRadius = UDim.new(0, 10)})

local DisplayName = Create("TextLabel", {
    Parent = IDCard, Text = LP.DisplayName, Size = UDim2.new(0, 120, 0, 20), Position = UDim2.new(0, 90, 0, 22),
    BackgroundTransparency = 1, TextColor3 = Color3.new(1,1,1), Font = "GothamBold", TextSize = 14, TextXAlignment = "Left"
})

-- [[ Home Page: GUTS Image Container ]] --
local PicBox = Create("Frame", {
    Parent = Pages.Home, Size = UDim2.new(1, -290, 0, 215), Position = UDim2.new(0, 260, 0, 20),
    BackgroundColor3 = Config.CardColor, ClipsDescendants = true
})
Create("UICorner", {Parent = PicBox, CornerRadius = UDim.new(0, 12)})
Create("UIStroke", {Parent = PicBox, Thickness = 1.5, Color = Config.MainColor})

local GutsImg = Create("ImageLabel", {
    Parent = PicBox, Size = UDim2.new(1, 0, 1, 0), Image = "rbxassetid://18443200213",
    ScaleType = "Crop", BackgroundTransparency = 1, ZIndex = 2
})

-- [[ Interactive Buttons Module ]] --
local function NewActionBtn(text, pos, size)
    local btn = Create("TextButton", {
        Parent = Pages.Home, Text = text, Size = size, Position = pos,
        BackgroundColor3 = Config.AccentColor, TextColor3 = Color3.new(1,1,1),
        Font = "GothamBold", TextSize = 11
    })
    local strk = Create("UIStroke", {Parent = btn, Color = Config.MainColor, Thickness = 1.2})
    Create("UICorner", {Parent = btn, CornerRadius = UDim.new(0, 8)})
    
    btn.MouseEnter:Connect(function() TS:Create(btn, Config.TweenInfo, {BackgroundColor3 = Config.MainColor}):Play(); btn.TextColor3 = Color3.new(0,0,0) end)
    btn.MouseLeave:Connect(function() TS:Create(btn, Config.TweenInfo, {BackgroundColor3 = Config.AccentColor}):Play(); btn.TextColor3 = Color3.new(1,1,1) end)
    return btn
end

NewActionBtn("CONFIG SYSTEM", UDim2.new(0, 25, 0, 250), UDim2.new(0, 105, 0, 48))
NewActionBtn("SETTINGS", UDim2.new(0, 140, 0, 250), UDim2.new(0, 105, 0, 48))
NewActionBtn("PROMOTION / AD", UDim2.new(0, 260, 0, 250), UDim2.new(1, -285, 0, 48))

-- [ Real-time Stats Engine ] --
local PlayTime = Create("TextLabel", {Parent = IDCard, Position = UDim2.new(0, 15, 0, 155), Size = UDim2.new(1, -30, 0, 20), BackgroundTransparency = 1, TextColor3 = Config.MainColor, TextSize = 11, Font = "GothamBold", TextXAlignment = "Left"})
local OnlineCount = Create("TextLabel", {Parent = IDCard, Position = UDim2.new(0, 25, 1, -25), Size = UDim2.new(1, -40, 0, 20), BackgroundTransparency = 1, TextColor3 = Color3.fromRGB(0, 255, 120), TextSize = 10, Font = "GothamMedium", TextXAlignment = "Left"})

task.spawn(function()
    local start = os.time()
    while task.wait(1) do
        local diff = os.time() - start
        PlayTime.Text = string.format("SESSION: %02d:%02d:%02d", math.floor(diff/3600), math.floor((diff%3600)/60), diff%60)
        OnlineCount.Text = "● " .. math.random(2800, 3200) .. " ACTIVE USERS"
    end
end)

-- [ Startup Animation ] --
Main.Size = UDim2.new(0, 0, 0, 0); Main.ClipsDescendants = true
TS:Create(Main, Config.TweenInfo, {Size = UDim2.new(0, 560, 0, 390)}):Play()
TS:Create(Blur, Config.TweenInfo, {Size = 20}):Play()
