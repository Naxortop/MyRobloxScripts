-- [[ NAXOR HUB - VERSION 4.0.0 ]] --
local Players = game:GetService("Players")
local LP = Players.LocalPlayer
local PG = LP:WaitForChild("PlayerGui")

-- إزالة أي نسخة سابقة
if PG:FindFirstChild("NaxorKing") then PG.NaxorKing:Destroy() end

-- إنشاء الواجهة الأساسية
local Screen = Instance.new("ScreenGui", PG)
Screen.Name = "NaxorKing"
Screen.ResetOnSpawn = false

-- الإطار الرئيسي (Main Frame)
local Main = Instance.new("Frame", Screen)
Main.Name = "MainFrame"
Main.Size = UDim2.new(0, 580, 0, 400)
Main.Position = UDim2.new(0.5, -290, 0.5, -200)
Main.BackgroundColor3 = Color3.fromRGB(12, 12, 12)
Main.BorderSizePixel = 0
Main.Active = true
Main.Draggable = true -- تفعيل السحب
local Corner = Instance.new("UICorner", Main)
Corner.CornerRadius = UDim.new(0, 15)

-- ✨ نيون أحمر (Glow)
local Neon = Instance.new("Frame", Main)
Neon.Name = "NeonGlow"
Neon.ZIndex = 0
Neon.Size = UDim2.new(1, 6, 1, 6)
Neon.Position = UDim2.new(0, -3, 0, -3)
Neon.BackgroundColor3 = Color3.fromRGB(255, 0, 50)
local NeonCorner = Instance.new("UICorner", Neon)
NeonCorner.CornerRadius = UDim.new(0, 16)

-- 🔴 زر الفتح والإغلاق (N)
local Toggle = Instance.new("TextButton", Screen)
Toggle.Name = "ToggleButton"
Toggle.Size = UDim2.new(0, 55, 0, 55)
Toggle.Position = UDim2.new(0, 20, 0, 20)
Toggle.BackgroundColor3 = Color3.fromRGB(255, 0, 50)
Toggle.Text = "N"
Toggle.TextColor3 = Color3.new(1, 1, 1)
Toggle.TextSize = 28
Toggle.Font = Enum.Font.GothamBold
Toggle.Draggable = true
local ToggleCorner = Instance.new("UICorner", Toggle)
ToggleCorner.CornerRadius = UDim.new(1, 0)

Toggle.MouseButton1Click:Connect(function()
    Main.Visible = not Main.Visible
end)

-- 🔝 شعار N.X.R والصفحات
local Logo = Instance.new("TextLabel", Main)
Logo.Text = "N.X.R <font color='#ff0032'>>> > ></font>"
Logo.RichText = true
Logo.Size = UDim2.new(0, 200, 0, 50)
Logo.Position = UDim2.new(0, 20, 0, 10)
Logo.BackgroundTransparency = 1
Logo.TextColor3 = Color3.new(1, 1, 1)
Logo.TextSize = 24
Logo.Font = Enum.Font.GothamBold
Logo.TextXAlignment = Enum.TextXAlignment.Left

local function MakeTab(name, xPos, isActive)
    local TabBtn = Instance.new("TextButton", Main)
    TabBtn.Text = name
    TabBtn.Size = UDim2.new(0, 80, 0, 40)
    TabBtn.Position = UDim2.new(1, xPos, 0, 15)
    TabBtn.BackgroundTransparency = 1
    TabBtn.TextSize = 15
    TabBtn.Font = Enum.Font.GothamBold
    TabBtn.TextColor3 = isActive and Color3.fromRGB(255, 0, 50) or Color3.fromRGB(160, 160, 160)
end
MakeTab("Home", -260, true)
MakeTab("Pages", -170, false)
MakeTab("Credits", -85, false)

-- 👤 قسم الصورة والـ STATE
local PicFrame = Instance.new("Frame", Main)
PicFrame.Size = UDim2.new(0, 70, 0, 70)
PicFrame.Position = UDim2.new(0, 25, 0, 80)
PicFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
Instance.new("UICorner", PicFrame)

local Avatar = Instance.new("ImageLabel", PicFrame)
Avatar.Size = UDim2.new(0.85, 0, 0.85, 0)
Avatar.Position = UDim2.new(0.075, 0, 0.075, 0)
Avatar.Image = "rbxthumb://type=AvatarHeadShot&id="..LP.UserId.."&w=150&h=150"
Avatar.BackgroundTransparency = 1
Instance.new("UICorner", Avatar)

local StateBox = Instance.new("Frame", Main)
StateBox.Size = UDim2.new(0, 110, 0, 38)
StateBox.Position = UDim2.new(0, 105, 0, 80)
StateBox.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
Instance.new("UICorner", StateBox)

local StateLabel = Instance.new("TextLabel", StateBox)
StateLabel.Text = "STATE"
StateLabel.Size = UDim2.new(1, 0, 1, 0)
StateLabel.TextColor3 = Color3.fromRGB(255, 0, 50)
StateLabel.BackgroundTransparency = 1
StateLabel.TextSize = 16
StateLabel.Font = Enum.Font.GothamBold

-- 📝 المعلومات (التعديل المطلوب: خط 15 ومسافات)
local InfoLabel = Instance.new("TextLabel", Main)
InfoLabel.Size = UDim2.new(0, 300, 0, 160)
InfoLabel.Position = UDim2.new(0, 30, 0, 165) -- مسافة وسيعة تحت STATE
InfoLabel.BackgroundTransparency = 1
InfoLabel.TextColor3 = Color3.fromRGB(235, 235, 235)
InfoLabel.TextSize = 15 -- الحجم المطلوب
InfoLabel.Font = Enum.Font.GothamBold
InfoLabel.TextXAlignment = Enum.TextXAlignment.Left
InfoLabel.TextYAlignment = Enum.TextYAlignment.Top
InfoLabel.LineHeight = 1.9 -- مسافات وسيعة بين الأسطر
InfoLabel.Text = "USER: " .. LP.Name:upper() .. "\nSTATUS: ONLINE\nVERSION: 4.0.0\nN.X.R HUB ACTIVE"

-- 🔘 الأزرار السفلية الثلاثة
local function CreateBtn(name, xPos)
    local B = Instance.new("TextButton", Main)
    B.Size = UDim2.new(0, 175, 0, 85)
    B.Position = UDim2.new(0, xPos, 0, 300)
    B.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    B.Text = name
    B.TextColor3 = Color3.new(1, 1, 1)
    B.Font = Enum.Font.GothamBold
    B.TextSize = 16
    Instance.new("UICorner", B)
    
    local BNeon = Instance.new("Frame", B)
    BNeon.ZIndex = 0
    BNeon.Size = UDim2.new(1, 2, 1, 2)
    BNeon.Position = UDim2.new(0, -1, 0, -1)
    BNeon.BackgroundColor3 = Color3.fromRGB(255, 0, 50)
    Instance.new("UICorner", BNeon)
end

CreateBtn("CONFIG", 15)
CreateBtn("SETTING", 202)
CreateBtn("AD (إعلان)", 389)

print("Naxor Hub V4 Loaded Successfully!")
