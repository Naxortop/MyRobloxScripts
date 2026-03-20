-- [[ NAXOR V4 - OFFICIAL FULL SOURCE CODE ]] --
-- WARNING: DO NOT REMOVE ANY LINES TO MAINTAIN FULL UI INTEGRITY.

local Players = game:GetService("Players")
local LP = Players.LocalPlayer
local PlayerGui = LP:WaitForChild("PlayerGui")
local RunService = game:GetService("RunService")

-- [1] تنظيف النسخ القديمة لضمان عدم التداخل
if PlayerGui:FindFirstChild("Naxor_Official_V4") then
    PlayerGui.Naxor_Official_V4:Destroy()
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
MainStroke.Name = "MainStroke"
MainStroke.Parent = MainFrame
MainStroke.Color = Color3.fromRGB(255, 0, 50)
MainStroke.Thickness = 2.5
MainStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border

-- [4] العنوان العلوي (N.X.R >>>) - خط كبير جداً وبدون تضليل
local LogoLabel = Instance.new("TextLabel")
LogoLabel.Name = "LogoLabel"
LogoLabel.Parent = MainFrame
LogoLabel.Text = "N.X.R <font color='#FF0032'>>>> </font>"
LogoLabel.RichText = true
LogoLabel.Size = UDim2.new(0, 250, 0, 60)
LogoLabel.Position = UDim2.new(0, 25, 0, 10)
LogoLabel.BackgroundTransparency = 1
LogoLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
LogoLabel.TextSize = 34 -- تكبير الخط كما طلبت
LogoLabel.Font = Enum.Font.GothamBold
LogoLabel.TextXAlignment = Enum.TextXAlignment.Left

-- [5] قسم صورة اللاعب (Avatar Image)
local AvatarImage = Instance.new("ImageLabel")
AvatarImage.Name = "AvatarImage"
AvatarImage.Parent = MainFrame
AvatarImage.Size = UDim2.new(0, 80, 0, 80)
AvatarImage.Position = UDim2.new(0, 25, 0, 80)
AvatarImage.Image = "rbxthumb://type=AvatarHeadShot&id="..LP.UserId.."&w=150&h=150"
AvatarImage.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
AvatarImage.BorderSizePixel = 0

local AvatarCorner = Instance.new("UICorner")
AvatarCorner.CornerRadius = UDim.new(0, 10)
AvatarCorner.Parent = AvatarImage

-- [6] مستطيل الـ STATE (بجانب الصورة) - مع العدادات
local StateFrame = Instance.new("Frame")
StateFrame.Name = "StateFrame"
StateFrame.Parent = MainFrame
StateFrame.Size = UDim2.new(0, 115, 0, 80)
StateFrame.Position = UDim2.new(0, 115, 0, 80)
StateFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
StateFrame.BorderSizePixel = 0

local StateCorner = Instance.new("UICorner")
StateCorner.CornerRadius = UDim.new(0, 8)
StateCorner.Parent = StateFrame

local StateTitle = Instance.new("TextLabel")
StateTitle.Name = "StateTitle"
StateTitle.Parent = StateFrame
StateTitle.Text = "STATE"
StateTitle.Size = UDim2.new(1, 0, 0, 30)
StateTitle.BackgroundTransparency = 1
StateTitle.TextColor3 = Color3.fromRGB(255, 0, 50)
StateTitle.TextSize = 18 -- تكبير الخط
StateTitle.Font = Enum.Font.GothamBold

local StateDetails = Instance.new("TextLabel")
StateDetails.Name = "StateDetails"
StateDetails.Parent = StateFrame
StateDetails.Size = UDim2.new(1, -10, 1, -30)
StateDetails.Position = UDim2.new(0, 5, 0, 30)
StateDetails.BackgroundTransparency = 1
StateDetails.TextColor3 = Color3.fromRGB(255, 255, 255)
StateDetails.TextSize = 14 -- تكبير الخط
StateDetails.Font = Enum.Font.GothamBold
StateDetails.TextXAlignment = Enum.TextXAlignment.Left

