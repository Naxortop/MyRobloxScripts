-- [[ NAXOR V4 - FULL SOURCE CODE - NO ABBREVIATIONS ]] --

local Players = game:GetService("Players")
local LP = Players.LocalPlayer
local PlayerGui = LP:WaitForChild("PlayerGui")

-- تنظيف النسخ القديمة تماماً
if PlayerGui:FindFirstChild("Naxor_Detailed_System") then
    PlayerGui.Naxor_Detailed_System:Destroy()
end

-- إنشاء حاوية الشاشة (ScreenGui)
local Screen = Instance.new("ScreenGui")
Screen.Name = "Naxor_Detailed_System"
Screen.Parent = PlayerGui
Screen.ResetOnSpawn = false
Screen.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
Screen.DisplayOrder = 9999 -- لضمان بقائه فوق كل شيء

-- ⬛ اللوحة الرئيسية (Main Frame)
local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Parent = Screen
MainFrame.Size = UDim2.new(0, 580, 0, 400)
MainFrame.Position = UDim2.new(0.5, -290, 0.5, -200)
MainFrame.BackgroundColor3 = Color3.fromRGB(12, 12, 12)
MainFrame.BorderSizePixel = 0
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.Visible = true

-- زوايا مستديرة للوحة الرئيسية
local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 15)
MainCorner.Parent = MainFrame

-- ✨ إطار نيون أحمر (Main Stroke)
local MainStroke = Instance.new("UIStroke")
MainStroke.Name = "MainStroke"
MainStroke.Parent = MainFrame
MainStroke.Color = Color3.fromRGB(255, 0, 50)
MainStroke.Thickness = 2.5
MainStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border

-- 🔝 العنوان العلوي (N.X.R)
local LogoLabel = Instance.new("TextLabel")
LogoLabel.Name = "LogoLabel"
LogoLabel.Parent = MainFrame
LogoLabel.Text = "N.X.R <font color='#FF0032'>>>> </font>"
LogoLabel.RichText = true
LogoLabel.Size = UDim2.new(0, 200, 0, 60)
LogoLabel.Position = UDim2.new(0, 20, 0, 5)
LogoLabel.BackgroundTransparency = 1 -- شفافية تامة لإزالة تضليل الحروف
LogoLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
LogoLabel.TextSize = 30
LogoLabel.Font = Enum.Font.GothamBold
LogoLabel.TextXAlignment = Enum.TextXAlignment.Left

-- 👤 قسم صورة اللاعب (Avatar Image)
local AvatarImage = Instance.new("ImageLabel")
AvatarImage.Name = "AvatarImage"
AvatarImage.Parent = MainFrame
AvatarImage.Size = UDim2.new(0, 75, 0, 75)
AvatarImage.Position = UDim2.new(0, 25, 0, 80)
AvatarImage.Image = "rbxthumb://type=AvatarHeadShot&id="..LP.UserId.."&w=150&h=150"
AvatarImage.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
AvatarImage.BorderSizePixel = 0

local AvatarCorner = Instance.new("UICorner")
AvatarCorner.CornerRadius = UDim.new(1, 0)
AvatarCorner.Parent = AvatarImage

local AvatarStroke = Instance.new("UIStroke")
AvatarStroke.Parent = AvatarImage
AvatarStroke.Color = Color3.fromRGB(255, 0, 50)
AvatarStroke.Thickness = 1.5

-- 🏷️ قسم معلومات اللاعب (Info Label)
local InfoLabel = Instance.new("TextLabel")
InfoLabel.Name = "InfoLabel"
InfoLabel.Parent = MainFrame
InfoLabel.Size = UDim2.new(0, 180, 0, 100)
InfoLabel.Position = UDim2.new(0, 25, 0, 165)
InfoLabel.BackgroundTransparency = 1 -- شفافية تامة
InfoLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
InfoLabel.TextSize = 14
InfoLabel.Font = Enum.Font.GothamBold
InfoLabel.TextXAlignment = Enum.TextXAlignment.Left
InfoLabel.Text = "USER: " .. LP.Name:upper() .. "\nSTATUS: ONLINE\nVERSION: 4.0.0\nPLATFORM: MOBILE"

