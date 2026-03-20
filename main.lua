-- [[ NAXOR V4 - THE ULTIMATE PROFESSIONAL MERGE ]] --

local Players = game:GetService("Players")
local LP = Players.LocalPlayer
local PlayerGui = LP:WaitForChild("PlayerGui")
local UIS = game:GetService("UserInputService")
local TS = game:GetService("TweenService")

-- [1] تنظيف النسخ القديمة لضمان الأداء
for _, v in pairs(PlayerGui:GetChildren()) do
    if v.Name == "Naxor_Official_V4" then v:Destroy() end
end

local R, G, B = 255, 0, 50
local MainColor = Color3.fromRGB(R, G, B)

-- [2] إنشاء الواجهة (ScreenGui)
local Screen = Instance.new("ScreenGui", PlayerGui)
Screen.Name = "Naxor_Official_V4"
Screen.ZIndexBehavior = Enum.ZIndexBehavior.Global

-- الإطار الرئيسي
local Main = Instance.new("Frame", Screen)
Main.Size = UDim2.new(0, 560, 0, 390)
Main.Position = UDim2.new(0.5, -280, 0.5, -195)
Main.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
Main.BorderSizePixel = 0
Instance.new("UICorner", Main).CornerRadius = UDim.new(0, 20)
local MainStroke = Instance.new("UIStroke", Main); MainStroke.Thickness = 3; MainStroke.Color = MainColor

-- [3] هيدر السحب المحصور (Drag Header)
local DragHeader = Instance.new("Frame", Main)
DragHeader.Name = "Header"
DragHeader.Size = UDim2.new(1, 0, 0, 65)
DragHeader.BackgroundTransparency = 1

local dragging, dragStart, startPos
DragHeader.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true; dragStart = input.Position; startPos = Main.Position
    end
end)
UIS.InputChanged:Connect(function(input)
    if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
        local delta = input.Position - dragStart
        Main.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
end)
UIS.InputEnded:Connect(function(input) if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then dragging = false end end)

-- [4] الشعار (Logo)
local Logo = Instance.new("TextLabel", DragHeader)
Logo.RichText = true
Logo.Text = "N.X.R <font color='#FF0032'>>>> </font>"
Logo.Size = UDim2.new(0, 150, 1, 0); Logo.Position = UDim2.new(0, 25, 0, 0)
Logo.BackgroundTransparency = 1; Logo.TextColor3 = Color3.new(1, 1, 1); Logo.TextSize = 26; Logo.Font = "GothamBold"; Logo.TextXAlignment = "Left"

-- [5] تابات التنقل (Tabs)
local TabHolder = Instance.new("Frame", Main)
TabHolder.Size = UDim2.new(0, 200, 0, 40); TabHolder.Position = UDim2.new(1, -220, 0, 12); TabHolder.BackgroundTransparency = 1

local function CreateTabBtn(icon, xPos, callback)
    local b = Instance.new("TextButton", TabHolder)
    b.Size = UDim2.new(0, 40, 0, 40); b.Position = UDim2.new(0, xPos, 0, 0)
    b.BackgroundColor3 = Color3.fromRGB(25, 25, 25); b.Text = icon; b.TextColor3 = Color3.new(1, 1, 1); b.TextSize = 18
    Instance.new("UICorner", b).CornerRadius = UDim.new(0, 10)
    b.MouseButton1Click:Connect(callback)
end

-- [6] الحاويات (Pages)
local HomePage = Instance.new("Frame", Main); HomePage.Size = UDim2.new(1, -50, 1, -165); HomePage.Position = UDim2.new(0, 25, 0, 75); HomePage.BackgroundTransparency = 1; HomePage.Visible = true
local SettingsPage = Instance.new("Frame", Main); SettingsPage.Size = HomePage.Size; SettingsPage.Position = HomePage.Position; SettingsPage.BackgroundTransparency = 1; SettingsPage.Visible = false

CreateTabBtn("🏠", 110, function() HomePage.Visible = true; SettingsPage.Visible = false end)
CreateTabBtn("📄", 160, function() HomePage.Visible = false; SettingsPage.Visible = false end)

-- [7] بطاقة الهوية (ID CARD) - اليسار
local IDCard = Instance.new("Frame", HomePage)
IDCard.Size = UDim2.new(0, 190, 1, 0); IDCard.BackgroundColor3 = Color3.fromRGB(12, 12, 12)
Instance.new("UICorner", IDCard).CornerRadius = UDim.new(0, 15)
local IDStroke = Instance.new("UIStroke", IDCard); IDStroke.Color = MainColor; IDStroke.Thickness = 1.5

local pImg = Instance.new("ImageLabel", IDCard)
pImg.Size = UDim2.new(0, 65, 0, 65); pImg.Position = UDim2.new(0, 15, 0, 15)
pImg.Image = "rbxthumb://type=AvatarHeadShot&id="..LP.UserId.."&w=150&h=150"; pImg.BackgroundColor3 = Color3.fromRGB(20,20,20); Instance.new("UICorner", pImg).CornerRadius = UDim.new(0, 10)

