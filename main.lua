-- [[ NAXOR V4 - THE FINAL INTEGRATED VERSION ]] --

local Players = game:GetService("Players")
local LP = Players.LocalPlayer
local PlayerGui = LP:WaitForChild("PlayerGui")
local UIS = game:GetService("UserInputService")
local TS = game:GetService("TweenService")

-- [1] تنظيف النسخ السابقة لضمان عدم التكرار
for _, v in pairs(PlayerGui:GetChildren()) do
    if v.Name == "Naxor_Official_V4" then v:Destroy() end
end

-- متغيرات الألوان والـ RGB الأساسية
local R, G, B = 255, 0, 50
local MainColor = Color3.fromRGB(R, G, B)

-- [2] إنشاء الواجهة الأساسية (ScreenGui)
local Screen = Instance.new("ScreenGui", PlayerGui)
Screen.Name = "Naxor_Official_V4"
Screen.IgnoreGuiInset = true
Screen.ZIndexBehavior = Enum.ZIndexBehavior.Global

-- الإطار الرئيسي (Main Frame)
local Main = Instance.new("Frame", Screen)
Main.Name = "Main"
Main.Size = UDim2.new(0, 560, 0, 390)
Main.Position = UDim2.new(0.5, -280, 0.5, -195)
Main.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
Main.BorderSizePixel = 0
Instance.new("UICorner", Main).CornerRadius = UDim.new(0, 20)

local MainStroke = Instance.new("UIStroke", Main)
MainStroke.Thickness = 3
MainStroke.Color = MainColor

-- [3] هيدر السحب المحصور (Drag Header)
local DragHeader = Instance.new("Frame", Main)
DragHeader.Name = "DragHeader"
DragHeader.Size = UDim2.new(1, 0, 0, 65)
DragHeader.BackgroundTransparency = 1
DragHeader.ZIndex = 10

local dragging, dragStart, startPos
DragHeader.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startPos = Main.Position
        local connection
        connection = input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
                connection:Disconnect()
            end
        end)
    end
end)

UIS.InputChanged:Connect(function(input)
    if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
        local delta = input.Position - dragStart
        Main.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
end)

-- [4] الشعار (Logo)
local Logo = Instance.new("TextLabel", DragHeader)
Logo.RichText = true
Logo.Text = "N.X.R <font color='#FF0032'>>>> </font>"
Logo.Size = UDim2.new(0, 150, 1, 0)
Logo.Position = UDim2.new(0, 25, 0, 0)
Logo.BackgroundTransparency = 1
Logo.TextColor3 = Color3.new(1, 1, 1)
Logo.TextSize = 26
Logo.Font = Enum.Font.GothamBold
Logo.TextXAlignment = Enum.TextXAlignment.Left

-- [5] الصفحات (Home & Settings)
local HomePage = Instance.new("Frame", Main)
HomePage.Size = UDim2.new(1, -50, 1, -170)
HomePage.Position = UDim2.new(0, 25, 0, 80)
HomePage.BackgroundTransparency = 1
HomePage.Visible = true

local SettingsPage = Instance.new("Frame", Main)
SettingsPage.Size = HomePage.Size
SettingsPage.Position = HomePage.Position
SettingsPage.BackgroundTransparency = 1
SettingsPage.Visible = false

-- [6] تصميم بطاقة الهوية (ID CARD)
local IDCard = Instance.new("Frame", HomePage)
IDCard.Size = UDim2.new(0, 195, 1, 0)
IDCard.BackgroundColor3 = Color3.fromRGB(12, 12, 12)
Instance.new("UICorner", IDCard).CornerRadius = UDim.new(0, 15)
local IDStroke = Instance.new("UIStroke", IDCard)
IDStroke.Color = MainColor
IDStroke.Thickness = 2

local pImg = Instance.new("ImageLabel", IDCard)
pImg.Size = UDim2.new(0, 70, 0, 70)
pImg.Position = UDim2.new(0, 15, 0, 15)
pImg.Image = "rbxthumb://type=AvatarHeadShot&id="..LP.UserId.."&w=150&h=150"
Instance.new("UICorner", pImg).CornerRadius = UDim.new(0, 12)

local function AddIDLabel(text, y, bold)
    local l = Instance.new("TextLabel", IDCard)
    l.Text = text
    l.Size = UDim2.new(1, -30, 0, 20)
    l.Position = UDim2.new(0, 15, 0, y)
    l.BackgroundTransparency = 1
    l.TextColor3 = Color3.new(1, 1, 1)
    l.TextSize = 10
    l.Font = bold and Enum.Font.GothamBold or Enum.Font.GothamMedium
    l.TextXAlignment = Enum.TextXAlignment.Left
    return l
