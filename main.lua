local LP = game:GetService("Players").LocalPlayer
local PG = LP:WaitForChild("PlayerGui")

-- حذف النسخ القديمة
if PG:FindFirstChild("NaxorFinal") then PG.NaxorFinal:Destroy() end

local Screen = Instance.new("ScreenGui", PG)
Screen.Name = "NaxorFinal"
Screen.ResetOnSpawn = false

-- ⬛ الواجهة الرئيسية
local Main = Instance.new("Frame", Screen)
Main.Size = UDim2.new(0, 600, 0, 420)
Main.Position = UDim2.new(0.5, -300, 0.5, -210)
Main.BackgroundColor3 = Color3.fromRGB(12, 12, 12)
Main.BorderSizePixel = 0
Main.Active = true
Main.Draggable = true 
Instance.new("UICorner", Main).CornerRadius = UDim.new(0, 12)

-- 🔝 العنوان: N.X.R >>> (خلفية شفافة)
local Logo = Instance.new("TextLabel", Main)
Logo.Text = "N.X.R <font color='#FF0032'>>>> </font>"
Logo.RichText = true
Logo.Size = UDim2.new(0, 200, 0, 60)
Logo.Position = UDim2.new(0, 20, 0, 0)
Logo.BackgroundTransparency = 1 -- جعلها شفافة
Logo.TextColor3 = Color3.new(1, 1, 1)
Logo.TextSize = 28
Logo.Font = Enum.Font.GothamBold
Logo.TextXAlignment = "Left"

-- 🏷️ الـ Tabs (خلفيات شفافة تماماً)
local function CreateTab(name, x, isActive)
    local t = Instance.new("TextButton", Main)
    t.Text = name
    t.Size = UDim2.new(0, 70, 0, 60)
    t.Position = UDim2.new(1, x, 0, 0)
    t.BackgroundTransparency = 1 -- إزالة اللون اللي خلف الحروف
    t.TextColor3 = isActive and Color3.fromRGB(255, 0, 50) or Color3.fromRGB(180, 180, 180)
    t.TextSize = 16
    t.Font = Enum.Font.GothamBold
end
CreateTab("Home", -260, true)
CreateTab("Pages", -180, false)
CreateTab("Credits", -100, false)

-- 👤 قسم المعلومات (نصوص بدون خلفيات)
local StateTag = Instance.new("TextLabel", Main)
StateTag.Text = "STATE"
StateTag.Size = UDim2.new(0, 60, 0, 20)
StateTag.Position = UDim2.new(0, 85, 0, 80)
StateTag.TextColor3 = Color3.fromRGB(255, 0, 50)
StateTag.BackgroundTransparency = 1 -- شفاف
StateTag.Font = Enum.Font.GothamBold
StateTag.TextSize = 15

local Info = Instance.new("TextLabel", Main)
Info.Size = UDim2.new(0, 180, 0, 120)
Info.Position = UDim2.new(0, 25, 0, 110)
Info.BackgroundTransparency = 1 -- شفاف
Info.TextColor3 = Color3.new(0.9, 0.9, 0.9)
Info.TextSize = 14
Info.Font = Enum.Font.GothamBold
Info.TextXAlignment = "Left"
Info.Text = "User: "..LP.Name.."\nStatus: Online\nVersion: 4.0\nNaxor Script"

-- 🖼️ المربع الكبير (Center Box) - يبقى بلونه لتمييز المنطقة
local PicArea = Instance.new("Frame", Main)
PicArea.Size = UDim2.new(0, 355, 0, 220)
PicArea.Position = UDim2.new(0, 230, 0, 75)
PicArea.BackgroundColor3 = Color3.fromRGB(18, 18, 18)
Instance.new("UICorner", PicArea)
Instance.new("UIStroke", PicArea).Color = Color3.fromRGB(255, 0, 50)

-- 🔘 الأزرار السفلية (نصوص الأزرار طبيعية وبدون خلفية إضافية)
local function CreateBottomBtn(name, x)
    local b = Instance.new("TextButton", Main)
    b.Size = UDim2.new(0, 180, 0, 85)
    b.Position = UDim2.new(0, x, 0, 310)
    b.BackgroundColor3 = Color3.fromRGB(20, 20, 20) -- جسم الزر فقط
    b.Text = name
    b.TextColor3 = Color3.new(1, 1, 1)
    b.Font = Enum.Font.GothamBold
    b.TextSize = 16
    Instance.new("UICorner", b)
    local bs = Instance.new("UIStroke", b)
    bs.Color = Color3.fromRGB(255, 0, 50)
    bs.Thickness = 1.2
end

CreateBottomBtn("CONFIG", 15)
CreateBottomBtn("SETTING", 210)
CreateBottomBtn("AD (إعلان)", 405)

print("UI Cleaned: Text backgrounds removed.")
