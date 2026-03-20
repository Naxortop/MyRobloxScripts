-- [[ NAXOR V4 - ID CARD STYLE & FIXED SLIDING ]] --

local Players = game:GetService("Players")
local LP = Players.LocalPlayer
local PlayerGui = LP:WaitForChild("PlayerGui")
local UIS = game:GetService("UserInputService")

-- [1] تنظيف النسخ السابقة
for _, v in pairs(PlayerGui:GetChildren()) do
    if v.Name == "Naxor_Official_V4" then v:Destroy() end
end

local R, G, B = 255, 0, 50
local MainColor = Color3.fromRGB(R, G, B)

-- [2] الواجهة الأساسية
local Screen = Instance.new("ScreenGui", PlayerGui)
Screen.Name = "Naxor_Official_V4"

local Main = Instance.new("Frame", Screen)
Main.Size = UDim2.new(0, 550, 0, 380)
Main.Position = UDim2.new(0.5, -275, 0.5, -190)
Main.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
Main.BorderSizePixel = 0
Instance.new("UICorner", Main).CornerRadius = UDim.new(0, 15)
local MainStroke = Instance.new("UIStroke", Main); MainStroke.Thickness = 2.5; MainStroke.Color = MainColor

-- [3] نظام السحب (Drag)
local dragging, dragStart, startPos
Main.InputBegan:Connect(function(input)
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
UIS.InputEnded:Connect(function(input) if input.UserInputType == Enum.UserInputType.MouseButton1 then dragging = false end end)

-- [4] الهيدر
local Logo = Instance.new("TextLabel", Main)
Logo.RichText = true
Logo.Text = "N.X.R <font color='#FF0032'>>>> </font>"
Logo.Size = UDim2.new(0, 150, 0, 50); Logo.Position = UDim2.new(0, 25, 0, 5)
Logo.BackgroundTransparency = 1; Logo.TextColor3 = Color3.new(1, 1, 1); Logo.TextSize = 24; Logo.Font = "GothamBold"; Logo.TextXAlignment = "Left"

-- الصفحات
local HomePage = Instance.new("Frame", Main); HomePage.Size = UDim2.new(1, -40, 1, -145); HomePage.Position = UDim2.new(0, 20, 0, 65); HomePage.BackgroundTransparency = 1
local SettingsPage = Instance.new("Frame", Main); SettingsPage.Size = HomePage.Size; SettingsPage.Position = HomePage.Position; SettingsPage.BackgroundTransparency = 1; SettingsPage.Visible = false

-- [5] بطاقة الهوية (ID CARD STATS) - الجهة اليسرى
local IDCard = Instance.new("Frame", HomePage)
IDCard.Size = UDim2.new(0, 185, 1, 0)
IDCard.BackgroundColor3 = Color3.fromRGB(12, 12, 12)
Instance.new("UICorner", IDCard).CornerRadius = UDim.new(0, 12)
local IDStroke = Instance.new("UIStroke", IDCard); IDStroke.Color = MainColor; IDStroke.Thickness = 1.2

-- صورة الهوية (صغيرة ومتناسقة)
local pImg = Instance.new("ImageLabel", IDCard)
pImg.Size = UDim2.new(0, 60, 0, 60); pImg.Position = UDim2.new(0, 12, 0, 15)
pImg.Image = "rbxthumb://type=AvatarHeadShot&id="..LP.UserId.."&w=150&h=150"
pImg.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
Instance.new("UICorner", pImg).CornerRadius = UDim.new(0, 8)
Instance.new("UIStroke", pImg).Color = Color3.fromRGB(40,40,40)

-- نصوص الهوية (خط صغير ومتناسق)
local function AddIDText(txt, y, col, isBold)
    local l = Instance.new("TextLabel", IDCard)
    l.Text = txt; l.Size = UDim2.new(1, -24, 0, 18); l.Position = UDim2.new(0, 12, 0, y)
    l.BackgroundTransparency = 1; l.TextColor3 = col or Color3.new(0.8, 0.8, 0.8)
    l.TextSize = 10; l.Font = isBold and "GothamBold" or "GothamMedium"; l.TextXAlignment = "Left"
end

AddIDText("IDENTIFICATION:", 85, Color3.fromRGB(100, 100, 100), true)
AddIDText("NAME: "..LP.Name:upper(), 105, Color3.new(1, 1, 1), false)
AddIDText("STATUS: ONLINE", 122, Color3.fromRGB(0, 255, 120), false)
AddIDText("VER: 4.0.0", 139, Color3.new(1, 1, 1), false)
AddIDText("N.X.R HUB ACCESS", 165, MainColor, true)

-- مربع الصورة (الجهة اليمنى)
local ImageBox = Instance.new("Frame", HomePage)
ImageBox.Size = UDim2.new(1, -205, 1, 0); ImageBox.Position = UDim2.new(0, 205, 0, 0)
ImageBox.BackgroundColor3 = Color3.fromRGB(12, 12, 12)
Instance.new("UICorner", ImageBox).CornerRadius = UDim.new(0, 12)
local ImgStroke = Instance.new("UIStroke", ImageBox); ImgStroke.Color = MainColor; ImgStroke.Thickness = 1.2

-- [6] نظام الـ RGB المصلح
local function UpdateUI()
    local C = Color3.fromRGB(R, G, B)
    MainStroke.Color = C; IDStroke.Color = C; ImgStroke.Color = C
    Logo.Text = "N.X.R <font color='#" .. C:ToHex() .. "'> >>> </font>"
end

local function CreateSlider(name, col, order)
    local f = Instance.new("Frame", SettingsPage); f.Size = UDim2.new(0, 260, 0, 40); f.Position = UDim2.new(0, 10, 0, order * 50)
    f.BackgroundColor3 = Color3.fromRGB(20,20,20); Instance.new("UICorner", f).CornerRadius = UDim.new(0, 8)
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

-- [7] الأزرار السفلية
local function CreateBottom(name, x, cb)
    local b = Instance.new("TextButton", Main); b.Size = UDim2.new(0, 160, 0, 70); b.Position = UDim2.new(0, x, 1, -85)
    b.BackgroundColor3 = Color3.fromRGB(20, 20, 20); b.Text = name; b.TextColor3 = Color3.new(1, 1, 1); b.Font = "GothamBold"; b.TextSize = 13; Instance.new("UICorner", b).CornerRadius = UDim.new(0, 10)
    b.MouseButton1Click:Connect(cb)
end
CreateBottom("CONFIG", 20, function() end)
CreateBottom("SETTING", 195, function() HomePage.Visible = false; SettingsPage.Visible = true end)
CreateBottom("AD (إعلان)", 370, function() end)
