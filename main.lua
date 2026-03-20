-- [[ NAXOR V4 - THE FULL UNABRIDGED VERSION ]] --

local Players = game:GetService("Players")
local LP = Players.LocalPlayer
local PlayerGui = LP:WaitForChild("PlayerGui")
local UIS = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")

-- [1] تنظيف أي نسخة قديمة لضمان عدم التداخل
for _, v in pairs(PlayerGui:GetChildren()) do
    if v.Name == "Naxor_Official_V4" then v:Destroy() end
end

-- متغيرات الثيم الأساسية
local R, G, B = 255, 0, 50

-- [2] إنشاء الواجهة الرئيسية (ScreenGui)
local Screen = Instance.new("ScreenGui", PlayerGui)
Screen.Name = "Naxor_Official_V4"
Screen.ResetOnSpawn = false
Screen.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

-- الإطار الرئيسي (Main Frame)
local Main = Instance.new("Frame", Screen)
Main.Name = "MainFrame"
Main.Size = UDim2.new(0, 520, 0, 360) -- كبرت الحجم شوي عشان الستات
Main.Position = UDim2.new(0.5, -260, 0.5, -180)
Main.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
Main.BorderSizePixel = 0
Main.Active = true
Instance.new("UICorner", Main).CornerRadius = UDim.new(0, 18)

-- حدود الواجهة المتغيرة (RGB Stroke)
local Stroke = Instance.new("UIStroke", Main)
Stroke.Thickness = 2.5
Stroke.Color = Color3.fromRGB(R, G, B)

-- [3] شريط سحب الآيفون (iPhone Home Bar)
local DragBar = Instance.new("Frame", Main)
DragBar.Name = "iPhoneBar"
DragBar.Size = UDim2.new(0, 150, 0, 4)
DragBar.Position = UDim2.new(0.5, -75, 1, -12)
DragBar.BackgroundColor3 = Color3.new(1, 1, 1)
DragBar.BackgroundTransparency = 0.4
DragBar.ZIndex = 20
Instance.new("UICorner", DragBar).CornerRadius = UDim.new(1, 0)

-- برمجة السحب الحصري من الخط السفلي فقط
local MainDragging, DragStart, StartPos
DragBar.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        MainDragging = true
        DragStart = input.Position
        StartPos = Main.Position
    end
end)

UIS.InputChanged:Connect(function(input)
    if MainDragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
        local Delta = input.Position - DragStart
        Main.Position = UDim2.new(StartPos.X.Scale, StartPos.X.Offset + Delta.X, StartPos.Y.Scale, StartPos.Y.Offset + Delta.Y)
    end
end)

UIS.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        MainDragging = false
    end
end)

-- [4] الشعار العلوي (N.X.R >>>)
local Logo = Instance.new("TextLabel", Main)
Logo.Name = "Logo"
Logo.RichText = true
Logo.Text = "N.X.R <font color='#FF0032'>>>> </font>"
Logo.Size = UDim2.new(0, 200, 0, 60)
Logo.Position = UDim2.new(0, 25, 0, 10)
Logo.BackgroundTransparency = 1
Logo.TextColor3 = Color3.new(1, 1, 1)
Logo.TextSize = 28
Logo.Font = "GothamBold"
Logo.TextXAlignment = "Left"

-- [5] الحاويات (الصفحات)
local HomeP = Instance.new("Frame", Main); HomeP.Size = UDim2.new(1, 0, 1, 0); HomeP.BackgroundTransparency = 1; HomeP.Visible = true
local SettingsP = Instance.new("Frame", Main); SettingsP.Size = UDim2.new(1, 0, 1, 0); SettingsP.BackgroundTransparency = 1; SettingsP.Visible = false
local ScriptP = Instance.new("Frame", Main); ScriptP.Size = UDim2.new(1, 0, 1, 0); ScriptP.BackgroundTransparency = 1; ScriptP.Visible = false

-- [6] لوحة معلومات اللاعب (PLAYER STATS) - في صفحة الهوم
local StatsFrame = Instance.new("Frame", HomeP)
StatsFrame.Size = UDim2.new(0, 470, 0, 100)
StatsFrame.Position = UDim2.new(0.5, -235, 0, 80)
StatsFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
Instance.new("UICorner", StatsFrame).CornerRadius = UDim.new(0, 12)

-- صورة اللاعب
local pImage = Instance.new("ImageLabel", StatsFrame)
pImage.Size = UDim2.new(0, 70, 0, 70)
pImage.Position = UDim2.new(0, 15, 0.5, -35)
pImage.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
pImage.Image = "rbxthumb://type=AvatarHeadShot&id="..LP.UserId.."&w=150&h=150"
Instance.new("UICorner", pImage).CornerRadius = UDim.new(1, 0)

-- اسم اللاعب
local pName = Instance.new("TextLabel", StatsFrame)
pName.Text = "Username: " .. LP.Name
pName.Size = UDim2.new(0, 300, 0, 30); pName.Position = UDim2.new(0, 100, 0, 20)
pName.BackgroundTransparency = 1; pName.TextColor3 = Color3.new(1, 1, 1); pName.TextSize = 18; pName.Font = "GothamBold"; pName.TextXAlignment = "Left"

