local LP = game:GetService("Players").LocalPlayer
local PG = LP:WaitForChild("PlayerGui")

-- حذف النسخ القديمة
if PG:FindFirstChild("NaxorFinal") then PG.NaxorFinal:Destroy() end

local Screen = Instance.new("ScreenGui", PG)
Screen.Name = "NaxorFinal"
Screen.ResetOnSpawn = false

-- ⬛ الواجهة الرئيسية (N.X.R)
local Main = Instance.new("Frame", Screen)
Main.Size = UDim2.new(0, 580, 0, 400)
Main.Position = UDim2.new(0.5, -290, 0.5, -200)
Main.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
Main.BorderSizePixel = 0
Main.Active = true
Main.Draggable = true 
Instance.new("UICorner", Main).CornerRadius = UDim.new(0, 15)

-- ✨ نيون أحمر خارجي
local Neon = Instance.new("Frame", Main)
Neon.ZIndex = 0; Neon.Size = UDim2.new(1, 4, 1, 4); Neon.Position = UDim2.new(0, -2, 0, -2)
Neon.BackgroundColor3 = Color3.fromRGB(255, 0, 50); Instance.new("UICorner", Neon).CornerRadius = UDim.new(0, 16)

-- 🔝 العنوان: N.X.R <<<
local Logo = Instance.new("TextLabel", Main)
Logo.Text = "N.X.R <<<"; Logo.Size = UDim2.new(0, 150, 0, 50); Logo.Position = UDim2.new(0, 20, 0, 10)
Logo.BackgroundTransparency = 1; Logo.TextColor3 = Color3.new(1, 1, 1); Logo.TextSize = 26
Logo.Font = Enum.Font.GothamBold; Logo.TextXAlignment = "Left"

-- 🏷️ الـ Tabs
local function CreateTab(name, x, color)
    local t = Instance.new("TextButton", Main)
    t.Text = name; t.Size = UDim2.new(0, 75, 0, 40); t.Position = UDim2.new(1, x, 0, 15)
    t.BackgroundTransparency = 1; t.TextColor3 = color; t.TextSize = 14; t.Font = Enum.Font.GothamBold
end
CreateTab("Home", -245, Color3.fromRGB(255, 0, 50))
CreateTab("Pages", -170, Color3.fromRGB(150, 150, 150))
CreateTab("Credits", -95, Color3.fromRGB(150, 150, 150))

-- 👤 معلومات اللاعب (ترتيب فهد)
local Avatar = Instance.new("ImageLabel", Main)
Avatar.Size = UDim2.new(0, 65, 0, 65); Avatar.Position = UDim2.new(0, 25, 0, 75)
Avatar.Image = "rbxthumb://type=AvatarHeadShot&id="..LP.UserId.."&w=150&h=150"
Avatar.BackgroundColor3 = Color3.fromRGB(30, 30, 30); Instance.new("UICorner", Avatar)

local StBox = Instance.new("Frame", Main)
StBox.Size = UDim2.new(0, 100, 0, 32); StBox.Position = UDim2.new(0, 25, 0, 150)
StBox.BackgroundColor3 = Color3.fromRGB(25, 25, 25); Instance.new("UICorner", StBox)
local StTxt = Instance.new("TextLabel", StBox)
StTxt.Text = "STATE"; StTxt.Size = UDim2.new(1, 0, 1, 0); StTxt.TextColor3 = Color3.fromRGB(255, 0, 50)
StTxt.BackgroundTransparency = 1; StTxt.TextSize = 15; StTxt.Font = Enum.Font.GothamBold

local Info = Instance.new("TextLabel", Main)
Info.Size = UDim2.new(0, 180, 0, 100); Info.Position = UDim2.new(0, 25, 0, 192)
Info.BackgroundTransparency = 1; Info.TextColor3 = Color3.new(1, 1, 1); Info.TextSize = 15
Info.Font = Enum.Font.GothamBold; Info.TextXAlignment = "Left"; Info.TextYAlignment = "Top"
Info.Text = "USER: "..LP.Name:upper().."\nSTATUS: ONLINE\nVERSION: 4.0.0\nN.X.R ACTIVE"

-- 🖼️ المربع الكبير (Center Box)
local CenterBox = Instance.new("Frame", Main)
CenterBox.Size = UDim2.new(0, 340, 0, 210); CenterBox.Position = UDim2.new(0, 215, 0, 75)
CenterBox.BackgroundColor3 = Color3.fromRGB(20, 20, 20); Instance.new("UICorner", CenterBox)
local BoxStroke = Instance.new("UIStroke", CenterBox)
BoxStroke.Color = Color3.fromRGB(255, 0, 50); BoxStroke.Thickness = 1

-- 🔘 الأزرار السفلية
local function CreateBtn(name, x)
    local b = Instance.new("TextButton", Main)
    b.Size = UDim2.new(0, 170, 0, 80); b.Position = UDim2.new(0, x, 0, 305)
    b.BackgroundColor3 = Color3.fromRGB(25, 25, 25); b.Text = name; b.TextColor3 = Color3.new(1, 1, 1)
    b.Font = Enum.Font.GothamBold; b.TextSize = 16; Instance.new("UICorner", b)
    local bs = Instance.new("UIStroke", b); bs.Color = Color3.fromRGB(255, 0, 50); bs.Thickness = 1.5
end
CreateBtn("CONFIG", 20); CreateBtn("SETTING", 205); CreateBtn("AD (إعلان)", 390)

-- 🔴 الزر العائم NXR
local Toggle = Instance.new("TextButton", Screen)
Toggle.Size = UDim2.new(0, 60, 0, 60); Toggle.Position = UDim2.new(0, 20, 0, 20)
Toggle.BackgroundColor3 = Color3.fromRGB(10, 10, 10); Toggle.Text = "NXR"; Toggle.TextColor3 = Color3.new(1, 1, 1)
Toggle.TextSize = 18; Toggle.Font = Enum.Font.GothamBold; Toggle.Draggable = true
Instance.new("UICorner", Toggle).CornerRadius = UDim.new(1, 0)
local TS = Instance.new("UIStroke", Toggle); TS.Color = Color3.fromRGB(255, 0, 50); TS.Thickness = 3

Toggle.MouseButton1Click:Connect(function() Main.Visible = not Main.Visible end)

-- ✅ Loaded Successfully
warn("N.X.R Hub Loaded Successfully!")