-- [7] معلومات اللاعب (تحت الصورة) - خط كبير ومعزز
local InfoLabel = Instance.new("TextLabel")
InfoLabel.Name = "InfoLabel"
InfoLabel.Parent = MainFrame
InfoLabel.Size = UDim2.new(0, 250, 0, 150)
InfoLabel.Position = UDim2.new(0, 25, 0, 165)
InfoLabel.BackgroundTransparency = 1
InfoLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
InfoLabel.TextSize = 16 -- تكبير الخط كما طلبت
InfoLabel.Font = Enum.Font.GothamBold
InfoLabel.TextXAlignment = Enum.TextXAlignment.Left
InfoLabel.LineHeight = 1.6

-- تحديث الـ FPS ووقت اللعب في المكانين (STATE و INFO)
local StartTime = tick()
RunService.RenderStepped:Connect(function()
    local Elapsed = tick() - StartTime
    local Hours = math.floor(Elapsed / 3600)
    local Minutes = math.floor((Elapsed % 3600) / 60)
    local Seconds = math.floor(Elapsed % 60)
    local FPS = math.floor(1 / RunService.RenderStepped:Wait())
    local TimeStr = string.format("%02d:%02d:%02d", Hours, Minutes, Seconds)
    
    StateDetails.Text = "FPS: " .. FPS .. "\nTIME: " .. TimeStr
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
CenterBox.Size = UDim2.new(0, 350, 0, 215)
CenterBox.Position = UDim2.new(0, 230, 0, 75)
CenterBox.BackgroundColor3 = Color3.fromRGB(12, 12, 12)
CenterBox.BorderSizePixel = 0

local CenterCorner = Instance.new("UICorner")
CenterCorner.CornerRadius = UDim.new(0, 10)
CenterCorner.Parent = CenterBox

local CenterStroke = Instance.new("UIStroke")
CenterStroke.Parent = CenterBox
CenterStroke.Color = Color3.fromRGB(255, 0, 50)
CenterStroke.Thickness = 1.5

-- [9] الأزرار السفلية (CONFIG, SETTING, AD) - تكبير الخط والأبعاد
local function CreateBottomButton(name, posX)
    local Btn = Instance.new("TextButton")
    Btn.Name = name .. "_Btn"
    Btn.Parent = MainFrame
    Btn.Size = UDim2.new(0, 185, 0, 95)
    Btn.Position = UDim2.new(0, posX, 0, 315)
    Btn.BackgroundColor3 = Color3.fromRGB(22, 22, 22)
    Btn.Text = name
    Btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    Btn.TextSize = 22 -- خط كبير وواضح جداً
    Btn.Font = Enum.Font.GothamBold
    Btn.BorderSizePixel = 0
    
    local BtnCorner = Instance.new("UICorner")
    BtnCorner.CornerRadius = UDim.new(0, 10)
    BtnCorner.Parent = Btn
    
    local BtnStroke = Instance.new("UIStroke")
    BtnStroke.Parent = Btn
    BtnStroke.Color = Color3.fromRGB(40, 40, 40)
    BtnStroke.Thickness = 1.5
end

CreateBottomButton("CONFIG", 10)
CreateBottomButton("SETTING", 205)
CreateBottomButton("AD (إعلان)", 405)

-- [10] الزر العائم (NXR Toggle)
local Toggle = Instance.new("TextButton")
Toggle.Name = "NXR_Toggle"
Toggle.Parent = ScreenGui
Toggle.Size = UDim2.new(0, 65, 0, 65)
Toggle.Position = UDim2.new(1, -80, 0, 20)
Toggle.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
Toggle.Text = "NXR"
Toggle.TextColor3 = Color3.fromRGB(255, 0, 50)
Toggle.Font = Enum.Font.GothamBold
Toggle.TextSize = 20
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

print("Naxor V4: Full Source Deployed With Big Fonts.")
