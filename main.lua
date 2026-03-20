-- [[ NAXOR V4 - UNIFIED STYLE EDITION ]] --
-- [[ تم توحيد تصميم الأزرار مع بطاقة الهوية بالكامل ]] --

local Players = game:GetService("Players")
local LP = Players.LocalPlayer
local PlayerGui = LP:WaitForChild("PlayerGui")
local UIS = game:GetService("UserInputService")
local TS = game:GetService("TweenService")

-- [1] تنظيف الواجهات القديمة
if PlayerGui:FindFirstChild("Naxor_Official_V4") then
    PlayerGui:FindFirstChild("Naxor_Official_V4"):Destroy()
end

-- [2] متغيرات الألوان الأساسية
local R = 255
local G = 0
local B = 50
local MainColor = Color3.fromRGB(R, G, B)

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
Instance.new("UICorner", Main).CornerRadius = UDim.new(0, 20)

local MainStroke = Instance.new("UIStroke")
MainStroke.Thickness = 3
MainStroke.Color = MainColor
MainStroke.Parent = Main

-- [4] هيدر السحب (Drag Header)
local Header = Instance.new("Frame")
Header.Name = "Header"
Header.Parent = Main
Header.Size = UDim2.new(1, 0, 0, 65)
Header.BackgroundTransparency = 1
Header.ZIndex = 10

local dragging, dragStart, startPos
Header.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true; dragStart = input.Position; startPos = Main.Position
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then dragging = false end
        end)
    end
end)
UIS.InputChanged:Connect(function(input)
    if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
        local delta = input.Position - dragStart
        Main.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
end)

-- [5] الشعار (Logo)
local Logo = Instance.new("TextLabel")
Logo.Parent = Header
Logo.RichText = true
Logo.Text = "N.X.R <font color='#FF0032'>>>> </font>"
Logo.Size = UDim2.new(0, 200, 1, 0)
Logo.Position = UDim2.new(0, 25, 0, 0)
Logo.BackgroundTransparency = 1
Logo.TextColor3 = Color3.new(1, 1, 1)
Logo.TextSize = 26
Logo.Font = Enum.Font.GothamBold
Logo.TextXAlignment = Enum.TextXAlignment.Left

-- [6] صفحة الهوم والبطاقة
local HomePage = Instance.new("Frame")
HomePage.Parent = Main
HomePage.Size = UDim2.new(1, -50, 1, -170)
HomePage.Position = UDim2.new(0, 25, 0, 80)
HomePage.BackgroundTransparency = 1

-- بطاقة الهوية الأساسية
local IDCard = Instance.new("Frame")
IDCard.Parent = HomePage
IDCard.Size = UDim2.new(0, 195, 1, 0)
IDCard.BackgroundColor3 = Color3.fromRGB(12, 12, 12)
Instance.new("UICorner", IDCard).CornerRadius = UDim.new(0, 15)
local IDStroke = Instance.new("UIStroke", IDCard)
IDStroke.Thickness = 1.5; IDStroke.Color = MainColor

-- محتويات البطاقة (صورة ونصوص)
local pImg = Instance.new("ImageLabel", IDCard)
pImg.Size = UDim2.new(0, 70, 0, 70); pImg.Position = UDim2.new(0, 15, 0, 15)
pImg.Image = "rbxthumb://type=AvatarHeadShot&id="..LP.UserId.."&w=150&h=150"
Instance.new("UICorner", pImg).CornerRadius = UDim.new(0, 12)

local function AddL(txt, y, bold)
    local l = Instance.new("TextLabel", IDCard)
    l.Text = txt; l.Position = UDim2.new(0, 15, 0, y); l.Size = UDim2.new(1, -30, 0, 20)
    l.BackgroundTransparency = 1; l.TextColor3 = Color3.new(1, 1, 1); l.TextSize = 10
    l.Font = bold and Enum.Font.GothamBold or Enum.Font.GothamMedium; l.TextXAlignment = "Left"
end
AddL("IDENTIFICATION:", 95, true)
AddL("NAME: "..LP.Name, 115, false)
AddL("STATUS: ONLINE", 135, false)

-- [7] الأزرار السفلية (تم تعديلها لتطابق البطاقة)
local ButtonStrokes = {} -- جدول لتخزين إطارات الأزرار لتحديث ألوانها

local function CreateStyledButton(btnName, xPos, callback)
    local btnFrame = Instance.new("TextButton")
    btnFrame.Name = btnName.."_Btn"
    btnFrame.Parent = Main
    btnFrame.Size = UDim2.new(0, 160, 0, 85)
    btnFrame.Position = UDim2.new(0, xPos, 1, -105)
    btnFrame.BackgroundColor3 = Color3.fromRGB(12, 12, 12) -- نفس خلفية البطاقة
    btnFrame.Text = btnName
    btnFrame.TextColor3 = Color3.new(1, 1, 1)
    btnFrame.Font = Enum.Font.GothamBold
    btnFrame.TextSize = 13
    
    Instance.new("UICorner", btnFrame).CornerRadius = UDim.new(0, 15)
    
    local btnStroke = Instance.new("UIStroke")
    btnStroke.Thickness = 1.5 -- نفس سماكة إطار البطاقة
    btnStroke.Color = MainColor
    btnStroke.Parent = btnFrame
    
    table.insert(ButtonStrokes, btnStroke) -- إضافة الإطار للجدول
    btnFrame.MouseButton1Click:Connect(callback)
end

-- إنشاء الأزرار بنفس الستايل
CreateStyledButton("CONFIG", 25, function() print("Config Open") end)
CreateStyledButton("SETTING", 200, function() print("Settings Open") end)
CreateStyledButton("AD (إعلان)", 375, function() print("Ad Clicked") end)

-- [8] تحديث الألوان (RGB Update)
local function UpdateUIColors()
    local NewC = Color3.fromRGB(R, G, B)
    MainStroke.Color = NewC
    IDStroke.Color = NewC
    Logo.Text = "N.X.R <font color='#" .. NewC:ToHex() .. "'> >>> </font>"
    -- تحديث إطارات جميع الأزرار السفلية
    for _, str in pairs(ButtonStrokes) do
        str.Color = NewC
    end
end

-- (ملاحظة: يمكنك إضافة منزلقات الـ RGB هنا لتتحكم في UpdateUIColors)

print("Naxor V4: Buttons are now perfectly matched with ID Card.")
