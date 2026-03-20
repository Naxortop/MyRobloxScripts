-- [[ NAXOR FINAL VERIFIED CODE - V17.0 ]] --

local Players = game:GetService("Players")
local LP = Players.LocalPlayer
local PlayerGui = LP:WaitForChild("PlayerGui")
local UIS = game:GetService("UserInputService")

-- 1. تنظيف شامل وسريع
for _, v in pairs(PlayerGui:GetChildren()) do
    if v.Name == "NaxorUI" or v.Name == "Naxor_Official" then v:Destroy() end
end

local Screen = Instance.new("ScreenGui")
Screen.Name = "NaxorUI"
Screen.Parent = PlayerGui
Screen.ResetOnSpawn = false

-- 2. الإطار الرئيسي (الخلفية)
local Main = Instance.new("Frame")
Main.Name = "Main"
Main.Parent = Screen
Main.Size = UDim2.new(0, 560, 0, 390)
Main.Position = UDim2.new(0.5, -280, 0.5, -195)
Main.BackgroundColor3 = Color3.fromRGB(8, 8, 8)
Main.BorderSizePixel = 0
Main.Active = true
Main.ZIndex = 1 -- الطبقة السفلى

local UICorner = Instance.new("UICorner", Main)
UICorner.CornerRadius = UDim.new(0, 15)

local Stroke = Instance.new("UIStroke", Main)
Stroke.Color = Color3.fromRGB(220, 220, 220)
Stroke.Thickness = 2
Stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border

-- 3. الهيدر (العنوان) - رفع ZIndex لضمان الظهور
local Title = Instance.new("TextLabel")
Title.Parent = Main
Title.Text = "N.X.R >>> SYSTEM"
Title.Size = UDim2.new(0, 250, 0, 60)
Title.Position = UDim2.new(0, 25, 0, 0)
Title.BackgroundTransparency = 1
Title.TextColor3 = Color3.new(1, 1, 1)
Title.TextSize = 22
Title.Font = Enum.Font.GothamBold
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.ZIndex = 10 -- طبقة مرتفعة جداً

-- 4. مربع الهوية (اليسار)
local IDCard = Instance.new("Frame")
IDCard.Parent = Main
IDCard.Size = UDim2.new(0, 215, 0, 210)
IDCard.Position = UDim2.new(0, 25, 0, 80)
IDCard.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
IDCard.ZIndex = 5 -- فوق الخلفية

local IDCorner = Instance.new("UICorner", IDCard)
local IDStroke = Instance.new("UIStroke", IDCard)
IDStroke.Color = Color3.fromRGB(100, 100, 100)

-- بيانات اللاعب (صورة واسم)
local Av = Instance.new("ImageLabel", IDCard)
Av.Size = UDim2.new(0, 60, 0, 60)
Av.Position = UDim2.new(0, 15, 0, 15)
Av.Image = "rbxthumb://type=AvatarHeadShot&id="..LP.UserId.."&w=150&h=150"
Av.ZIndex = 6; Instance.new("UICorner", Av)

local Name = Instance.new("TextLabel", IDCard)
Name.Text = LP.DisplayName
Name.Size = UDim2.new(0, 120, 0, 20)
Name.Position = UDim2.new(0, 85, 0, 25)
Name.TextColor3 = Color3.new(1, 1, 1)
Name.BackgroundTransparency = 1
Name.Font = "GothamBold"
Name.ZIndex = 6; Name.TextXAlignment = "Left"

-- 5. مربع الصورة الفارغ (اليمين)
local PicBox = Instance.new("Frame")
PicBox.Parent = Main
PicBox.Size = UDim2.new(1, -285, 0, 210)
PicBox.Position = UDim2.new(0, 255, 0, 80)
PicBox.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
PicBox.ZIndex = 5

local PicCorner = Instance.new("UICorner", PicBox)
local PicStroke = Instance.new("UIStroke", PicBox)
PicStroke.Color = Color3.fromRGB(100, 100, 100)

-- 6. الأزرار السفلية (مع ضمان الطبقة)
local function MakeButton(txt, x, w)
    local b = Instance.new("TextButton")
    b.Parent = Main
    b.Text = txt
    b.Size = UDim2.new(0, w, 0, 48)
    b.Position = UDim2.new(0, x, 0, 310)
    b.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    b.TextColor3 = Color3.new(1, 1, 1)
    b.Font = "GothamBold"
    b.ZIndex = 7
    Instance.new("UICorner", b)
    Instance.new("UIStroke", b).Color = Color3.fromRGB(120, 120, 120)
end

MakeButton("CONFIG", 25, 100)
MakeButton("SETTINGS", 140, 100)
MakeButton("ADVERTISEMENT", 255, 280)

-- زر الإغلاق
local Close = Instance.new("TextButton", Main)
Close.Text = "X"; Close.Size = UDim2.new(0, 30, 0, 30); Close.Position = UDim2.new(1, -40, 0, 15)
Close.ZIndex = 11; Close.BackgroundColor3 = Color3.fromRGB(30,30,30); Close.TextColor3 = Color3.new(1,1,1)
Close.MouseButton1Click:Connect(function() Screen:Destroy() end)
Instance.new("UICorner", Close)

-- نظام السحب (مباشر وبدون تعقيد)
local d, ds, sp
Main.InputBegan:Connect(function(i) if i.UserInputType == Enum.UserInputType.MouseButton1 then d = true; ds = i.Position; sp = Main.Position end end)
UIS.InputChanged:Connect(function(i) if d and i.UserInputType == Enum.UserInputType.MouseMovement then local delta = i.Position - ds; Main.Position = UDim2.new(sp.X.Scale, sp.X.Offset + delta.X, sp.Y.Scale, sp.Y.Offset + delta.Y) end end)
UIS.InputEnded:Connect(function(i) if i.UserInputType == Enum.UserInputType.MouseButton1 then d = false end end)