-- عمر الحساب
local pAge = Instance.new("TextLabel", StatsFrame)
pAge.Text = "Account Age: " .. LP.AccountAge .. " Days"
pAge.Size = UDim2.new(0, 300, 0, 30); pAge.Position = UDim2.new(0, 100, 0, 45)
pAge.BackgroundTransparency = 1; pAge.TextColor3 = Color3.fromRGB(180, 180, 180); pAge.TextSize = 14; pAge.Font = "GothamMedium"; pAge.TextXAlignment = "Left"

-- [7] أزرار التنقل العلوية (🏠 و 📄)
local function CreateNav(txt, xPos, callback)
    local b = Instance.new("TextButton", Main)
    b.Size = UDim2.new(0, 42, 0, 42)
    b.Position = UDim2.new(1, xPos, 0, 15)
    b.BackgroundColor3 = Color3.fromRGB(22, 22, 22)
    b.Text = txt; b.TextColor3 = Color3.new(1, 1, 1); b.TextSize = 18
    Instance.new("UICorner", b).CornerRadius = UDim.new(0, 10)
    b.MouseButton1Click:Connect(callback)
    return b
end

CreateNav("🏠", -105, function() HomeP.Visible = true; SettingsP.Visible = false; ScriptP.Visible = false end)
CreateNav("📄", -55, function() HomeP.Visible = false; SettingsP.Visible = false; ScriptP.Visible = true end)

-- [8] نظام تحديث الألوان الحي
local function UpdateUI()
    local C = Color3.fromRGB(R, G, B)
    Stroke.Color = C
    Logo.Text = "N.X.R <font color='#" .. C:ToHex() .. "'> >>> </font>"
end

-- [9] منزلقات الـ RGB المصلحة (Smooth Sliding)
local function CreateSlider(name, col, order)
    local f = Instance.new("Frame", SettingsP)
    f.Size = UDim2.new(0, 270, 0, 45); f.Position = UDim2.new(0, 25, 0, 100 + (order * 55)); f.BackgroundColor3 = Color3.fromRGB(22, 22, 22); Instance.new("UICorner", f).CornerRadius = UDim.new(0, 10)
    local bar = Instance.new("Frame", f); bar.Size = UDim2.new(0, 180, 0, 5); bar.Position = UDim2.new(0, 70, 0.5, -2); bar.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
    local dot = Instance.new("TextButton", bar); dot.Size = UDim2.new(0, 18, 0, 18); dot.Position = UDim2.new(0, 0, 0.5, -9); dot.BackgroundColor3 = col; dot.Text = ""; Instance.new("UICorner", dot).CornerRadius = UDim.new(1, 0)
    
    local Sliding = false
    dot.MouseButton1Down:Connect(function() Sliding = true end)
    
    UIS.InputChanged:Connect(function(input)
        if Sliding and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
            local Percent = math.clamp((input.Position.X - bar.AbsolutePosition.X) / bar.AbsoluteSize.X, 0, 1)
            dot.Position = UDim2.new(Percent, -9, 0.5, -9)
            local Val = math.floor(Percent * 255)
            if name == "R" then R = Val elseif name == "G" then G = Val elseif name == "B" then B = Val end
            UpdateUI()
        end
    end)
    UIS.InputEnded:Connect(function(i) if i.UserInputType == Enum.UserInputType.MouseButton1 or i.UserInputType == Enum.UserInputType.Touch then Sliding = false end end)
end

CreateSlider("R", Color3.new(1,0,0), 0)
CreateSlider("G", Color3.new(0,1,0), 1)
CreateSlider("B", Color3.new(0,0.6,1), 2)

-- [10] الأزرار السفلية (CONFIG, SETTING, AD)
local function AddBottom(name, xPos, callback)
    local b = Instance.new("TextButton", HomeP)
    b.Size = UDim2.new(0, 150, 0, 75)
    b.Position = UDim2.new(0, xPos, 1, -105)
    b.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    b.Text = name; b.TextColor3 = Color3.new(1, 1, 1); b.Font = "GothamBold"; b.TextSize = 11
    Instance.new("UICorner", b).CornerRadius = UDim.new(0, 12)
    b.MouseButton1Click:Connect(callback)
end

AddBottom("CONFIG", 15, function() print("Config clicked") end)
AddBottom("SETTING", 185, function() HomeP.Visible = false; SettingsP.Visible = true end)
AddBottom("AD", 355, function() print("Ad clicked") end)

-- [11] الزر العائم NXR
local Toggle = Instance.new("TextButton", Screen); Toggle.Size = UDim2.new(0, 55, 0, 55); Toggle.Position = UDim2.new(1, -70, 0, 20); Toggle.Text = "NXR"; Toggle.BackgroundColor3 = Color3.fromRGB(15, 15, 15); Toggle.TextColor3 = Color3.fromRGB(255, 0, 50); Instance.new("UICorner", Toggle).CornerRadius = UDim.new(1, 0); Toggle.Draggable = true
Toggle.MouseButton1Click:Connect(function() Main.Visible = not Main.Visible end)
