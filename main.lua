-- [[ NAXOR V4 - PRECISE REPLICA VERSION ]] --

local Players = game:GetService("Players")
local LP = Players.LocalPlayer
local PlayerGui = LP:WaitForChild("PlayerGui")

-- تنظيف النسخ القديمة
if PlayerGui:FindFirstChild("NaxorFinal") then
    PlayerGui.NaxorFinal:Destroy()
end

local Screen = Instance.new("ScreenGui")
Screen.Name = "NaxorFinal"
Screen.Parent = PlayerGui
Screen.ResetOnSpawn = false
Screen.DisplayOrder = 9999

-- ⬛ اللوحة الرئيسية (الخلفية السوداء)
local Main = Instance.new("Frame")
Main.Name = "Main"
Main.Parent = Screen
Main.Size = UDim2.new(0, 600, 0, 420)
Main.Position = UDim2.new(0.5, -300, 0.5, -210)
Main.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
Main.BorderSizePixel = 0
Main.Active = true
Main.Draggable = true 

local MainCorner = Instance.new("UICorner", Main)
MainCorner.CornerRadius = UDim.new(0, 15)

local MainStroke = Instance.new("UIStroke", Main)
MainStroke.Color = Color3.fromRGB(255, 0, 50)
MainStroke.Thickness = 2.5

-- 🔝 العنوان: N.X.R >>> (بدون تضليل)
local Logo = Instance.new("TextLabel")
Logo.Parent = Main
Logo.Text = "N.X.R <font color='#FF0032'>>>> </font>"
Logo.RichText = true
Logo.Size = UDim2.new(0, 200, 0, 60)
Logo.Position = UDim2.new(0, 25, 0, 10)
Logo.BackgroundTransparency = 1
Logo.TextColor3 = Color3.new(1, 1, 1)
Logo.TextSize = 28
Logo.Font = Enum.Font.GothamBold
Logo.TextXAlignment = "Left"

-- 👤 صورة اللاعب
local Avatar = Instance.new("ImageLabel")
Avatar.Parent = Main
Avatar.Size = UDim2.new(0, 70, 0, 70)
Avatar.Position = UDim2.new(0, 25, 0, 80)
Avatar.Image = "rbxthumb://type=AvatarHeadShot&id="..LP.UserId.."&w=150&h=150"
Avatar.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
Instance.new("UICorner", Avatar).CornerRadius = UDim.new(0, 10)

-- 🟥 مستطيل STATE (بجانب الصورة)
local StateBox = Instance.new("Frame")
StateBox.Parent = Main
StateBox.Size = UDim2.new(0, 90, 0, 35)
StateBox.Position = UDim2.new(0, 105, 0, 85)
StateBox.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
Instance.new("UICorner", StateBox).CornerRadius = UDim.new(0, 5)

local StateText = Instance.new("TextLabel")
StateText.Parent = StateBox
StateText.Text = "STATE"
StateText.Size = UDim2.new(1, 0, 1, 0)
StateText.BackgroundTransparency = 1
StateText.TextColor3 = Color3.fromRGB(255, 0, 50)
StateText.TextSize = 14
StateText.Font = Enum.Font.GothamBold

-- 🏷️ معلومات اللاعب (تحت الصورة)
local Info = Instance.new("TextLabel")
Info.Parent = Main
Info.Size = UDim2.new(0, 200, 0, 120)
Info.Position = UDim2.new(0, 25, 0, 160)
Info.BackgroundTransparency = 1
Info.TextColor3 = Color3.new(1, 1, 1)
Info.TextSize = 13
Info.Font = Enum.Font.GothamBold
Info.TextXAlignment = "Left"
Info.LineHeight = 1.8
Info.Text = "USER: "..LP.Name:upper().."\nSTATUS: ONLINE\nVERSION: 4.0.0\nN.X.R HUB ACTIVE"

-- 🖼️ المربع المركزي (المنطقة الكبيرة)
local CenterBox = Instance.new("Frame")
CenterBox.Parent = Main
CenterBox.Size = UDim2.new(0, 360, 0, 220)
CenterBox.Position = UDim2.new(0, 220, 0, 75)
CenterBox.BackgroundColor3 = Color3.fromRGB(12, 12, 12)
Instance.new("UICorner", CenterBox).CornerRadius = UDim.new(0, 10)

local CenterStroke = Instance.new("UIStroke", CenterBox)
CenterStroke.Color = Color3.fromRGB(255, 0, 50)
CenterStroke.Thickness = 1.5

-- 🏷️ التبويبات العلوية (Home, Pages, Credits)
local function MakeTab(name, x, active)
    local t = Instance.new("TextButton", Main)
    t.Text = name
    t.Size = UDim2.new(0, 70, 0, 50)
    t.Position = UDim2.new(1, x, 0, 10)
    t.BackgroundTransparency = 1
    t.TextColor3 = active and Color3.fromRGB(255, 0, 50) or Color3.fromRGB(150, 150, 150)
    t.TextSize = 15
    t.Font = Enum.Font.GothamBold
end
MakeTab("Home", -260, true)
MakeTab("Pages", -180, false)
MakeTab("Credits", -100, false)

-- 🔘 الأزرار السفلية الثلاثة
local function MakeBtn(name, x)
    local b = Instance.new("TextButton", Main)
    b.Name = name
    b.Text = name
    b.Size = UDim2.new(0, 185, 0, 90)
    b.Position = UDim2.new(0, x, 0, 315)
    b.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    b.TextColor3 = Color3.new(1, 1, 1)
    b.TextSize = 16
    b.Font = Enum.Font.GothamBold
    Instance.new("UICorner", b).CornerRadius = UDim.new(0, 10)
    Instance.new("UIStroke", b).Color = Color3.fromRGB(35, 35, 35) -- إطار خفيف للأزرار
end
MakeBtn("CONFIG", 10)
MakeBtn("SETTING", 205)
MakeBtn("AD (إعلان)", 405)

-- 🔴 الزر العائم (فوق يمين الزاوية)
local Toggle = Instance.new("TextButton", Screen)
Toggle.Size = UDim2.new(0, 60, 0, 60)
Toggle.Position = UDim2.new(1, -80, 0, 20)
Toggle.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
Toggle.Text = "NXR"
Toggle.TextColor3 = Color3.fromRGB(255, 0, 50)
Toggle.TextSize = 16
Toggle.Font = Enum.Font.GothamBold
Toggle.ZIndex = 10000
Instance.new("UICorner", Toggle).CornerRadius = UDim.new(1, 0)
Instance.new("UIStroke", Toggle).Color = Color3.fromRGB(255, 0, 50)

Toggle.MouseButton1Click:Connect(function()
    Main.Visible = not Main.Visible
end)