-- 🖼️ المربع المركزي الكبير (Center Box)
local CenterBox = Instance.new("Frame")
CenterBox.Name = "CenterBox"
CenterBox.Parent = MainFrame
CenterBox.Size = UDim2.new(0, 335, 0, 215)
CenterBox.Position = UDim2.new(0, 220, 0, 75)
CenterBox.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
CenterBox.BorderSizePixel = 0

local CenterCorner = Instance.new("UICorner")
CenterCorner.CornerRadius = UDim.new(0, 10)
CenterCorner.Parent = CenterBox

local CenterStroke = Instance.new("UIStroke")
CenterStroke.Parent = CenterBox
CenterStroke.Color = Color3.fromRGB(255, 0, 50)
CenterStroke.Thickness = 1

-- 🔘 الأزرار السفلية الثلاثة (CONFIG, SETTING, AD)
local ConfigBtn = Instance.new("TextButton")
ConfigBtn.Name = "ConfigBtn"
ConfigBtn.Parent = MainFrame
ConfigBtn.Size = UDim2.new(0, 175, 0, 80)
ConfigBtn.Position = UDim2.new(0, 15, 0, 305)
ConfigBtn.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
ConfigBtn.Text = "CONFIG"
ConfigBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
ConfigBtn.Font = Enum.Font.GothamBold
ConfigBtn.TextSize = 16
Instance.new("UICorner", ConfigBtn).CornerRadius = UDim.new(0, 10)
Instance.new("UIStroke", ConfigBtn).Color = Color3.fromRGB(255, 0, 50)

local SettingBtn = Instance.new("TextButton")
SettingBtn.Name = "SettingBtn"
SettingBtn.Parent = MainFrame
SettingBtn.Size = UDim2.new(0, 175, 0, 80)
SettingBtn.Position = UDim2.new(0, 205, 0, 305)
SettingBtn.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
SettingBtn.Text = "SETTING"
SettingBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
SettingBtn.Font = Enum.Font.GothamBold
SettingBtn.TextSize = 16
Instance.new("UICorner", SettingBtn).CornerRadius = UDim.new(0, 10)
Instance.new("UIStroke", SettingBtn).Color = Color3.fromRGB(255, 0, 50)

local AdBtn = Instance.new("TextButton")
AdBtn.Name = "AdBtn"
AdBtn.Parent = MainFrame
AdBtn.Size = UDim2.new(0, 175, 0, 80)
AdBtn.Position = UDim2.new(0, 395, 0, 305)
AdBtn.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
AdBtn.Text = "AD (ADS)"
AdBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
AdBtn.Font = Enum.Font.GothamBold
AdBtn.TextSize = 16
Instance.new("UICorner", AdBtn).CornerRadius = UDim.new(0, 10)
Instance.new("UIStroke", AdBtn).Color = Color3.fromRGB(255, 0, 50)

-- 🔴🔴 الزر العائم (Toggle Button) - الزاوية اليمنى العلوية 🔴🔴
local ToggleButton = Instance.new("TextButton")
ToggleButton.Name = "ToggleButton"
ToggleButton.Parent = Screen
ToggleButton.Size = UDim2.new(0, 60, 0, 60)
-- التموضع أقصى اليمين من الأعلى
ToggleButton.Position = UDim2.new(1, -70, 0, 20)
ToggleButton.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
ToggleButton.Text = "NXR"
ToggleButton.TextColor3 = Color3.fromRGB(255, 0, 50)
ToggleButton.TextSize = 18
ToggleButton.Font = Enum.Font.GothamBold
ToggleButton.Active = true
ToggleButton.Draggable = true
ToggleButton.ZIndex = 10000

local ToggleCorner = Instance.new("UICorner")
ToggleCorner.CornerRadius = UDim.new(1, 0)
ToggleCorner.Parent = ToggleButton

local ToggleStroke = Instance.new("UIStroke")
ToggleStroke.Parent = ToggleButton
ToggleStroke.Color = Color3.fromRGB(255, 0, 50)
ToggleStroke.Thickness = 3

-- وظيفة التبديل (فتح وإغلاق القائمة)
ToggleButton.MouseButton1Click:Connect(function()
    if MainFrame.Visible == true then
        MainFrame.Visible = false
    else
        MainFrame.Visible = true
    end
end)

print("Naxor V4: Full Detailed Script Loaded Successfully.")
