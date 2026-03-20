-- [[ NAXOR V4 - THE ULTIMATE INTEGRATION ]] --
-- ملاحظة: تم دمج كل الخصائص السابقة (الهوية + الأزرار + السحب) بدون أي حذف.

local Players = game:GetService("Players")
local LP = Players.LocalPlayer
local PlayerGui = LP:WaitForChild("PlayerGui")
local UIS = game:GetService("UserInputService")
local TS = game:GetService("TweenService")

-- [1] تنظيف أي نسخة قديمة لضمان عمل الكود الجديد
if PlayerGui:FindFirstChild("Naxor_Official_V4") then
    PlayerGui:FindFirstChild("Naxor_Official_V4"):Destroy()
end

-- [2] متغيرات الألوان (RGB) - قيم افتراضية
local R = 255
local G = 0
local B = 50
local MainColor = Color3.fromRGB(R, G, B)

-- [3] إنشاء الشاشة الرئيسية (ScreenGui)
local Screen = Instance.new("ScreenGui")
Screen.Name = "Naxor_Official_V4"
Screen.Parent = PlayerGui
Screen.IgnoreGuiInset = true
Screen.ZIndexBehavior = Enum.ZIndexBehavior.Global

-- الإطار الرئيسي (Main Frame)
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

-- [4] هيدر السحب (Drag Header) - المنطقة العلوية فقط
local DragHeader = Instance.new("Frame")
DragHeader.Name = "DragHeader"
DragHeader.Parent = Main
DragHeader.Size = UDim2.new(1, 0, 0, 65)
DragHeader.BackgroundTransparency = 1
DragHeader.ZIndex = 10

local dragging, dragStart, startPos
DragHeader.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startPos = Main.Position
        
        local connection
        connection = input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
                connection:Disconnect()
            end
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
Logo.Parent = DragHeader
Logo.RichText = true
Logo.Text = "N.X.R <font color='#FF0032'>>>> </font>"
Logo.Size = UDim2.new(0, 200, 1, 0)
Logo.Position = UDim2.new(0, 25, 0, 0)
Logo.BackgroundTransparency = 1
Logo.TextColor3 = Color3.new(1, 1, 1)
Logo.TextSize = 26
Logo.Font = Enum.Font.GothamBold
Logo.TextXAlignment = Enum.TextXAlignment.Left

-- [6] صفحات المحتوى (Home & Settings)
local HomePage = Instance.new("Frame")
HomePage.Name = "HomePage"
HomePage.Parent = Main
HomePage.Size = UDim2.new(1, -50, 1, -170)
HomePage.Position = UDim2.new(0, 25, 0, 80)
HomePage.BackgroundTransparency = 1
HomePage.Visible = true

local SettingsPage = Instance.new("Frame")
SettingsPage.Name = "SettingsPage"
SettingsPage.Parent = Main
SettingsPage.Size = HomePage.Size
SettingsPage.Position = HomePage.Position
SettingsPage.BackgroundTransparency = 1
SettingsPage.Visible = false

-- [7] تصميم بطاقة الهوية (ID CARD)
local IDCard = Instance.new("Frame")
IDCard.Parent = HomePage
IDCard.Size = UDim2.new(0, 195, 1, 0)
IDCard.BackgroundColor3 = Color3.fromRGB(12, 12, 12)
Instance.new("UICorner", IDCard).CornerRadius = UDim.new(0, 15)

local IDStroke = Instance.new("UIStroke")
IDStroke.Thickness = 1.5
IDStroke.Color = MainColor
IDStroke.Parent = IDCard

local pImg = Instance.new("ImageLabel", IDCard)
pImg.Size = UDim2.new(0, 70, 0, 70)
pImg.Position = UDim2.new(0, 15, 0, 15)
pImg.Image = "rbxthumb://type=AvatarHeadShot&id="..LP.UserId.."&w=150&h=150"
Instance.new("UICorner", pImg).CornerRadius = UDim.new(0, 12)

local function AddIDLabel(txt, y, bold)
    local l = Instance.new("TextLabel", IDCard)
    l.Text = txt
    l.Position = UDim2.new(0, 15, 0, y)
    l.Size = UDim2.new(1, -30, 0, 20)
    l.BackgroundTransparency = 1
    l.TextColor3 = Color3.new(1, 1, 1)
    l.TextSize = 10
    l.Font = bold and Enum.Font.GothamBold or Enum.Font.GothamMedium
    l.TextXAlignment = Enum.TextXAlignment.Left
    return l
