-- [[ NAXOR V4 - FINAL VERIFIED SOURCE ]] --

local Players = game:GetService("Players")
local LP = Players.LocalPlayer
local PlayerGui = LP:WaitForChild("PlayerGui")
local RunService = game:GetService("RunService")

-- [1] تنظيف جذري
if PlayerGui:FindFirstChild("Naxor_Official_V4") then
    PlayerGui.Naxor_Official_V4:Destroy()
end

-- [2] حاوية الشاشة
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "Naxor_Official_V4"
ScreenGui.Parent = PlayerGui
ScreenGui.ResetOnSpawn = false

-- [3] اللوحة الرئيسية
local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Parent = ScreenGui
MainFrame.Size = UDim2.new(0, 600, 0, 420)
MainFrame.Position = UDim2.new(0.5, -300, 0.5, -210)
MainFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
MainFrame.Active = true
MainFrame.Draggable = true 

local MainCorner = Instance.new("UICorner", MainFrame)
MainCorner.CornerRadius = UDim.new(0, 15)

local MainStroke = Instance.new("UIStroke", MainFrame)
MainStroke.Color = Color3.fromRGB(255, 0, 50)
MainStroke.Thickness = 2.5

-- [4] العنوان N.X.R
local LogoLabel = Instance.new("TextLabel", MainFrame)
LogoLabel.Text = "N.X.R <font color='#FF0032'>>>> </font>"
LogoLabel.RichText = true
LogoLabel.Size = UDim2.new(0, 200, 0, 60)
LogoLabel.Position = UDim2.new(0, 25, 0, 10)
LogoLabel.BackgroundTransparency = 1
LogoLabel.TextColor3 = Color3.new(1, 1, 1)
LogoLabel.TextSize = 28
LogoLabel.Font = Enum.Font.GothamBold
LogoLabel.TextXAlignment = "Left"

-- [5] صورة اللاعب
local AvatarImage = Instance.new("ImageLabel", MainFrame)
AvatarImage.Size = UDim2.new(0, 75, 0, 75)
AvatarImage.Position = UDim2.new(0, 25, 0, 85)
AvatarImage.Image = "rbxthumb://type=AvatarHeadShot&id="..LP.UserId.."&w=150&h=150"
AvatarImage.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
Instance.new("UICorner", AvatarImage).CornerRadius = UDim.new(0, 10)

-- [6] مستطيل الـ STATE (عنوان فقط - فاضي من الداخل)
local StateFrame = Instance.new("Frame", MainFrame)
StateFrame.Size = UDim2.new(0, 95, 0, 35)
StateFrame.Position = UDim2.new(0, 110, 0, 85)
StateFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
Instance.new("UICorner", StateFrame).CornerRadius = UDim.new(0, 5)

local StateTitle = Instance.new("TextLabel", StateFrame)
StateTitle.Text = "STATE"
StateTitle.Size = UDim2.new(1, 0, 1, 0)
StateTitle.BackgroundTransparency = 1
StateTitle.TextColor3 = Color3.fromRGB(255, 0, 50)
StateTitle.TextSize = 14
StateTitle.Font = Enum.Font.GothamBold

-- [7] قسم المعلومات (هنا الـ FPS والوقت فقط)
local InfoLabel = Instance.new("TextLabel", MainFrame)
InfoLabel.Size = UDim2.new(0, 220, 0, 130)
InfoLabel.Position = UDim2.new(0, 25, 0, 170)
InfoLabel.BackgroundTransparency = 1
InfoLabel.TextColor3 = Color3.new(1, 1, 1)
InfoLabel.TextSize = 14
InfoLabel.Font = Enum.Font.GothamBold
InfoLabel.TextXAlignment = "Left"
InfoLabel.LineHeight = 1.6

