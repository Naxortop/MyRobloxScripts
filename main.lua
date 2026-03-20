-- [[ NAXOR REPAIR V18.0 - RESTORE ALL MISSED DETAILS ]] --
-- Back to image_4.png glory

local Players = game:GetService("Players")
local LP = Players.LocalPlayer
local PlayerGui = LP:WaitForChild("PlayerGui")
local UIS = game:GetService("UserInputService")
local TS = game:GetService("TweenService")

-- تنظيف شامل
for _, v in pairs(PlayerGui:GetChildren()) do
    if v.Name == "NaxorUI" or v.Name == "Naxor_Official" then v:Destroy() end
end

local Screen = Instance.new("ScreenGui", PlayerGui)
Screen.Name = "NaxorUI"; Screen.ResetOnSpawn = false

-- 1. الإطار الرئيسي
local Main = Instance.new("Frame", Screen)
Main.Name = "Main"
Main.Size = UDim2.new(0, 560, 0, 390); Main.Position = UDim2.new(0.5, -280, 0.5, -195)
Main.BackgroundColor3 = Color3.fromRGB(8, 8, 8); Main.BorderSizePixel = 0; Main.Active = true
Instance.new("UICorner", Main).CornerRadius = UDim.new(0, 15)
local Stroke = Instance.new("UIStroke", Main); Stroke.Color = Color3.fromRGB(220, 220, 220); Stroke.Thickness = 2

-- 2. الهيدر وزر الإغلاق
local Header = Instance.new("Frame", Main); Header.Size = UDim2.new(1, 0, 0, 65); Header.BackgroundTransparency = 1
Header.ZIndex = 5 -- تأكيد الظهور فوق الخلفية

local Logo = Instance.new("TextLabel", Header)
Logo.Text = "N.X.R >>> SYSTEM"; Logo.Size = UDim2.new(0, 200, 1, 0); Logo.Position = UDim2.new(0, 25, 0, 0)
Logo.BackgroundTransparency = 1; Logo.TextColor3 = Color3.new(1, 1, 1)
Logo.TextSize = 20; Logo.Font = Enum.Font.GothamBold; Logo.TextXAlignment = "Left"; Logo.ZIndex = 6

local Close = Instance.new("TextButton", Header)
Close.Text = "X"; Close.Size = UDim2.new(0, 30, 0, 30); Close.Position = UDim2.new(1, -40, 0, 17)
Close.BackgroundColor3 = Color3.fromRGB(20, 20, 20); Close.TextColor3 = Color3.new(1, 1, 1)
Close.Font = "GothamBold"; Close.ZIndex = 10; Close.MouseButton1Click:Connect(function() Screen:Destroy() end); Instance.new("UICorner", Close)

-- الخط الفاصل (فوق المربعات)
local Separator = Instance.new("Frame", Main); Separator.Size = UDim2.new(1, 0, 0, 1.5); Separator.Position = UDim2.new(0, 0, 0, 65); Separator.BackgroundColor3 = Color3.new(1, 1, 1); Separator.BackgroundTransparency = 0.6; Separator.ZIndex = 4

-- 3. مربع الهوية (اليسار) - تم توسيعه قليلاً وإضافة التفاصيل
local IDCard = Instance.new("Frame", Main)
IDCard.Size = UDim2.new(0, 215, 0, 210); IDCard.Position = UDim2.new(0, 25, 0, 80)
IDCard.BackgroundColor3 = Color3.fromRGB(12, 12, 12); IDCard.ZIndex = 4
Instance.new("UICorner", IDCard).CornerRadius = UDim.new(0, 10); local IDStroke = Instance.new("UIStroke", IDCard); IDStroke.Color = Color3.fromRGB(100, 100, 100)

-- صورة واسم Cheakingscript
local Av = Instance.new("ImageLabel", IDCard); Av.Size = UDim2.new(0, 60, 0, 60); Av.Position = UDim2.new(0, 15, 0, 15); Av.Image = "rbxthumb://type=AvatarHeadShot&id="..LP.UserId.."&w=150&h=150"; Av.ZIndex = 6; Instance.new("UICorner", Av)
local DN = Instance.new("TextLabel", IDCard); DN.Text = "Cheakingscript"; DN.Size = UDim2.new(0, 120, 0, 20); DN.Position = UDim2.new(0, 85, 0, 20); DN.TextColor3 = Color3.new(1, 1, 1); DN.Font = "GothamBold"; DN.TextSize = 12; DN.TextXAlignment = "Left"; DN.ZIndex = 6; DN.BackgroundTransparency = 1
local UN = Instance.new("TextLabel", IDCard); UN.Text = "@Cheakingscript"; UN.Size = UDim2.new(0, 120, 0, 15); UN.Position = UDim2.new(0, 85, 0, 38); UN.TextColor3 = Color3.fromRGB(150, 150, 150); UN.Font = "GothamBold"; UN.TextSize = 9; UN.TextXAlignment = "Left"; UN.ZIndex = 6; UN.BackgroundTransparency = 1

-- رتبة OWNER الفخمة
local RankTag = Instance.new("Frame", IDCard); RankTag.Size = UDim2.new(0, 55, 0, 18); RankTag.Position = UDim2.new(0, 85, 0, 55); RankTag.BackgroundColor3 = Color3.fromRGB(20, 20, 20); RankTag.ZIndex = 6; Instance.new("UICorner", RankTag).CornerRadius = UDim.new(0, 4); local RankStroke = Instance.new("UIStroke", RankTag); RankStroke.Color = Color3.new(1, 1, 1); RankStroke.Thickness = 1
local RankText = Instance.new("TextLabel", RankTag); RankText.Size = UDim2.new(1, 0, 1, 0); RankText.Text = "OWNER"; RankText.TextColor3 = Color3.new(1, 1, 1); RankText.TextSize = 8; RankText.Font = "GothamBold"; RankText.ZIndex = 7; RankText.BackgroundTransparency = 1

