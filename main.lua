-- [[ NAXOR V4 - TOP CENTER TOGGLE & DEEP FOG BACKGROUND ]] --

local Players = game:GetService("Players")
local LP = Players.LocalPlayer
local PlayerGui = LP:WaitForChild("PlayerGui")
local UIS = game:GetService("UserInputService")
local TS = game:GetService("TweenService")

if PlayerGui:FindFirstChild("Naxor_Official_V4") then
    PlayerGui:FindFirstChild("Naxor_Official_V4"):Destroy()
end

local MainColor = Color3.fromRGB(220, 220, 220) -- أبيض حاد

-- [1] الشاشة الرئيسية
local Screen = Instance.new("ScreenGui", PlayerGui)
Screen.Name = "Naxor_Official_V4"; Screen.IgnoreGuiInset = true

-- [2] الزر العائم (موقعه الجديد: منتصف أعلى الشاشة)
local ToggleBtn = Instance.new("ImageButton", Screen)
ToggleBtn.Size = UDim2.new(0, 45, 0, 45)
ToggleBtn.Position = UDim2.new(0.5, -22, 0, 15) -- منتصف (0.5) ومنزاح للأعلى (15)
ToggleBtn.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
ToggleBtn.Image = "rbxassetid://6031094067"
ToggleBtn.Visible = false
Instance.new("UICorner", ToggleBtn).CornerRadius = UDim.new(1, 0)
local ToggleStroke = Instance.new("UIStroke", ToggleBtn); ToggleStroke.Thickness = 1.5; ToggleStroke.Color = MainColor

-- وظيفة سحب الزر العائم (عشان لو تبي تحركه من مكانه)
local function MakeDraggable(UI_Element)
    local Dragging, DragInput, DragStart, StartPos
    UI_Element.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            Dragging = true; DragStart = input.Position; StartPos = UI_Element.Position
            input.Changed:Connect(function() if input.UserInputState == Enum.UserInputState.End then Dragging = false end end)
        end
    end)
    UI_Element.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then DragInput = input end
    end)
    UIS.InputChanged:Connect(function(input)
        if input == DragInput and Dragging then
            local Delta = input.Position - DragStart
            UI_Element.Position = UDim2.new(StartPos.X.Scale, StartPos.X.Offset + Delta.X, StartPos.Y.Scale, StartPos.Y.Offset + Delta.Y)
        end
    end)
end
MakeDraggable(ToggleBtn)

-- [3] الإطار الرئيسي
local Main = Instance.new("Frame", Screen)
Main.Size = UDim2.new(0, 560, 0, 390); Main.Position = UDim2.new(0.5, -280, 0.5, -195)
Main.BackgroundColor3 = Color3.fromRGB(7, 7, 7); Instance.new("UICorner", Main).CornerRadius = UDim.new(0, 15)
local MainStroke = Instance.new("UIStroke", Main); MainStroke.Thickness = 2; MainStroke.Color = MainColor

------------------------------------------------------------------------------------------------------------------------------------
-- [ خلفية الضباب العميق (Deep Fog) ] --
------------------------------------------------------------------------------------------------------------------------------------
local FogBg = Instance.new("ImageLabel", Main)
FogBg.Size = UDim2.new(1, 0, 1, 0)
FogBg.BackgroundTransparency = 1
FogBg.Image = "rbxassetid://12350036653" -- تأثير ضبابي ناعم
FogBg.ImageColor3 = Color3.fromRGB(50, 50, 50)
FogBg.ImageTransparency = 0.85
FogBg.ZIndex = 0
Instance.new("UICorner", FogBg).CornerRadius = UDim.new(0, 15)
------------------------------------------------------------------------------------------------------------------------------------

local function ToggleUI() Main.Visible = not Main.Visible; ToggleBtn.Visible = not Main.Visible end
ToggleBtn.MouseButton1Click:Connect(ToggleUI)

-- [4] الهيدر
local Header = Instance.new("Frame", Main); Header.Size = UDim2.new(1, 0, 0, 65); Header.BackgroundTransparency = 1; Header.ZIndex = 10

-- سحب المنيو
local mDragging, mDragStart, mStartPos
Header.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        mDragging = true; mDragStart = input.Position; mStartPos = Main.Position
        input.Changed:Connect(function() if input.UserInputState == Enum.UserInputState.End then mDragging = false end end)
    end
end)
UIS.InputChanged:Connect(function(input)
    if mDragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
        local delta = input.Position - mDragStart
        Main.Position = UDim2.new(mStartPos.X.Scale, mStartPos.X.Offset + delta.X, mStartPos.Y.Scale, mStartPos.Y.Offset + delta.Y)
    end
end)

local Logo = Instance.new("TextLabel", Header); Logo.RichText = true; Logo.Text = "N.X.R <font color='#DCDCDC'>>>> </font>"; Logo.Size = UDim2.new(0, 150, 1, 0); Logo.Position = UDim2.new(0, 25, 0, 0); Logo.BackgroundTransparency = 1; Logo.TextColor3 = MainColor; Logo.TextSize = 20; Logo.Font = "GothamBold"; Logo.TextXAlignment = "Left"
local CloseBtn = Instance.new("TextButton", Header); CloseBtn.Size = UDim2.new(0, 30, 0, 30); CloseBtn.Position = UDim2.new(1, -40, 0, 17); CloseBtn.BackgroundTransparency = 1; CloseBtn.Text = "X"; CloseBtn.TextColor3 = MainColor; CloseBtn.TextSize = 18; CloseBtn.Font = "GothamBold"; CloseBtn.MouseButton1Click:Connect(ToggleUI)

