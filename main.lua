-- [[ NAXOR V4 - THE REAL FULL CODE ]] --

local Players = game:GetService("Players")
local LP = Players.LocalPlayer
local PlayerGui = LP:WaitForChild("PlayerGui")
local UIS = game:GetService("UserInputService")

-- [1] تنظيف أي نسخة قديمة
if PlayerGui:FindFirstChild("Naxor_Official_V4") then
    PlayerGui:FindFirstChild("Naxor_Official_V4"):Destroy()
end

-- [2] متغيرات الألوان
local R = 255
local G = 0
local B = 50

-- [3] إنشاء الشاشة الرئيسية
local Screen = Instance.new("ScreenGui")
Screen.Name = "Naxor_Official_V4"
Screen.Parent = PlayerGui
Screen.IgnoreGuiInset = true

local Main = Instance.new("Frame")
Main.Name = "MainFrame"
Main.Parent = Screen
Main.Size = UDim2.new(0, 560, 0, 390)
Main.Position = UDim2.new(0.5, -280, 0.5, -195)
Main.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
Main.BorderSizePixel = 0

local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 20)
MainCorner.Parent = Main

local MainStroke = Instance.new("UIStroke")
MainStroke.Thickness = 3
MainStroke.Color = Color3.fromRGB(R, G, B)
MainStroke.Parent = Main

-- [4] برمجة السحب (Header Only)
local DragZone = Instance.new("Frame")
DragZone.Name = "DragZone"
DragZone.Parent = Main
DragZone.Size = UDim2.new(1, 0, 0, 65)
DragZone.BackgroundTransparency = 1

local dragging = false
local dragStart = nil
local startPos = nil

DragZone.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startPos = Main.Position
    end
end)

UIS.InputChanged:Connect(function(input)
    if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
        local delta = input.Position - dragStart
        Main.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
end)

UIS.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = false
    end
end)

-- [5] الشعار (Logo)
local Logo = Instance.new("TextLabel")
Logo.Parent = DragZone
Logo.RichText = true
Logo.Text = "N.X.R <font color='#FF0032'>>>> </font>"
Logo.Size = UDim2.new(0, 200, 1, 0)
Logo.Position = UDim2.new(0, 25, 0, 0)
Logo.BackgroundTransparency = 1
Logo.TextColor3 = Color3.new(1, 1, 1)
Logo.TextSize = 26
Logo.Font = Enum.Font.GothamBold
Logo.TextXAlignment = Enum.TextXAlignment.Left

-- [6] صفحة الهوم (HomePage)
local HomePage = Instance.new("Frame")
HomePage.Parent = Main
HomePage.Size = UDim2.new(1, -50, 1, -170)
HomePage.Position = UDim2.new(0, 25, 0, 80)
HomePage.BackgroundTransparency = 1
HomePage.Visible = true

-- بطاقة الهوية (اليسار)
local IDCard = Instance.new("Frame")
IDCard.Parent = HomePage
IDCard.Size = UDim2.new(0, 195, 1, 0)
IDCard.BackgroundColor3 = Color3.fromRGB(12, 12, 12)
Instance.new("UICorner", IDCard).CornerRadius = UDim.new(0, 15)
local IDStroke = Instance.new("UIStroke", IDCard)
IDStroke.Color = Color3.fromRGB(R, G, B)
IDStroke.Thickness = 1.5

local pImg = Instance.new("ImageLabel")
pImg.Parent = IDCard
pImg.Size = UDim2.new(0, 70, 0, 70)
pImg.Position = UDim2.new(0, 15, 0, 15)
pImg.Image = "rbxthumb://type=AvatarHeadShot&id="..LP.UserId.."&w=150&h=150"
Instance.new("UICorner", pImg).CornerRadius = UDim.new(0, 12)

local function CreateLabel(txt, y, sz, bold)
    local l = Instance.new("TextLabel")
    l.Parent = IDCard
    l.Text = txt
    l.Position = UDim2.new(0, 15, 0, y)
    l.Size = UDim2.new(1, -30, 0, 20)
    l.BackgroundTransparency = 1
    l.TextColor3 = Color3.new(1, 1, 1)
    l.TextSize = sz
    l.Font = bold and Enum.Font.GothamBold or Enum.Font.GothamMedium
    l.TextXAlignment = Enum.TextXAlignment.Left
end

CreateLabel("IDENTIFICATION:", 95, 8, true)
CreateLabel("NAME: "..LP.Name, 115, 10, false)
CreateLabel("STATUS: ONLINE", 135, 10, false)
CreateLabel("VERSION: 4.0.0", 155, 10, false)

-- [7] الأزرار السفلية
local function BottomBtn(name, x)
    local b = Instance.new("TextButton")
    b.Parent = Main
    b.Size = UDim2.new(0, 160, 0, 85)
    b.Position = UDim2.new(0, x, 1, -105)
    b.BackgroundColor3 = Color3.fromRGB(18, 18, 18)
    b.Text = name
    b.TextColor3 = Color3.new(1, 1, 1)
    b.Font = Enum.Font.GothamBold
    b.TextSize = 13
    Instance.new("UICorner", b).CornerRadius = UDim.new(0, 15)
    local s = Instance.new("UIStroke", b)
    s.Thickness = 1.2
    s.Color = Color3.fromRGB(35, 35, 35)
end

BottomBtn("CONFIG", 25)
BottomBtn("SETTING", 200)
BottomBtn("AD (إعلان)", 375)

print("Naxor V4: Success! Full Code Loaded.")
