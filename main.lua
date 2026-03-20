-- [[ NAXOR V4 - FULL DETAILED REPLICA - NO SHORTCUTS ]] --

-- [1] تعريف الخدمات الأساسية (Services)
local Players = game:GetService("Players")
local LP = Players.LocalPlayer
local PlayerGui = LP:WaitForChild("PlayerGui")

-- [2] تنظيف النسخ القديمة لضمان عدم تداخل الواجهات
if PlayerGui:FindFirstChild("Naxor_System_V4") then
    PlayerGui.Naxor_System_V4:Destroy()
end

-- [3] إنشاء حاوية الشاشة الرئيسية (ScreenGui)
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "Naxor_System_V4"
ScreenGui.Parent = PlayerGui
ScreenGui.ResetOnSpawn = false
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.DisplayOrder = 99999

-- [4] إنشاء اللوحة السوداء الرئيسية (Main Frame)
local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Parent = ScreenGui
MainFrame.Size = UDim2.new(0, 600, 0, 420)
MainFrame.Position = UDim2.new(0.5, -300, 0.5, -210)
MainFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
MainFrame.BorderSizePixel = 0
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.Visible = true

local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 15)
MainCorner.Parent = MainFrame

local MainStroke = Instance.new("UIStroke")
MainStroke.Name = "MainStroke"
MainStroke.Parent = MainFrame
MainStroke.Color = Color3.fromRGB(255, 0, 50)
MainStroke.Thickness = 2.5
MainStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border

-- [5] العنوان العلوي (N.X.R >>>) بدون تضليل
local LogoLabel = Instance.new("TextLabel")
LogoLabel.Name = "LogoLabel"
LogoLabel.Parent = MainFrame
LogoLabel.Text = "N.X.R <font color='#FF0032'>>>> </font>"
LogoLabel.RichText = true
LogoLabel.Size = UDim2.new(0, 200, 0, 60)
LogoLabel.Position = UDim2.new(0, 25, 0, 10)
LogoLabel.BackgroundTransparency = 1 -- شفاف تماماً لإزالة تضليل الحروف
LogoLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
LogoLabel.TextSize = 28
LogoLabel.Font = Enum.Font.GothamBold
LogoLabel.TextXAlignment = Enum.TextXAlignment.Left

-- [6] التبويبات العلوية (Tabs: Home, Pages, Credits)
-- تبويب Home
local TabHome = Instance.new("TextButton")
TabHome.Name = "TabHome"
TabHome.Parent = MainFrame
TabHome.Text = "Home"
TabHome.Size = UDim2.new(0, 70, 0, 50)
TabHome.Position = UDim2.new(1, -260, 0, 10)
TabHome.BackgroundTransparency = 1
TabHome.TextColor3 = Color3.fromRGB(255, 0, 50)
TabHome.TextSize = 15
TabHome.Font = Enum.Font.GothamBold

-- تبويب Pages
local TabPages = Instance.new("TextButton")
TabPages.Name = "TabPages"
TabPages.Parent = MainFrame
TabPages.Text = "Pages"
TabPages.Size = UDim2.new(0, 70, 0, 50)
TabPages.Position = UDim2.new(1, -180, 0, 10)
TabPages.BackgroundTransparency = 1
TabPages.TextColor3 = Color3.fromRGB(150, 150, 150)
TabPages.TextSize = 15
TabPages.Font = Enum.Font.GothamBold

-- تبويب Credits
local TabCredits = Instance.new("TextButton")
TabCredits.Name = "TabCredits"
TabCredits.Parent = MainFrame
TabCredits.Text = "Credits"
TabCredits.Size = UDim2.new(0, 70, 0, 50)
TabCredits.Position = UDim2.new(1, -100, 0, 10)
TabCredits.BackgroundTransparency = 1
TabCredits.TextColor3 = Color3.fromRGB(150, 150, 150)
TabCredits.TextSize = 15
TabCredits.Font = Enum.Font.GothamBold

-- [7] قسم صورة اللاعب (Avatar Image)
local AvatarImage = Instance.new("ImageLabel")
AvatarImage.Name = "AvatarImage"
AvatarImage.Parent = MainFrame
AvatarImage.Size = UDim2.new(0, 75, 0, 75)
AvatarImage.Position = UDim2.new(0, 25, 0, 85)
AvatarImage.Image = "rbxthumb://type=AvatarHeadShot&id="..LP.UserId.."&w=150&h=150"
AvatarImage.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
AvatarImage.BorderSizePixel = 0

local AvatarCorner = Instance.new("UICorner")
AvatarCorner.CornerRadius = UDim.new(0, 10)
AvatarCorner.Parent = AvatarImage

-- [8] مستطيل STATE (بجانب الصورة)
local StateFrame = Instance.new("Frame")
StateFrame.Name = "StateFrame"
StateFrame.Parent = MainFrame
StateFrame.Size = UDim2.new(0, 95, 0, 35)
StateFrame.Position = UDim2.new(0, 110, 0, 90)
StateFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
StateFrame.BorderSizePixel = 0

local StateCorner = Instance.new("UICorner")
StateCorner.CornerRadius = UDim.new(0, 5)
StateCorner.Parent = StateFrame

local StateLabel = Instance.new("TextLabel")
StateLabel.Name = "StateLabel"
StateLabel.Parent = StateFrame
StateLabel.Text = "STATE"
StateLabel.Size = UDim2.new(1, 0, 1, 0)
StateLabel.BackgroundTransparency = 1
StateLabel.TextColor3 = Color3.fromRGB(255, 0, 50)
StateLabel.TextSize = 14
StateLabel.Font = Enum.Font.GothamBold