local Nav = Instance.new("Frame", Header); Nav.Size = UDim2.new(0, 250, 1, 0); Nav.Position = UDim2.new(1, -300, 0, 0); Nav.BackgroundTransparency = 1
local Underline = Instance.new("Frame", Nav); Underline.Size = UDim2.new(0, 35, 0, 1.5); Underline.Position = UDim2.new(0, 15, 0, 45); Underline.BackgroundColor3 = MainColor

local Separator = Instance.new("Frame", Main); Separator.Size = UDim2.new(1, 0, 0, 1.5); Separator.Position = UDim2.new(0, 0, 0, 65); Separator.BackgroundColor3 = MainColor; Separator.BorderSizePixel = 0; Separator.ZIndex = 5

-- [5] الصفحات
local PagesCont = Instance.new("Frame", Main); PagesCont.Size = UDim2.new(1, 0, 1, -65); PagesCont.Position = UDim2.new(0, 0, 0, 65); PagesCont.BackgroundTransparency = 1; PagesCont.ZIndex = 2
local Pages = { Home = Instance.new("Frame", PagesCont), Scripts = Instance.new("Frame", PagesCont), Credits = Instance.new("Frame", PagesCont) }
for name, frame in pairs(Pages) do frame.Size = UDim2.new(1, 0, 1, 0); frame.BackgroundTransparency = 1; frame.Visible = (name == "Home") end

local function CreateNavBtn(name, x, target)
    local b = Instance.new("TextButton", Nav); b.Size = UDim2.new(0, 70, 1, 0); b.Position = UDim2.new(0, x, 0, 0); b.BackgroundTransparency = 1; b.Text = name; b.TextColor3 = Color3.fromRGB(180, 180, 180); b.Font = "GothamMedium"; b.TextSize = 12
    b.MouseButton1Click:Connect(function() 
        TS:Create(Underline, TweenInfo.new(0.25), {Position = UDim2.new(0, x + 15, 0, 45)}):Play()
        for n, f in pairs(Pages) do f.Visible = (n == target) end
    end)
end
CreateNavBtn("Home", 0, "Home"); CreateNavBtn("Pages", 75, "Scripts"); CreateNavBtn("Credits", 150, "Credits")

-- [6] المربعات
local function CreateBox(parent, size, pos)
    local box = Instance.new("Frame", parent); box.Size = size; box.Position = pos; box.BackgroundColor3 = Color3.fromRGB(12, 12, 12); box.ZIndex = 3; Instance.new("UICorner", box).CornerRadius = UDim.new(0, 10)
    local s = Instance.new("UIStroke", box); s.Color = MainColor; s.Thickness = 1.8; return box
end
local IDCard = CreateBox(Pages.Home, UDim2.new(0, 200, 0, 210), UDim2.new(0, 25, 0, 25))
local PicBox = CreateBox(Pages.Home, UDim2.new(1, -275, 0, 210), UDim2.new(0, 250, 0, 25))

-- الأزرار السفلية
local function CreateMiniBtn(name, x, y)
    local b = Instance.new("TextButton", Pages.Home); b.Size = UDim2.new(0, 95, 0, 42); b.Position = UDim2.new(0, x, 0, y); b.BackgroundColor3 = Color3.fromRGB(10, 10, 10); b.Text = name; b.TextColor3 = MainColor; b.Font = "GothamBold"; b.TextSize = 10; b.ZIndex = 3
    Instance.new("UICorner", b).CornerRadius = UDim.new(0, 6); local s = Instance.new("UIStroke", b); s.Color = MainColor; s.Thickness = 1.2; s.ApplyStrokeMode = "Border"
end
CreateMiniBtn("CONFIG", 25, 255); CreateMiniBtn("SETTING", 130, 255)

local AdBtn = Instance.new("TextButton", Pages.Home); AdBtn.Size = UDim2.new(1, -275, 0, 42); AdBtn.Position = UDim2.new(0, 250, 0, 255); AdBtn.BackgroundColor3 = Color3.fromRGB(10, 10, 10); AdBtn.Text = "ADVERTISEMENT (إعلان)"; AdBtn.TextColor3 = MainColor; AdBtn.Font = "GothamBold"; AdBtn.TextSize = 11; AdBtn.ZIndex = 3
Instance.new("UICorner", AdBtn).CornerRadius = UDim.new(0, 6); local AdStroke = Instance.new("UIStroke", AdBtn); AdStroke.Color = MainColor; AdStroke.Thickness = 1.2; AdStroke.ApplyStrokeMode = "Border"

-- تفاصيل البطاقة
local pImg = Instance.new("ImageLabel", IDCard); pImg.Size = UDim2.new(0, 60, 0, 60); pImg.Position = UDim2.new(0, 15, 0, 15); pImg.Image = "rbxthumb://type=AvatarHeadShot&id="..LP.UserId.."&w=150&h=150"; pImg.ZIndex = 5; Instance.new("UICorner", pImg).CornerRadius = UDim.new(0, 8)
local PlayTimeLabel = Instance.new("TextLabel", IDCard); PlayTimeLabel.Text = "PlayTime: 00:00:00"; PlayTimeLabel.Position = UDim2.new(0, 15, 0, 150); PlayTimeLabel.Size = UDim2.new(1, -30, 0, 20); PlayTimeLabel.BackgroundTransparency = 1; PlayTimeLabel.TextColor3 = MainColor; PlayTimeLabel.TextSize = 10; PlayTimeLabel.Font = "GothamBold"; PlayTimeLabel.TextXAlignment = "Left"; PlayTimeLabel.ZIndex = 5

local StartTime = os.time()
task.spawn(function()
    while task.wait(1) do
        local E = os.time() - StartTime
        PlayTimeLabel.Text = string.format("PlayTime: %02d:%02d:%02d", math.floor(E/3600), math.floor((E%3600)/60), E%60)
    end
end)
