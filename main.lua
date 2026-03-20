local Players = game:GetService("Players")
local LP = Players.LocalPlayer
local PlayerGui = LP:WaitForChild("PlayerGui")

-- تنظيف أي عك قديم
if PlayerGui:FindFirstChild("Naxor_Official") then PlayerGui.Naxor_Official:Destroy() end

local Screen = Instance.new("ScreenGui", PlayerGui)
Screen.Name = "Naxor_Official"; Screen.ResetOnSpawn = false

-- الإطار الرئيسي (نفس الحجم اللي في بالك)
local Main = Instance.new("Frame", Screen)
Main.Size = UDim2.new(0, 560, 0, 390); Main.Position = UDim2.new(0.5, -280, 0.5, -195)
Main.BackgroundColor3 = Color3.fromRGB(8, 8, 8); Main.Active = true
Instance.new("UICorner", Main).CornerRadius = UDim.new(0, 15)
local Stroke = Instance.new("UIStroke", Main); Stroke.Color = Color3.fromRGB(220, 220, 220); Stroke.Thickness = 2

-- الهيدر (العنوان الفخم)
local Title = Instance.new("TextLabel", Main)
Title.Text = "N.X.R >>> SYSTEM"; Title.Size = UDim2.new(0, 200, 0, 60); Title.Position = UDim2.new(0, 25, 0, 0)
Title.BackgroundTransparency = 1; Title.TextColor3 = Color3.new(1, 1, 1); Title.TextSize = 20; Title.Font = "GothamBold"; Title.TextXAlignment = "Left"

-- زر إغلاق شغال
local Close = Instance.new("TextButton", Main)
Close.Text = "X"; Close.Size = UDim2.new(0, 30, 0, 30); Close.Position = UDim2.new(1, -40, 0, 15)
Close.BackgroundColor3 = Color3.fromRGB(20, 20, 20); Close.TextColor3 = Color3.new(1, 1, 1); Close.Font = "GothamBold"
Close.MouseButton1Click:Connect(function() Screen:Destroy() end); Instance.new("UICorner", Close)

-- الخط الفاصل
local Line = Instance.new("Frame", Main)
Line.Size = UDim2.new(1, 0, 0, 1); Line.Position = UDim2.new(0, 0, 0, 65); Line.BackgroundColor3 = Color3.new(1, 1, 1); Line.BackgroundTransparency = 0.6

-- [[ مربع الهوية - اليسار ]] --
local ID = Instance.new("Frame", Main)
ID.Size = UDim2.new(0, 215, 0, 210); ID.Position = UDim2.new(0, 25, 0, 80); ID.BackgroundColor3 = Color3.fromRGB(12, 12, 12)
Instance.new("UICorner", ID); Instance.new("UIStroke", ID).Color = Color3.fromRGB(100, 100, 100)

local Av = Instance.new("ImageLabel", ID)
Av.Size = UDim2.new(0, 60, 0, 60); Av.Position = UDim2.new(0, 15, 0, 15); Av.Image = "rbxthumb://type=AvatarHeadShot&id="..LP.UserId.."&w=150&h=150"; Instance.new("UICorner", Av)

local DN = Instance.new("TextLabel", ID)
DN.Text = LP.DisplayName; DN.Position = UDim2.new(0, 85, 0, 20); DN.Size = UDim2.new(0, 120, 0, 20)
DN.TextColor3 = Color3.new(1, 1, 1); DN.Font = "GothamBold"; DN.TextSize = 12; DN.TextXAlignment = "Left"; DN.BackgroundTransparency = 1

local RT = Instance.new("TextLabel", ID)
RT.Text = "OWNER"; RT.Size = UDim2.new(0, 60, 0, 20); RT.Position = UDim2.new(0, 85, 0, 42)
RT.TextColor3 = Color3.fromRGB(220, 220, 220); RT.Font = "GothamBold"; RT.TextSize = 10; RT.TextXAlignment = "Left"; RT.BackgroundTransparency = 1

local Time = Instance.new("TextLabel", ID)
Time.Position = UDim2.new(0, 15, 0, 140); Time.Size = UDim2.new(1, -20, 0, 20)
Time.TextColor3 = Color3.new(0.8, 0.8, 0.8); Time.TextSize = 10; Time.Font = "GothamBold"; Time.TextXAlignment = "Left"; Time.BackgroundTransparency = 1

-- [[ مربع الصورة - اليمين (فارغ كما طلبت) ]] --
local PicBox = Instance.new("Frame", Main)
PicBox.Size = UDim2.new(1, -285, 0, 210); PicBox.Position = UDim2.new(0, 255, 0, 80); PicBox.BackgroundColor3 = Color3.fromRGB(12, 12, 12)
Instance.new("UICorner", PicBox); Instance.new("UIStroke", PicBox).Color = Color3.fromRGB(100, 100, 100)

-- [[ الأزرار السفلية ]] --
local function AddBtn(name, x, w)
    local b = Instance.new("TextButton", Main)
    b.Text = name; b.Position = UDim2.new(0, x, 0, 310); b.Size = UDim2.new(0, w, 0, 48)
    b.BackgroundColor3 = Color3.fromRGB(15, 15, 15); b.TextColor3 = Color3.new(1, 1, 1); b.Font = "GothamBold"; b.TextSize = 10
    Instance.new("UICorner", b); Instance.new("UIStroke", b).Color = Color3.fromRGB(120, 120, 120)
end
AddBtn("CONFIG", 25, 100); AddBtn("SETTINGS", 140, 100); AddBtn("ADVERTISEMENT", 255, 280)

-- تشغيل العداد
task.spawn(function()
    local start = os.time()
    while task.wait(1) do
        local diff = os.time() - start
        Time.Text = "SESSION: " .. string.format("%02d:%02d:%02d", math.floor(diff/3600), math.floor((diff%3600)/60), diff%60)
    end
end)

-- نظام سحب بسيط ومضمون
local drag, dStart, sPos
Main.InputBegan:Connect(function(i) if i.UserInputType == Enum.UserInputType.MouseButton1 then drag = true; dStart = i.Position; sPos = Main.Position end end)
game:GetService("UserInputService").InputChanged:Connect(function(i)
    if drag and i.UserInputType == Enum.UserInputType.MouseMovement then
        local delta = i.Position - dStart
        Main.Position = UDim2.new(sPos.X.Scale, sPos.X.Offset + delta.X, sPos.Y.Scale, sPos.Y.Offset + delta.Y)
    end
end)
game:GetService("UserInputService").InputEnded:Connect(function(i) if i.UserInputType == Enum.UserInputType.MouseButton1 then drag = false end end)
