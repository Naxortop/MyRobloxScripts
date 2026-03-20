local p = game:GetService("Players").LocalPlayer
local pg = p:WaitForChild("PlayerGui")

-- تنظيف الشاشة
if pg:FindFirstChild("NaxorUltraHub") then pg.NaxorUltraHub:Destroy() end

local Screen = Instance.new("ScreenGui", pg)
Screen.Name = "NaxorUltraHub"
Screen.ResetOnSpawn = false

-- ⬛ الواجهة الرئيسية (سحب شغال)
local Main = Instance.new("Frame", Screen)
Main.Size = UDim2.new(0, 580, 0, 400)
Main.Position = UDim2.new(0.5, -290, 0.5, -200)
Main.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
Main.Active = true
Main.Draggable = true 
Instance.new("UICorner", Main).CornerRadius = UDim.new(0, 15)

-- ✨ إطار نيون أحمر قوي (Glow Effect)
local Neon = Instance.new("Frame", Main)
Neon.ZIndex = 0
Neon.Size = UDim2.new(1, 6, 1, 6)
Neon.Position = UDim2.new(0, -3, 0, -3)
Neon.BackgroundColor3 = Color3.fromRGB(255, 0, 50)
Instance.new("UICorner", Neon).CornerRadius = UDim.new(0, 16)

-- 🔴 الزر العائم (N)
local Toggle = Instance.new("TextButton", Screen)
Toggle.Size = UDim2.new(0, 50, 0, 50)
Toggle.Position = UDim2.new(0, 20, 0, 20)
Toggle.BackgroundColor3 = Color3.fromRGB(255, 0, 50)
Toggle.Text = "N"; Toggle.TextColor3 = Color3.new(1,1,1)
Toggle.TextSize = 25; Toggle.Font = Enum.Font.GothamBold; Toggle.Draggable = true
Instance.new("UICorner", Toggle).CornerRadius = UDim.new(1, 0)

-- 🔝 العنوان والصفحات فوق يمين (Home, Pages, Credits)
local Logo = Instance.new("TextLabel", Main)
Logo.Text = "N.X.R <font color='#ff0032'>>> > ></font>"
Logo.RichText = true; Logo.Size = UDim2.new(0, 150, 0, 50); Logo.Position = UDim2.new(0, 20, 0, 5)
Logo.BackgroundTransparency = 1; Logo.TextColor3 = Color3.new(1,1,1); Logo.TextSize = 22; Logo.Font = Enum.Font.GothamBold; Logo.TextXAlignment = "Left"

local function Tab(name, x, isActive)
    local t = Instance.new("TextButton", Main)
    t.Text = name; t.Size = UDim2.new(0, 70, 0, 40); t.Position = UDim2.new(1, x, 0, 10)
    t.BackgroundTransparency = 1; t.Font = Enum.Font.GothamBold; t.TextSize = 14
    t.TextColor3 = isActive and Color3.fromRGB(255, 0, 50) or Color3.fromRGB(150, 150, 150)
    
    if isActive then -- خط صغير تحت الهوم
        local line = Instance.new("Frame", t)
        line.Size = UDim2.new(0.6, 0, 0, 2); line.Position = UDim2.new(0.2, 0, 0.8, 0)
        line.BackgroundColor3 = Color3.fromRGB(255, 0, 50); line.BorderSizePixel = 0
    end
end
Tab("Home", -240, true)
Tab("Pages", -165, false)
Tab("Credits", -90, false)

-- 📸 مربع الصورة (Avatar)
local PicBox = Instance.new("Frame", Main)
PicBox.Size = UDim2.new(0, 65, 0, 65); PicBox.Position = UDim2.new(0, 20, 0, 75)
PicBox.BackgroundColor3 = Color3.fromRGB(25, 25, 25); Instance.new("UICorner", PicBox)

local Img = Instance.new("ImageLabel", PicBox)
Img.Size = UDim2.new(0.85, 0, 0.85, 0); Img.Position = UDim2.new(0.075, 0, 0.075, 0)
Img.Image = "rbxthumb://type=AvatarHeadShot&id="..p.UserId.."&w=150&h=150"
Img.BackgroundTransparency = 1; Instance.new("UICorner", Img)

-- 🏷️ مربع الـ STATE (مفصول بمسافة واضحة)
local StBox = Instance.new("Frame", Main)
StBox.Size = UDim2.new(0, 100, 0, 3
