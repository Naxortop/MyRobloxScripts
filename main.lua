local Players = game:GetService("Players")
local LP = Players.LocalPlayer
local PG = LP:WaitForChild("PlayerGui")
local TS = game:GetService("TweenService")

-- تنظيف النسخ القديمة
if PG:FindFirstChild("NaxorLegendary") then PG.NaxorLegendary:Destroy() end

local Screen = Instance.new("ScreenGui", PG)
Screen.Name = "NaxorLegendary"
Screen.ResetOnSpawn = false

-- ⬛ الواجهة الرئيسية (Main Frame)
local Main = Instance.new("Frame", Screen)
Main.Size = UDim2.new(0, 580, 0, 400)
Main.Position = UDim2.new(0.5, -290, 0.5, -200)
Main.BackgroundColor3 = Color3.fromRGB(12, 12, 12)
Main.BorderSizePixel = 0
Main.Active = true
Main.Draggable = true 
Instance.new("UICorner", Main).CornerRadius = UDim.new(0, 15)

-- ✨ نيون أحمر "نابض" (Neon Pulse)
local Neon = Instance.new("Frame", Main)
Neon.ZIndex = 0
Neon.Size = UDim2.new(1, 4, 1, 4)
Neon.Position = UDim2.new(0, -2, 0, -2)
Neon.BackgroundColor3 = Color3.fromRGB(255, 0, 50)
Instance.new("UICorner", Neon).CornerRadius = UDim.new(0, 16)

-- كود أنيميشن النبض
task.spawn(function()
    while task.wait() do
        TS:Create(Neon, TweenInfo.new(1.2), {BackgroundTransparency = 0.7}):Play()
        task.wait(1.2)
        TS:Create(Neon, TweenInfo.new(1.2), {BackgroundTransparency = 0.2}):Play()
        task.wait(1.2)
    end
end)

-- 🔝 العنوان: N.X.R <<< (أبيض)
local Logo = Instance.new("TextLabel", Main)
Logo.Text = "N.X.R <<<"
Logo.Size = UDim2.new(0, 150, 0, 50); Logo.Position = UDim2.new(0, 20, 0, 10)
Logo.BackgroundTransparency = 1; Logo.TextColor3 = Color3.new(1, 1, 1)
Logo.TextSize = 26; Logo.Font = Enum.Font.GothamBold; Logo.TextXAlignment = "Left"

-- 👤 [القسم الأيسر] حسب رسمة فهد
local Avatar = Instance.new("ImageLabel", Main)
Avatar.Size = UDim2.new(0, 65, 0, 65); Avatar.Position = UDim2.new(0, 25, 0, 75)
Avatar.Image = "rbxthumb://type=AvatarHeadShot&id="..LP.UserId.."&w=150&h=150"
Avatar.BackgroundColor3 = Color3.fromRGB(25, 25, 25); Instance.new("UICorner", Avatar)

local StBox = Instance.new("Frame", Main)
StBox.Size = UDim2.new(0, 100, 0, 32); StBox.Position = UDim2.new(0, 25, 0, 150)
StBox.BackgroundColor3 = Color3.fromRGB(30, 30, 30); Instance.new("UICorner", StBox)
local StTxt = Instance.new("TextLabel", StBox)
StTxt.Text = "STATE"; StTxt.Size = UDim2.new(1, 0, 1, 0); StTxt.TextColor3 = Color3.fromRGB(255, 0, 50)
StTxt.BackgroundTransparency = 1; StTxt.TextSize = 15; StTxt.Font = Enum.Font.GothamBold

-- معلومات اللاعب والوقت (تتحدث تلقائياً)
local Info = Instance.new("TextLabel", Main)
Info.Size = UDim2.new(0, 180, 0, 120); Info.Position = UDim2.new(0, 25, 0, 192)
Info.BackgroundTransparency = 1; Info.TextColor3 = Color3.new(1, 1, 1)
Info.TextSize = 14; Info.Font = Enum.Font.GothamBold; Info.TextXAlignment = "Left"; Info.TextYAlignment = "Top"
Info.LineHeight = 1.5

task.spawn(function()
    while task.wait(1) do
        local timeStr = os.date("%X")
        Info.Text = "USER: "..LP.Name:upper().."\nSTATUS: ONLINE\nVERSION: 4.0.0\nTIME: "..timeStr.."\nN.X.R ACTIVE"
    end
end)

-- 🖼️ [المنتصف] المربع الكبير للصورة
local CenterBox = Instance.new("Frame", Main)
CenterBox.Size = UDim2.new(0, 340, 0, 210); CenterBox.Position = UDim2.new(0, 215, 0, 75)
CenterBox.BackgroundColor3 = Color3.fromRGB(18, 18, 18); Instance.new("UICorner", CenterBox)
local BoxNeon = Instance.new("Frame", CenterBox)
BoxNeon.ZIndex = 0; BoxNeon.Size = UDim2.new(1, 2, 1, 2); BoxNeon.Position = UDim2.new(0, -1, 0, -1)
BoxNeon.BackgroundColor3 = Color3.fromRGB(255, 0, 50); BoxNeon.BackgroundTransparency = 0.5; Instance.new("UICorner", BoxNeon)

-- 🔘 الأزرار السفلية الثلاثة بتأثير التفاعل
local function CreateBtn(name, x)
    local b = Instance.new("TextButton", Main)
    b.Size = UDim2.new(0, 170, 0, 80); b.Position = UDim2.new(0, x, 0, 305)
    b.BackgroundColor3 = Color3.fromRGB(22, 22, 22); b.Text = name; b.TextColor3 = Color3.new(1, 1, 1)
    b.Font = Enum.Font.GothamBold; b.TextSize = 16; Instance.new("UICorner", b)
    
    local bn = Instance.new("Frame", b); bn.ZIndex = 0; bn.Size = UDim2.new(1, 2, 1, 2); bn.Position = UDim2.new(0, -1, 0, -1)
    bn.BackgroundColor3 = Color3.fromRGB(255, 0, 50); Instance.new("UICorner", bn)
    
    b.MouseEnter:Connect(function() TS:Create(b, TweenInfo.new(0.3), {BackgroundColor3 = Color3.fromRGB(255, 0, 50)}):Play() end)
    b.MouseLeave:Connect(function() TS:Create(b, TweenInfo.new(0.3), {BackgroundColor3 = Color3.fromRGB(22, 22, 22)}):Play() end)
end
CreateBtn("CONFIG", 20); CreateBtn("SETTING", 205); CreateBtn("AD (إعلان)", 390)

-- 🔴 الزر العائم N
local Toggle = Instance.new("TextButton", Screen)
Toggle.Size = UDim2.new(0, 50, 0, 50); Toggle.Position = UDim2.new(0, 20, 0, 20)
Toggle.BackgroundColor3 = Color3.fromRGB(255, 0, 50); Toggle.Text = "N"; Toggle.TextColor3 = Color3.new(1,1,1)
Toggle.TextSize = 25; Toggle.Font = Enum.Font.GothamBold; Toggle.Draggable = true
Instance.new("UICorner", Toggle).CornerRadius = UDim.new(1, 0)
Toggle.MouseButton1Click:Connect(function() Main.Visible = not Main.Visible end)