local StartTime = tick()
RunService.RenderStepped:Connect(function()
    local Elapsed = tick() - StartTime
    local Hours = math.floor(Elapsed / 3600)
    local Minutes = math.floor((Elapsed % 3600) / 60)
    local Seconds = math.floor(Elapsed % 60)
    local FPS = math.floor(1 / RunService.RenderStepped:Wait())
    local TimeStr = string.format("%02d:%02d:%02d", Hours, Minutes, Seconds)
    
    InfoLabel.Text = "USER: "..LP.Name:upper().."\nSTATUS: ONLINE\nFPS: "..FPS.."\nPLAYTIME: "..TimeStr.."\nN.X.R HUB ACTIVE"
end)

-- [8] المربع المركزي
local CenterBox = Instance.new("Frame", MainFrame)
CenterBox.Size = UDim2.new(0, 355, 0, 220)
CenterBox.Position = UDim2.new(0, 225, 0, 75)
CenterBox.BackgroundColor3 = Color3.fromRGB(12, 12, 12)
Instance.new("UICorner", CenterBox).CornerRadius = UDim.new(0, 10)
local CenterStroke = Instance.new("UIStroke", CenterBox)
CenterStroke.Color = Color3.fromRGB(255, 0, 50)
CenterStroke.Thickness = 1.5

-- [9] الأزرار السفلية (مفصلة بدون اختصار)
local ConfigBtn = Instance.new("TextButton", MainFrame)
ConfigBtn.Size = UDim2.new(0, 185, 0, 95)
ConfigBtn.Position = UDim2.new(0, 10, 0, 315)
ConfigBtn.BackgroundColor3 = Color3.fromRGB(22, 22, 22)
ConfigBtn.Text = "CONFIG"
ConfigBtn.TextColor3 = Color3.new(1, 1, 1)
ConfigBtn.TextSize = 18
ConfigBtn.Font = "GothamBold"
Instance.new("UICorner", ConfigBtn).CornerRadius = UDim.new(0, 10)
Instance.new("UIStroke", ConfigBtn).Color = Color3.fromRGB(40, 40, 40)

local SettingBtn = Instance.new("TextButton", MainFrame)
SettingBtn.Size = UDim2.new(0, 185, 0, 95)
SettingBtn.Position = UDim2.new(0, 205, 0, 315)
SettingBtn.BackgroundColor3 = Color3.fromRGB(22, 22, 22)
SettingBtn.Text = "SETTING"
SettingBtn.TextColor3 = Color3.new(1, 1, 1)
SettingBtn.TextSize = 18
SettingBtn.Font = "GothamBold"
Instance.new("UICorner", SettingBtn).CornerRadius = UDim.new(0, 10)
Instance.new("UIStroke", SettingBtn).Color = Color3.fromRGB(40, 40, 40)

local AdBtn = Instance.new("TextButton", MainFrame)
AdBtn.Size = UDim2.new(0, 185, 0, 95)
AdBtn.Position = UDim2.new(0, 400, 0, 315)
AdBtn.BackgroundColor3 = Color3.fromRGB(22, 22, 22)
AdBtn.Text = "AD (إعلان)"
AdBtn.TextColor3 = Color3.new(1, 1, 1)
AdBtn.TextSize = 18
AdBtn.Font = "GothamBold"
Instance.new("UICorner", AdBtn).CornerRadius = UDim.new(0, 10)
Instance.new("UIStroke", AdBtn).Color = Color3.fromRGB(40, 40, 40)

-- [10] الزر العائم
local Toggle = Instance.new("TextButton", ScreenGui)
Toggle.Size = UDim2.new(0, 60, 0, 60)
Toggle.Position = UDim2.new(1, -75, 0, 20)
Toggle.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
Toggle.Text = "NXR"
Toggle.TextColor3 = Color3.fromRGB(255, 0, 50)
Toggle.Font = "GothamBold"
Toggle.TextSize = 16
Toggle.Draggable = true
Instance.new("UICorner", Toggle).CornerRadius = UDim.new(1, 0)
local TS = Instance.new("UIStroke", Toggle)
TS.Color = Color3.fromRGB(255, 0, 50)
TS.Thickness = 3

Toggle.MouseButton1Click:Connect(function()
    MainFrame.Visible = not MainFrame.Visible
end)
