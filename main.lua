-- [[ NAXOR V4 - FINAL MERGED VERSION ]] --

local Players = game:GetService("Players")
local LP = Players.LocalPlayer
local PlayerGui = LP:WaitForChild("PlayerGui")
local RunService = game:GetService("RunService")

-- [1] تنظيف النسخ القديمة
if PlayerGui:FindFirstChild("Naxor_Official_V4") then
    PlayerGui.Naxor_Official_V4:Destroy()
end

-- [2] إنشاء الشاشة
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "Naxor_Official_V4"
ScreenGui.Parent = PlayerGui
ScreenGui.ResetOnSpawn = false
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.DisplayOrder = 99999

-- [3] اللوحة الرئيسية (Main Frame)
local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Parent = ScreenGui
MainFrame.Size = UDim2.new(0, 600, 0, 420)
MainFrame.Position = UDim2.new(0.5, -300, 0.5, -210)
MainFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
MainFrame.BorderSizePixel = 0
MainFrame.Active = true
MainFrame.Draggable = true 

local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 15)
MainCorner.Parent = MainFrame

local MainStroke = Instance.new("UIStroke")
MainStroke.Parent = MainFrame
MainStroke.Color = Color3.fromRGB(255, 0, 50)
MainStroke.Thickness = 2.5

-- [4] العنوان العلوي (N.X.R >>>)
local LogoLabel = Instance.new("TextLabel")
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
AvatarImage.Parent = MainFrame
AvatarImage.Size = UDim2.new(0, 75, 0, 75)
AvatarImage.Position = UDim2.new(0, 25, 0, 85)
AvatarImage.Image = "rbxthumb://type=AvatarHeadShot&id="..LP.UserId.."&w=150&h=150"
AvatarImage.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
Instance.new("UICorner", AvatarImage).CornerRadius = UDim.new(0, 10)

-- [6] مستطيل الـ STATE (مدمج مع FPS و Playtime)
local StateFrame = Instance.new("Frame")
StateFrame.Parent = MainFrame
StateFrame.Size = UDim2.new(0, 105, 0, 75)
StateFrame.Position = UDim2.new(0, 110, 0, 85)
StateFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
Instance.new("UICorner", StateFrame).CornerRadius = UDim.new(0, 8)

local StateTitle = Instance.new("TextLabel")
StateTitle.Parent = StateFrame
StateTitle.Text = "STATE"
StateTitle.Size = UDim2.new(1, 0, 0, 25)
StateTitle.BackgroundTransparency = 1
StateTitle.TextColor3 = Color3.fromRGB(255, 0, 50)
StateTitle.TextSize = 14
StateTitle.Font = Enum.Font.GothamBold

local StateDetails = Instance.new("TextLabel")
StateDetails.Parent = StateFrame
StateDetails.Size = UDim2.new(1, -10, 1, -25)
StateDetails.Position = UDim2.new(0, 5, 0, 25)
StateDetails.BackgroundTransparency = 1
StateDetails.TextColor3 = Color3.fromRGB(255, 255, 255)
StateDetails.TextSize = 11
StateDetails.Font = Enum.Font.GothamBold
StateDetails.TextXAlignment = Enum.TextXAlignment.Left
StateDetails.LineHeight = 1.5

-- كود دمج العدادات
local StartTime = tick()
RunService.RenderStepped:Connect(function()
    local CurrentTime = tick()
    local Elapsed = CurrentTime - StartTime
    local Hours = math.floor(Elapsed / 3600)
    local Minutes = math.floor((Elapsed % 3600) / 60)
    local Seconds = math.floor(Elapsed % 60)
    local FPS = math.floor(1 / RunService.RenderStepped:Wait())
    StateDetails.Text = string.format("FPS: %d\nTIME: %02d:%02d:%02d", FPS, Hours, Minutes, Seconds)
end)

-- [7] بيانات اللاعب تحت الصورة
local InfoLabel = Instance.new("TextLabel")
InfoLabel.Parent = MainFrame
InfoLabel.Size = UDim2.new(0, 200, 0, 100)
InfoLabel.Position = UDim2.new(0, 25, 0, 175)
InfoLabel.BackgroundTransparency = 1
InfoLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
InfoLabel.TextSize = 13
InfoLabel.Font = Enum.Font.GothamBold
InfoLabel.TextXAlignment = Enum.TextXAlignment.Left
InfoLabel.LineHeight = 1.8
InfoLabel.Text = "USER: "..LP.Name:upper().."\nSTATUS: ONLINE\nVERSION: 4.0.0\nN.X.R HUB ACTIVE"

-- [8] المربع المركزي الكبير
local CenterBox = Instance.new("Frame")
CenterBox.Parent = MainFrame
CenterBox.Size = UDim2.new(0, 355, 0, 220)
CenterBox.Position = UDim2.new(0, 225, 0, 75)
CenterBox.BackgroundColor3 = Color3.fromRGB(12, 12, 12)
Instance.new("UICorner", CenterBox).CornerRadius = UDim.new(0, 10)
local CenterStroke = Instance.new("UIStroke", CenterBox)
CenterStroke.Color = Color3.fromRGB(255, 0, 50)
CenterStroke.Thickness = 1.5

-- [9] الأزرار السفلية الثلاثة
local function MakeBtn(name, x)
    local b = Instance.new("TextButton", MainFrame)
    b.Size = UDim2.new(0, 185, 0, 95)
    b.Position = UDim2.new(0, x, 0, 315)
    b.BackgroundColor3 = Color3.fromRGB(22, 22, 22)
    b.Text = name
    b.TextColor3 = Color3.fromRGB(255, 255, 255)
    b.Font = Enum.Font.GothamBold
    Instance.new("UICorner", b).CornerRadius = UDim.new(0, 10)
    local bs = Instance.new("UIStroke", b)
    bs.Color = Color3.fromRGB(40, 40, 40)
end
MakeBtn("CONFIG", 10)
MakeBtn("SETTING", 205)
MakeBtn("AD (إعلان)", 400)

-- [10] الزر العائم (NXR) - فوق يمين
local Toggle = Instance.new("TextButton", ScreenGui)
Toggle.Size = UDim2.new(0, 60, 0, 60)
Toggle.Position = UDim2.new(1, -75, 0, 25)
Toggle.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
Toggle.Text = "NXR"
Toggle.TextColor3 = Color3.fromRGB(255, 0, 50)
Toggle.Font = Enum.Font.GothamBold
Toggle.Active = true
Toggle.Draggable = true
Toggle.ZIndex = 100000
Instance.new("UICorner", Toggle).CornerRadius = UDim.new(1, 0)
Instance.new("UIStroke", Toggle).Color = Color3.fromRGB(255, 0, 50)

Toggle.MouseButton1Click:Connect(function()
    MainFrame.Visible = not MainFrame.Visible
end)