-- الوقت واللاعبين
local SessionTime = Instance.new("TextLabel", IDCard); SessionTime.Position = UDim2.new(0, 15, 0, 140); SessionTime.Size = UDim2.new(1, -20, 0, 20); SessionTime.TextColor3 = Color3.fromRGB(200, 200, 200); SessionTime.TextSize = 10; SessionTime.Font = "GothamBold"; SessionTime.TextXAlignment = "Left"; SessionTime.ZIndex = 6; SessionTime.BackgroundTransparency = 1
local OnlineLabel = Instance.new("TextLabel", IDCard); OnlineLabel.Position = UDim2.new(0, 25, 1, -30); OnlineLabel.Size = UDim2.new(1, -30, 0, 20); OnlineLabel.TextColor3 = Color3.fromRGB(0, 255, 150); OnlineLabel.TextSize = 9; OnlineLabel.Font = "GothamBold"; OnlineLabel.TextXAlignment = "Left"; OnlineLabel.ZIndex = 6; OnlineLabel.BackgroundTransparency = 1
local OnlineDot = Instance.new("Frame", IDCard); OnlineDot.Size = UDim2.new(0, 6, 0, 6); OnlineDot.Position = UDim2.new(0, 15, 1, -23); OnlineDot.BackgroundColor3 = Color3.fromRGB(0, 255, 150); OnlineDot.ZIndex = 6; Instance.new("UICorner", OnlineDot).CornerRadius = UDim.new(1, 0)

-- مربع الصورة الفارغ (اليمين) كما طلبت
local PicBox = Instance.new("Frame", Main)
PicBox.Size = UDim2.new(1, -285, 0, 210); PicBox.Position = UDim2.new(0, 255, 0, 80)
PicBox.BackgroundColor3 = Color3.fromRGB(12, 12, 12); PicBox.ZIndex = 4
Instance.new("UICorner", PicBox).CornerRadius = UDim.new(0, 10); Instance.new("UIStroke", PicBox).Color = Color3.fromRGB(100, 100, 100)

-- 4. القائمة العلوية (Tabs) - التنقل بين الصفحات
local Nav = Instance.new("Frame", Header); Nav.Size = UDim2.new(0, 200, 1, 0); Nav.Position = UDim2.new(1, -250, 0, 0); Nav.BackgroundTransparency = 1; Nav.ZIndex = 6
local function NavBtn(txt, x)
    local b = Instance.new("TextButton", Nav)
    b.Text = txt; b.Size = UDim2.new(0, 60, 1, 0); b.Position = UDim2.new(0, x, 0, 0)
    b.BackgroundTransparency = 1; b.TextColor3 = Color3.fromRGB(150, 150, 150); b.Font = "GothamBold"; b.TextSize = 12; b.ZIndex = 7
    if txt == "Home" then b.TextColor3 = Color3.new(1, 1, 1) end -- تحديد الصفحة الحالية
end
NavBtn("Home", 0); NavBtn("Pages", 65); NavBtn("Credits", 130)

-- 5. الأزرار السفلية
local function ActionBtn(txt, x, w)
    local b = Instance.new("TextButton", Main)
    b.Text = txt; b.Size = UDim2.new(0, w, 0, 48); b.Position = UDim2.new(0, x, 0, 305)
    b.BackgroundColor3 = Color3.fromRGB(15, 15, 15); b.TextColor3 = Color3.new(1, 1, 1)
    b.Font = "GothamBold"; b.TextSize = 11; b.ZIndex = 7; Instance.new("UICorner", b); Instance.new("UIStroke", b).Color = Color3.fromRGB(120, 120, 120)
end
ActionBtn("CONFIG", 25, 100); ActionBtn("SETTINGS", 140, 100); ActionBtn("ADVERTISEMENT", 255, 280)

-- [ المحرك ] --
task.spawn(function()
    local start = os.time()
    while task.wait(1) do
        local diff = os.time() - start
        SessionTime.Text = "PlayTime: " .. string.format("%02d:%02d:%02d", math.floor(diff/3600), math.floor((diff%3600)/60), diff%60)
        OnlineLabel.Text = math.random(2800, 3200) .. " USERS ONLINE"
        OnlineDot.Visible = not OnlineDot.Visible; task.wait(0.5); OnlineDot.Visible = not OnlineDot.Visible -- وميض النقطة
    end
end)

-- نظام سحب مضمون
local drag, ds, sp
Main.InputBegan:Connect(function(i) if i.UserInputType == Enum.UserInputType.MouseButton1 then drag = true; ds = i.Position; sp = Main.Position end end)
game:GetService("UserInputService").InputChanged:Connect(function(i) if drag and i.UserInputType == Enum.UserInputType.MouseMovement then local delta = i.Position - ds; Main.Position = UDim2.new(sp.X.Scale, sp.X.Offset + delta.X, sp.Y.Scale, sp.Y.Offset + delta.Y) end end)
game:GetService("UserInputService").InputEnded:Connect(function(i) if i.UserInputType == Enum.UserInputType.MouseButton1 then drag = false end end)