end

AddIDLabel("IDENTIFICATION:", 95, true)
AddIDLabel("NAME: "..LP.Name, 115, false)
AddIDLabel("STATUS: ONLINE", 135, false)
local accessLabel = AddIDLabel("N.X.R HUB ACCESS", 185, true)
accessLabel.TextColor3 = MainColor

-- [8] مربع الصورة اليمين (ImageBox)
local ImageBox = Instance.new("Frame")
ImageBox.Parent = HomePage
ImageBox.Size = UDim2.new(1, -220, 1, 0)
ImageBox.Position = UDim2.new(0, 220, 0, 0)
ImageBox.BackgroundColor3 = Color3.fromRGB(12, 12, 12)
Instance.new("UICorner", ImageBox).CornerRadius = UDim.new(0, 15)
local ImgBoxStroke = Instance.new("UIStroke", ImageBox)
ImgBoxStroke.Thickness = 1.5
ImgBoxStroke.Color = MainColor

-- [9] الأزرار السفلية (Style Match)
local ButtonStrokes = {}

local function CreateStyledButton(name, x, callback)
    local b = Instance.new("TextButton")
    b.Parent = Main
    b.Size = UDim2.new(0, 160, 0, 85)
    b.Position = UDim2.new(0, x, 1, -105)
    b.BackgroundColor3 = Color3.fromRGB(12, 12, 12) -- نفس البطاقة
    b.Text = name
    b.TextColor3 = Color3.new(1, 1, 1)
    b.Font = Enum.Font.GothamBold
    b.TextSize = 13
    Instance.new("UICorner", b).CornerRadius = UDim.new(0, 15)
    
    local s = Instance.new("UIStroke", b)
    s.Thickness = 1.5
    s.Color = MainColor
    s.Parent = b
    
    table.insert(ButtonStrokes, s)
    b.MouseButton1Click:Connect(callback)
end

CreateStyledButton("CONFIG", 25, function() print("Config Clicked") end)
CreateStyledButton("SETTING", 200, function() 
    HomePage.Visible = not HomePage.Visible 
    SettingsPage.Visible = not SettingsPage.Visible 
end)
CreateStyledButton("AD (إعلان)", 375, function() print("Ad Clicked") end)

-- [10] نظام التحكم بالألوان (RGB Sliders)
local function UpdateUIColors()
    local NewC = Color3.fromRGB(R, G, B)
    MainStroke.Color = NewC
    IDStroke.Color = NewC
    ImgBoxStroke.Color = NewC
    accessLabel.TextColor3 = NewC
    Logo.Text = "N.X.R <font color='#" .. NewC:ToHex() .. "'> >>> </font>"
    for _, s in pairs(ButtonStrokes) do s.Color = NewC end
end

local function CreateSlider(name, col, y)
    local f = Instance.new("Frame", SettingsPage)
    f.Size = UDim2.new(0, 280, 0, 45)
    f.Position = UDim2.new(0, 10, 0, y * 55)
    f.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    Instance.new("UICorner", f).CornerRadius = UDim.new(0, 10)
    
    local bar = Instance.new("Frame", f)
    bar.Size = UDim2.new(0, 180, 0, 4)
    bar.Position = UDim2.new(0, 85, 0.5, -2)
    bar.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    
    local dot = Instance.new("TextButton", bar)
    dot.Size = UDim2.new(0, 16, 0, 16)
    dot.Position = UDim2.new(0, 0, 0.5, -8)
    dot.BackgroundColor3 = col
    dot.Text = ""
    Instance.new("UICorner", dot).CornerRadius = UDim.new(1, 0)
    
    local sliding = false
    dot.MouseButton1Down:Connect(function() sliding = true end)
    UIS.InputChanged:Connect(function(input)
        if sliding and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
            local p = math.clamp((input.Position.X - bar.AbsolutePosition.X) / bar.AbsoluteSize.X, 0, 1)
            dot.Position = UDim2.new(p, -8, 0.5, -8)
            local val = math.floor(p * 255)
            if name == "R" then R = val elseif name == "G" then G = val elseif name == "B" then B = val end
            UpdateUIColors()
        end
    end)
    UIS.InputEnded:Connect(function() sliding = false end)
end

CreateSlider("R", Color3.new(1,0,0), 0)
CreateSlider("G", Color3.new(0,1,0), 1)
CreateSlider("B", Color3.new(0,0.6,1), 2)