local function AddIDText(txt, y, col, isBold, size)
    local l = Instance.new("TextLabel", IDCard); l.Text = txt; l.Size = UDim2.new(1, -30, 0, 20); l.Position = UDim2.new(0, 15, 0, y)
    l.BackgroundTransparency = 1; l.TextColor3 = col or Color3.new(0.9, 0.9, 0.9); l.TextSize = size or 9; l.Font = isBold and "GothamBold" or "GothamMedium"; l.TextXAlignment = "Left"
end
AddIDText("IDENTIFICATION:", 90, Color3.fromRGB(120, 120, 120), true, 8)
AddIDText("NAME: "..LP.Name:upper(), 110, Color3.new(1, 1, 1), false, 10)
AddIDText("STATUS: ONLINE", 128, Color3.fromRGB(0, 255, 120), false, 10)
AddIDText("VER: 4.0.0", 146, Color3.new(1, 1, 1), false, 10)
AddIDText("N.X.R HUB ACCESS", 175, MainColor, true, 10)

-- مربع الصورة (اليمين)
local ImageBox = Instance.new("Frame", HomePage)
ImageBox.Size = UDim2.new(1, -215, 1, 0); ImageBox.Position = UDim2.new(0, 215, 0, 0); ImageBox.BackgroundColor3 = Color3.fromRGB(12, 12, 12)
Instance.new("UICorner", ImageBox).CornerRadius = UDim.new(0, 15); local ImgStroke = Instance.new("UIStroke", ImageBox); ImgStroke.Color = MainColor; ImgStroke.Thickness = 1.5

-- [8] الأزرار السفلية (الموزعة باحترافية)
local function CreateBottom(name, xPos, callback)
    local b = Instance.new("TextButton", Main)
    b.Size = UDim2.new(0, 160, 0, 80); b.Position = UDim2.new(0, xPos, 1, -100); b.BackgroundColor3 = Color3.fromRGB(18, 18, 18)
    b.Text = name; b.TextColor3 = Color3.new(1, 1, 1); b.Font = "GothamBold"; b.TextSize = 12; Instance.new("UICorner", b).CornerRadius = UDim.new(0, 12)
    local s = Instance.new("UIStroke", b); s.Thickness = 1; s.Color = Color3.fromRGB(35, 35, 35)
    b.MouseButton1Click:Connect(callback)
end

CreateBottom("CONFIG", 25, function() end)
CreateBottom("SETTING", 200, function() HomePage.Visible = false; SettingsPage.Visible = true end)
CreateBottom("AD (إعلان)", 375, function() end)

-- [9] نظام الـ RGB (في الإعدادات)
local function UpdateUI()
    local C = Color3.fromRGB(R, G, B)
    MainStroke.Color = C; IDStroke.Color = C; ImgStroke.Color = C
    Logo.Text = "N.X.R <font color='#" .. C:ToHex() .. "'> >>> </font>"
end

local function CreateSlider(name, col, order)
    local f = Instance.new("Frame", SettingsPage); f.Size = UDim2.new(0, 260, 0, 40); f.Position = UDim2.new(0, 10, 0, order * 50); f.BackgroundColor3 = Color3.fromRGB(20,20,20); Instance.new("UICorner", f).CornerRadius = UDim.new(0, 8)
    local bar = Instance.new("Frame", f); bar.Size = UDim2.new(0, 160, 0, 3); bar.Position = UDim2.new(0, 80, 0.5, -1); bar.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    local dot = Instance.new("TextButton", bar); dot.Size = UDim2.new(0, 14, 0, 14); dot.Position = UDim2.new(0, 0, 0.5, -7); dot.BackgroundColor3 = col; dot.Text = ""; Instance.new("UICorner", dot).CornerRadius = UDim.new(1, 0)
    
    local sliding = false
    dot.MouseButton1Down:Connect(function() sliding = true end)
    UIS.InputChanged:Connect(function(i)
        if sliding and (i.UserInputType == Enum.UserInputType.MouseMovement or i.UserInputType == Enum.UserInputType.Touch) then
            local p = math.clamp((i.Position.X - bar.AbsolutePosition.X) / bar.AbsoluteSize.X, 0, 1)
            dot.Position = UDim2.new(p, -7, 0.5, -7)
            local v = math.floor(p * 255)
            if name == "R" then R = v elseif name == "G" then G = v elseif name == "B" then B = v end
            UpdateUI()
        end
    end)
    UIS.InputEnded:Connect(function(i) if i.UserInputType == Enum.UserInputType.MouseButton1 or i.UserInputType == Enum.UserInputType.Touch then sliding = false end end)
end
CreateSlider("R", Color3.new(1,0,0), 0); CreateSlider("G", Color3.new(0,1,0), 1); CreateSlider("B", Color3.new(0,0.6,1), 2)