-- [9] نصوص معلومات اللاعب (Info Labels) تحت الصورة
local InfoLabel = Instance.new("TextLabel")
InfoLabel.Name = "InfoLabel"
InfoLabel.Parent = MainFrame
InfoLabel.Size = UDim2.new(0, 200, 0, 120)
InfoLabel.Position = UDim2.new(0, 25, 0, 170)
InfoLabel.BackgroundTransparency = 1
InfoLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
InfoLabel.TextSize = 13
InfoLabel.Font = Enum.Font.GothamBold
InfoLabel.TextXAlignment = Enum.TextXAlignment.Left
InfoLabel.LineHeight = 1.8
InfoLabel.Text = "USER: " .. LP.Name:upper() .. "\nSTATUS: ONLINE\nVERSION: 4.0.0\nN.X.R HUB ACTIVE"

-- [10] المربع المركزي الكبير (Center Display Box)
local CenterBox = Instance.new("Frame")
CenterBox.Name = "CenterBox"
CenterBox.Parent = MainFrame
CenterBox.Size = UDim2.new(0, 355, 0, 220)
CenterBox.Position = UDim2.new(0, 225, 0, 75)
CenterBox.BackgroundColor3 = Color3.fromRGB(12, 12, 12)
CenterBox.BorderSizePixel = 0

local CenterCorner = Instance.new("UICorner")
CenterCorner.CornerRadius = UDim.new(0, 10)
CenterCorner.Parent = CenterBox

local CenterStroke = Instance.new("UIStroke")
CenterStroke.Parent = CenterBox
CenterStroke.Color = Color3.fromRGB(255, 0, 50)
CenterStroke.Thickness = 1.5

-- [11] الأزرار السفلية الثلاثة (CONFIG, SETTING, AD)
-- زر CONFIG
local ConfigBtn = Instance.new("TextButton")
ConfigBtn.Name = "ConfigBtn"
ConfigBtn.Parent = MainFrame
ConfigBtn.Size = UDim2.new(0, 185, 0, 95)
ConfigBtn.Position = UDim2.new(0, 10, 0, 315)
ConfigBtn.BackgroundColor3 = Color3.fromRGB(22, 22, 22)
ConfigBtn.Text = "CONFIG"
ConfigBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
ConfigBtn.TextSize = 16
ConfigBtn.Font = Enum.Font.GothamBold
Instance.new("UICorner", ConfigBtn).CornerRadius = UDim.new(0, 10)
Instance.new("UIStroke", ConfigBtn).Color = Color3.fromRGB(40, 40, 40)

-- زر SETTING
local SettingBtn = Instance.new("TextButton")
SettingBtn.Name = "SettingBtn"
SettingBtn.Parent = MainFrame
SettingBtn.Size = UDim2.new(0, 185, 0, 95)
SettingBtn.Position = UDim2.new(0, 205, 0, 315)
SettingBtn.BackgroundColor3 = Color3.fromRGB(22, 22, 22)
SettingBtn.Text = "SETTING"
SettingBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
SettingBtn.TextSize = 16
SettingBtn.Font = Enum.Font.GothamBold
Instance.new("UICorner", SettingBtn).CornerRadius = UDim.new(0, 10)
Instance.new("UIStroke", SettingBtn).Color = Color3.fromRGB(40, 40, 40)

-- زر AD
local AdBtn = Instance.new("TextButton")
AdBtn.Name = "AdBtn"
AdBtn.Parent = MainFrame
AdBtn.Size = UDim2.new(0, 185, 0, 95)
AdBtn.Position = UDim2.new(0, 400, 0, 315)
AdBtn.BackgroundColor3 = Color3.fromRGB(22, 22, 22)
AdBtn.Text = "AD (إعلان)"
AdBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
AdBtn.TextSize = 16
AdBtn.Font = Enum.Font.GothamBold
Instance.new("UICorner", AdBtn).CornerRadius = UDim.new(0, 10)
Instance.new("UIStroke", AdBtn).Color = Color3.fromRGB(40, 40, 40)

-- [12] الزر العائم الصغير (Toggle Button) - فوق يمين الزاوية
local ToggleButton = Instance.new("TextButton")
ToggleButton.Name = "ToggleButton"
ToggleButton.Parent = ScreenGui
ToggleButton.Size = UDim2.new(0, 60, 0, 60)
ToggleButton.Position = UDim2.new(1, -75, 0, 20)
ToggleButton.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
ToggleButton.Text = "NXR"
ToggleButton.TextColor3 = Color3.fromRGB(255, 0, 50)
ToggleButton.TextSize = 16
ToggleButton.Font = Enum.Font.GothamBold
ToggleButton.Active = true
ToggleButton.Draggable = true
ToggleButton.ZIndex = 100000

local ToggleCorner = Instance.new("UICorner")
ToggleCorner.CornerRadius = UDim.new(1, 0)
ToggleCorner.Parent = ToggleButton

local ToggleStroke = Instance.new("UIStroke")
ToggleStroke.Parent = ToggleButton
ToggleStroke.Color = Color3.fromRGB(255, 0, 50)
ToggleStroke.Thickness = 3

-- [13] وظيفة التبديل (فتح وإغلاق القائمة)
ToggleButton.MouseButton1Click:Connect(function()
    MainFrame.Visible = not MainFrame.Visible
end)

print("Naxor V4: Full Replica Script Loaded Successfully.")