end

AddIDLabel("IDENTIFICATION:", 95, true)
AddIDLabel("NAME: "..LP.Name:upper(), 115, false)
AddIDLabel("STATUS: ONLINE", 135, false)
local accessLabel = AddIDLabel("N.X.R HUB ACCESS", 185, true)
accessLabel.TextColor3 = MainColor

-- مربع الصورة اليمين
local ImageBox = Instance.new("Frame", HomePage)
ImageBox.Size = UDim2.new(1, -220, 1, 0)
ImageBox.Position = UDim2.new(0, 220, 0, 0)
ImageBox.BackgroundColor3 = Color3.fromRGB(12, 12, 12)
Instance.new("UICorner", ImageBox).CornerRadius = UDim.new(0, 15)
local ImgStroke = Instance.new("UIStroke", ImageBox)
ImgStroke.Color = MainColor
ImgStroke.Thickness = 2

-- [7] الأزرار السفلية (الصغيرة والنيون)
local ButtonStrokes = {}
local function CreateNeonButton(name, x, callback)
    local b = Instance.new("TextButton", Main)
    b.Size = UDim2.new(0, 110, 0, 50)
    b.Position = UDim2.new(0, x, 1, -75)
    b.BackgroundColor3 = Color3.fromRGB(12, 12, 12)
    b.Text = name
    b.TextColor3 = Color3.new(1, 1, 1)
    b.Font = Enum.Font.GothamBold
    b.TextSize = 12
    Instance.new("UICorner", b).CornerRadius = UDim.new(0, 12)
    local s = Instance.new("UIStroke", b)
    s.Thickness = 2.5
    s.Color = MainColor
    table.insert(ButtonStrokes, s)
    b.MouseButton1Click:Connect(callback)
end

CreateNeonButton("CONFIG", 60, function() print("Config Open") end)
CreateNeonButton("SETTING", 225, function() 
    HomePage.Visible = not HomePage.Visible 
    SettingsPage.Visible = not SettingsPage.Visible 
end)
CreateNeonButton("AD (إعلان)", 390, function() print("Ad Clicked") end)

-- [8] نظام الـ RGB وتحديث الألوان
local function UpdateRGB()
    local C = Color3.fromRGB(R, G, B)
    MainStroke.Color = C
    IDStroke.Color = C
    ImgStroke.Color = C
    accessLabel.TextColor3 = C
    Logo.Text = "N.X.R <font color='#" .. C:ToHex() .. "'> >>> </font>"
    for _, s in pairs(ButtonStrokes) do s.Color = C end
end

local function CreateSlider(name, color, order)
    local f = Instance.new("Frame", SettingsPage)
    f.Size = UDim2.new(0, 280, 0, 45)
    f.Position = UDim2.new(0, 10, 0, order * 55)
    f.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    Instance.new("UICorner", f).CornerRadius = UDim.new(0, 10)
    local bar = Instance.new("Frame", f)
    bar.Size = UDim2.new(0, 180, 0, 4)
    bar.Position = UDim2.new(0, 85, 0.5, -2)
    bar.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    local dot = Instance.new("TextButton", bar)
    dot.Size = UDim2.new(0, 16, 0, 16)
    dot.Position = UDim2.new(0, 0, 0.5, -8)
    dot.BackgroundColor3 = color
    dot.Text = ""
    Instance.new("UICorner", dot).CornerRadius = UDim.new(1, 0)
    local sliding = false
    dot.MouseButton1Down:Connect(function() sliding = true end)
    UIS.InputChanged:Connect(function(input)
        if sliding and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
            local pos = math.clamp((input.Position.X - bar.AbsolutePosition.X) / bar.AbsoluteSize.X, 0, 1)
            dot.Position = UDim2.new(pos, -8, 0.5, -8)
            local val = math.floor(pos * 255)
            if name == "R" then R = val elseif name == "G" then G = val elseif name == "B" then B = val end
            UpdateRGB()
        end
    end)
    UIS.InputEnded:Connect(function() sliding = false end)
end

CreateSlider("R", Color3.new(1, 0, 0), 0)
CreateSlider("G", Color3.new(0, 1, 0), 1)
CreateSlider("B", Color3.new(0, 0.6, 1), 2)
