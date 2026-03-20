local LP = game:GetService("Players").LocalPlayer
local PG = LP:WaitForChild("PlayerGui")

-- تنظيف الشاشة
if PG:FindFirstChild("Naxor_Final_Neon") then PG.Naxor_Final_Neon:Destroy() end

local Screen = Instance.new("ScreenGui", PG)
Screen.Name = "Naxor_Final_Neon"
Screen.ResetOnSpawn = false

-- ⬛ الواجهة الرئيسية
local Main = Instance.new("Frame", Screen)
Main.Size = UDim2.new(0, 580, 0, 400)
Main.Position = UDim2.new(0.5, -290, 0.5, -200)
Main.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
Main.BorderSizePixel = 0
Main.Active = true
Main.Draggable = true 
Instance.new("UICorner", Main).CornerRadius = UDim.new(0, 15)

-- ✨ إرجاع النيون (الايطار الأحمر المشع)
local MainStroke = Instance.new("UIStroke", Main)
MainStroke.Color = Color3.fromRGB(255, 0, 50)
MainStroke.Thickness = 2.5 -- خليته سميك شوي عشان يبين نيون
MainStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border

-- 🔝 العنوان: N.X.R (بدون تضليل نهائياً)
local Logo = Instance.new("TextLabel", Main)
Logo.Text = "N.X.R <font color='#FF0032'>>>> </font>"
Logo.RichText = true
Logo.Size = UDim2.new(0, 180, 0, 60)
Logo.Position = UDim2.new(0, 20, 0, 5)
Logo.BackgroundTransparency = 1 -- شفاف 100%
Logo.TextColor3 = Color3.new(1, 1, 1)
Logo.TextSize = 28
Logo.Font = Enum.Font.GothamBold
Logo.TextXAlignment = "Left"

-- 👤 صورة تعريف اللاعب (رجعت ومثبتة)
local Avatar = Instance.new("ImageLabel", Main)
Avatar.Size = UDim2.new(0, 70, 0, 70)
Avatar.Position = UDim2.new(0, 25, 0, 75)
Avatar.Image = "rbxthumb://type=AvatarHeadShot&id="..LP.UserId.."&w=150&h=150"
Avatar.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
Avatar.BorderSizePixel = 0
Instance.new("UICorner", Avatar).CornerRadius = UDim.new(1, 0)
-- ايطار نيون خفيف للصورة
local AvStroke = Instance.new("UIStroke", Avatar)
AvStroke.Color = Color3.fromRGB(255, 0, 50)
AvStroke.Thickness = 1.5

-- 🏷️ بيانات اللاعب (طبيعية وبدون خلفية)
local Info = Instance.new("TextLabel", Main)
Info.Size = UDim2.new(0, 180, 0, 100)
Info.Position = UDim2.new(0, 25, 0, 155)
Info.BackgroundTransparency = 1
Info.TextColor3 = Color3.new(1, 1, 1)
Info.TextSize = 14
Info.Font = Enum.Font.GothamBold
Info.TextXAlignment = "Left"
Info.Text = "USER: "..LP.Name:upper().."\nSTATUS: ONLINE\nVERSION: 4.0.0\nN.X.R ACTIVE"

-- 🖼️ المربع الكبير (Center Box)
local CenterBox = Instance.new("Frame", Main)
CenterBox.Size = UDim2.new(0, 335, 0, 210)
CenterBox.Position = UDim2.new(0, 220, 0, 75)
CenterBox.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
Instance.new("UICorner", CenterBox)
local BoxStroke = Instance.new("UIStroke", CenterBox)
BoxStroke.Color = Color3.fromRGB(255, 0, 50)
BoxStroke.Thickness = 1

-- 🔘 الأزرار السفلية (بايطار نيون)
local function CreateBtn(name, x)
    local b = Instance.new("TextButton", Main)
    b.Size = UDim2.new(0, 170, 0, 80)
    b.Position = UDim2.new(0, x, 0, 300)
    b.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    b.Text = name
    b.TextColor3 = Color3.new(1, 1, 1)
    b.Font = Enum.Font.GothamBold
    b.TextSize = 16
    Instance.new("UICorner", b)
    local bs = Instance.new("UIStroke", b)
    bs.Color = Color3.fromRGB(255, 0, 50)
    bs.Thickness = 1.5
end

CreateBtn("CONFIG", 20)
CreateBtn("SETTING", 205)
CreateBtn("AD (إعلان)", 390)

print("Naxor V4: Neon Restored & Text Cleaned!")
