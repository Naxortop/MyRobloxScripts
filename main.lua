-- [[ NAXOR V4 - FULL DETAILED SOURCE - NO SHORTCUTS ]] --

local Players = game:GetService("Players")
local LP = Players.LocalPlayer
local PlayerGui = LP:WaitForChild("PlayerGui")
local RunService = game:GetService("RunService")

-- [1] تنظيف أي نسخة قديمة موجودة
local OldGui = PlayerGui:FindFirstChild("Naxor_Official_V4")
if OldGui then
    OldGui:Destroy()
end

-- [2] إنشاء حاوية الشاشة (ScreenGui)
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "Naxor_Official_V4"
ScreenGui.Parent = PlayerGui
ScreenGui.ResetOnSpawn = false
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.DisplayOrder = 99999

-- [3] اللوحة السوداء الرئيسية (Main Frame)
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
MainStroke.Parent = MainFrame
MainStroke.Color = Color3.fromRGB(255, 0, 50) -- نيون أحمر
MainStroke.Thickness = 2.5
MainStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border

-- [4] العنوان العلوي (N.X.R >>>)
local LogoLabel = Instance.new("TextLabel")
LogoLabel.Name = "LogoLabel"
LogoLabel.Parent = MainFrame
LogoLabel.Text = "N.X.R <font color='#FF0032'>>>> </font>"
LogoLabel.RichText = true
LogoLabel.Size = UDim2.new(0, 200, 0, 60)
LogoLabel.Position = UDim2.new(0, 25, 0, 10)
LogoLabel.BackgroundTransparency = 1
LogoLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
LogoLabel.TextSize = 28
LogoLabel.Font = Enum.Font.GothamBold
LogoLabel.TextXAlignment = Enum.TextXAlignment.Left

-- [5] قسم صورة اللاعب
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

-- [6] مستطيل الـ STATE (العنوان فقط)
local StateFrame = Instance.new("Frame")
StateFrame.Name = "StateFrame"
StateFrame.Parent = MainFrame
StateFrame.Size = UDim2.new(0, 95, 0, 35)
StateFrame.Position = UDim2.new(0, 110, 0, 85)
StateFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
StateFrame.BorderSizePixel = 0

local StateCorner = Instance.new("UICorner")
StateCorner.CornerRadius = UDim.new(0, 5)
StateCorner.Parent = StateFrame

local StateTitle = Instance.new("TextLabel")
StateTitle.Name = "StateTitle"
StateTitle.Parent = StateFrame
StateTitle.Text = "STATE"
StateTitle.Size = UDim2.new(1, 0, 1, 0)
StateTitle.BackgroundTransparency = 1
StateTitle.TextColor3 = Color3.fromRGB(255, 0, 50)
StateTitle.TextSize = 14
StateTitle.Font = Enum.Font.GothamBold

-- [7] قسم المعلومات (تحت الصورة) - يشمل الـ FPS والوقت
local InfoLabel = Instance.new("TextLabel")
InfoLabel.Name = "InfoLabel"
InfoLabel.Parent = MainFrame
InfoLabel.Size = UDim2.new(0, 220, 0, 130)
InfoLabel.Position = UDim2.new(0, 25, 0, 170)
InfoLabel.BackgroundTransparency = 1
InfoLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
InfoLabel.TextSize = 14
InfoLabel.Font = Enum.Font.GothamBold
InfoLabel.TextXAlignment = Enum.TextXAlignment.Left
InfoLabel.LineHeight = 1.6

-- نظام تحديث العدادات (FPS ووقت اللعب)
local StartTime = tick()
RunService.RenderStepped:Connect(function()
    local Elapsed = tick() - StartTime
    local Hours = math.floor(Elapsed / 3600)
    local Minutes = math.floor((Elapsed % 3600) / 60)
    local Seconds = math.floor(Elapsed % 60)
    local FPS = math.floor(1 / RunService.RenderStepped:Wait())
    local TimeStr = string.format("%02d:%02d:%02d", Hours, Minutes, Seconds)
    
    InfoLabel.Text = "USER: " .. LP.Name:upper() .. 
                   "\nSTATUS: ONLINE" .. 
                   "\nFPS: " .. FPS .. 
                   "\nPLAYTIME: " .. TimeStr .. 
                   "\nN.X.R HUB ACTIVE"
end)

