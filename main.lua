-- [[ NAXOR V4 - THE COMPLETE AND INTEGRATED VERSION (NO SHORTCUTS) ]] --

local Players = game:GetService("Players")
local LP = Players.LocalPlayer
local PlayerGui = LP:WaitForChild("PlayerGui")
local UIS = game:GetService("UserInputService")
local TS = game:GetService("TweenService")

-- [1] تنظيف النسخ السابقة لضمان عدم التكرار
for _, v in pairs(PlayerGui:GetChildren()) do
    if v.Name == "Naxor_Official_V4" then v:Destroy() end
end

-- متغيرات الألوان والـ RGB
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
Main.ClipsDescendants = true
Instance.new("UICorner", Main).CornerRadius = UDim.new(0, 20)

-- حدود النيون (Stroke)
local MainStroke = Instance.new("UIStroke", Main)
MainStroke.Thickness = 3
MainStroke.Color = MainColor
MainStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border

-- [3] هيدر السحب المحصور (Drag Header) لضمان عدم "اللحاق"
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

-- [5] نظام التابات العلوي (Tabs)
local TabHolder = Instance.new("Frame", Main)
TabHolder.Size = UDim2.new(0, 220, 0, 40)
TabHolder.Position = UDim2.new(1, -245, 0, 15)
TabHolder.BackgroundTransparency = 1

local function CreateTab(name, x, isHome)
    local btn = Instance.new("TextButton", TabHolder)
    btn.Size = UDim2.new(0, 65, 1, 0)
    btn.Position = UDim2.new(0, x, 0, 0)
    btn.BackgroundTransparency = 1
    btn.Text = name
    btn.TextColor3 = isHome and MainColor or Color3.fromRGB(180, 180, 180)
    btn.TextSize = 14
    btn.Font = Enum.Font.GothamBold
    return btn
end

local HomeTab = CreateTab("Home", 0, true)
local PagesTab = CreateTab("Pages", 75, false)
local CreditsTab = CreateTab("Credits", 150, false)

local TabLine = Instance.new("Frame", TabHolder)
TabLine.Size = UDim2.new(0, 35, 0, 2)
TabLine.Position = UDim2.new(0, 15, 1, -5)
TabLine.BackgroundColor3 = MainColor
TabLine.BorderSizePixel = 0

-- [6] صفحات المحتوى (Pages)
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

-- [7] تصميم بطاقة الهوية (ID CARD) - الجهة اليسرى
local IDCard = Instance.new("Frame", HomePage)
IDCard.Size = UDim2.new(0, 195, 1, 0)
IDCard.BackgroundColor3 = Color3.fromRGB(12, 12, 12)
Instance.new("UICorner", IDCard).CornerRadius = UDim.new(0, 15)
local IDStroke = Instance.new("UIStroke", IDCard)
IDStroke.Color = MainColor
IDStroke.Thickness = 1.5

local pImg = Instance.new("ImageLabel", IDCard)
pImg.Size = UDim2.new(0, 70, 0, 70)
pImg.Position = UDim2.new(0, 15, 0, 15)
pImg.Image = "rbxthumb://type=AvatarHeadShot&id="..LP.UserId.."&w=150&h=150"
pImg.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
Instance.new("UICorner", pImg).CornerRadius = UDim.new(0, 12)

local function AddIDLabel(text, y, color, bold, size)
    local l = Instance.new("TextLabel", IDCard)
    l.Text = text
    l.Size = UDim2.new(1, -30, 0, 20)
    l.Position = UDim2.new(0, 15, 0, y)
    l.BackgroundTransparency = 1
    l.TextColor3 = color or Color3.new(0.9, 0.9, 0.9)
    l.TextSize = size or 9
    l.Font = bold and Enum.Font.GothamBold or Enum.Font.GothamMedium
    l.TextXAlignment = Enum.TextXAlignment.Left
    return l
end