-- [8] المربع المركزي الكبير (Center Box)
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

-- [9] زر CONFIG السفلي
local ConfigBtn = Instance.new("TextButton")
ConfigBtn.Name = "CONFIG_Btn"
ConfigBtn.Parent = MainFrame
ConfigBtn.Size = UDim2.new(0, 185, 0, 95)
ConfigBtn.Position = UDim2.new(0, 10, 0, 315)
ConfigBtn.BackgroundColor3 = Color3.fromRGB(22, 22, 22)
ConfigBtn.Text = "CONFIG"
ConfigBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
ConfigBtn.Font = Enum.Font.GothamBold
ConfigBtn.TextSize = 18
ConfigBtn.BorderSizePixel = 0
Instance.new("UICorner", ConfigBtn).CornerRadius = UDim.new(0, 10)
local ConfigStroke = Instance.new("UIStroke", ConfigBtn)
ConfigStroke.Color = Color3.fromRGB(40, 40, 40)
ConfigStroke.Thickness = 1.5

-- [10] زر SETTING السفلي
local SettingBtn = Instance.new("TextButton")
SettingBtn.Name = "SETTING_Btn"
SettingBtn.Parent = MainFrame
SettingBtn.Size = UDim2.new(0, 185, 0, 95)
SettingBtn.Position = UDim2.new(0, 205, 0, 315)
SettingBtn.BackgroundColor3 = Color3.fromRGB(22, 22, 22)
SettingBtn.Text = "SETTING"
SettingBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
SettingBtn.Font = Enum.Font.GothamBold
SettingBtn.TextSize = 18
SettingBtn.BorderSizePixel = 0
Instance.new("UICorner", SettingBtn).CornerRadius = UDim.new(0, 10)
local SettingStroke = Instance.new("UIStroke", SettingBtn)
SettingStroke.Color = Color3.fromRGB(40, 40, 40)
SettingStroke.Thickness = 1.5

-- [11] زر AD السفلي
local AdBtn = Instance.new("TextButton")
AdBtn.Name = "AD_Btn"
AdBtn.Parent = MainFrame
AdBtn.Size = UDim2.new(0, 185, 0, 95)
AdBtn.Position = UDim2.new(0, 400, 0, 315)
AdBtn.BackgroundColor3 = Color3.fromRGB(22, 22, 22)
AdBtn.Text = "AD (إعلان)"
AdBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
AdBtn.Font = Enum.Font.GothamBold
AdBtn.TextSize = 18
AdBtn.BorderSizePixel = 0
Instance.new("UICorner", AdBtn).CornerRadius = UDim.new(0, 10)
local AdStroke = Instance.new("UIStroke", AdBtn)
AdStroke.Color = Color3.fromRGB(40, 40, 40)
AdStroke.Thickness = 1.5

-- [12] الزر العائم (NXR Toggle)
local Toggle = Instance.new("TextButton")
Toggle.Name = "NXR_Toggle"
Toggle.Parent = ScreenGui
Toggle.Size = UDim2.new(0, 60, 0, 60)
Toggle.Position = UDim2.new(1, -75, 0, 20)
Toggle.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
Toggle.Text = "NXR"
Toggle.TextColor3 = Color3.fromRGB(255, 0, 50)
Toggle.Font = Enum.Font.GothamBold
Toggle.TextSize = 16
Toggle.Active = true
Toggle.Draggable = true
Toggle.ZIndex = 100000

local ToggleCorner = Instance.new("UICorner")
ToggleCorner.CornerRadius = UDim.new(1, 0)
ToggleCorner.Parent = Toggle

local ToggleStroke = Instance.new("UIStroke")
ToggleStroke.Parent = Toggle
ToggleStroke.Color = Color3.fromRGB(255, 0, 50)
ToggleStroke.Thickness = 3

Toggle.MouseButton1Click:Connect(function()
    MainFrame.Visible = not MainFrame.Visible
end)