AddIDLabel("IDENTIFICATION:", 95, Color3.fromRGB(110, 110, 110), true, 8)
AddIDLabel("NAME: "..LP.Name:upper(), 115, Color3.new(1, 1, 1), false, 10)
AddIDLabel("STATUS: ONLINE", 135, Color3.fromRGB(0, 255, 130), false, 10)
AddIDLabel("VERSION: 4.0.0", 155, Color3.new(1, 1, 1), false, 10)
local accessLabel = AddIDLabel("N.X.R HUB ACCESS", 185, MainColor, true, 10)

-- مربع ساحة الصورة (الجهة اليمنى)
local ImageBox = Instance.new("Frame", HomePage)
ImageBox.Size = UDim2.new(1, -220, 1, 0)
ImageBox.Position = UDim2.new(0, 220, 0, 0)
ImageBox.BackgroundColor3 = Color3.fromRGB(12, 12, 12)
Instance.new("UICorner", ImageBox).CornerRadius = UDim.new(0, 15)
local ImgStroke = Instance.new("UIStroke", ImageBox)
ImgStroke.Color = MainColor
ImgStroke.Thickness = 1.5

-- [8] نظام الـ RGB (في صفحة الإعدادات)
local function UpdateRGB()
    local C = Color3.fromRGB(R, G, B)
    MainStroke.Color = C
    IDStroke.Color = C
    ImgStroke.Color = C
    TabLine.BackgroundColor3 = C
    accessLabel.TextColor3 = C
    Logo.Text = "N.X.R <font color='#" .. C:ToHex() .. "'> >>> </font>"
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
    UIS.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            sliding = false
        end
    end)
end

CreateSlider("R", Color3.new(1, 0, 0), 0)
CreateSlider("G", Color3.new(0, 1, 0), 1)
CreateSlider("B", Color3.new(0, 0.6, 1), 2)

-- [9] الأزرار السفلية (التصميم الاحترافي الموزع)
local function CreateBottomButton(name, xPos, callback)
    local b = Instance.new("TextButton", Main)
    b.Size = UDim2.new(0, 160, 0, 85) -- أزرار كبيرة وفخمة
    b.Position = UDim2.new(0, xPos, 1, -105)
    b.BackgroundColor3 = Color3.fromRGB(18, 18, 18)
    b.Text = name
    b.TextColor3 = Color3.new(1, 1, 1)
    b.Font = Enum.Font.GothamBold
    b.TextSize = 13
    Instance.new("UICorner", b).CornerRadius = UDim.new(0, 15)
    local s = Instance.new("UIStroke", b)
    s.Thickness = 1.2
    s.Color = Color3.fromRGB(35, 35, 35)
    
    b.MouseButton1Click:Connect(callback)
end

CreateBottomButton("CONFIG", 25, function() print("Config Clicked") end)
CreateBottomButton("SETTING", 200, function() HomePage.Visible = false; SettingsPage.Visible = true end)
CreateBottomButton("AD (إعلان)", 375, function() print("AD Clicked") end)

-- شريط الزينة السفلي (Home Indicator)
local HomeIndicator = Instance.new("Frame", Main)
HomeIndicator.Size = UDim2.new(0, 130, 0, 4)
HomeIndicator.Position = UDim2.new(0.5, -65, 1, -12)
HomeIndicator.BackgroundColor3 = Color3.new(1, 1, 1)
HomeIndicator.BackgroundTransparency = 0.6
Instance.new("UICorner", HomeIndicator).CornerRadius = UDim.new(1, 0)

-- [10] برمجة التنقل بين التابات
HomeTab.MouseButton1Click:Connect(function()
    HomePage.Visible = true; SettingsPage.Visible = false
    TS:Create(TabLine, TweenInfo.new(0.3), {Position = UDim2.new(0, 15, 1, -5)}):Play()
end)

PagesTab.MouseButton1Click:Connect(function()
    HomePage.Visible = false; SettingsPage.Visible = false
    TS:Create(TabLine, TweenInfo.new(0.3), {Position = UDim2.new(0, 90, 1, -5)}):Play()
end)

CreditsTab.MouseButton1Click:Connect(function()
    HomePage.Visible = false; SettingsPage.Visible = false
    TS:Create(TabLine, TweenInfo.new(0.3), {Position = UDim2.new(0, 165, 1, -5)}):Play()
end)

print("Naxor V4: Success. Drag restricted to Header. No shortcuts applied.")
