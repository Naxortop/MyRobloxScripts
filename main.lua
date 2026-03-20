-- [[ NAXOR COMBINED V15.0 - SIMPLE & COMPLETE ]] --

local Players = game:GetService("Players")
local LP = Players.LocalPlayer
local PlayerGui = LP:WaitForChild("PlayerGui")

-- تنظيف الواجهة القديمة
if PlayerGui:FindFirstChild("NaxorUI") then PlayerGui.NaxorUI:Destroy() end

local Screen = Instance.new("ScreenGui", PlayerGui)
Screen.Name = "NaxorUI"
Screen.ResetOnSpawn = false

-- الإطار الرئيسي
local Main = Instance.new("Frame", Screen)
Main.Size = UDim2.new(0, 560, 0, 390)
Main.Position = UDim2.new(0.5, -280, 0.5, -195)
Main.BackgroundColor3 = Color3.fromRGB(8, 8, 8)
Main.Active = true
Instance.new("UICorner", Main).CornerRadius = UDim.new(0, 15)
local Stroke = Instance.new("UIStroke", Main)
Stroke.Color = Color3.fromRGB(220, 220, 220)
Stroke.Thickness = 2

-- الهيدر (العنوان)
local Header = Instance.new("TextLabel", Main)
Header.Text = "N.X.R >>> SYSTEM"
Header.Size = UDim2.new(0, 250, 0, 60)
Header.Position = UDim2.new(0, 25, 0, 0)
Header.BackgroundTransparency = 1
Header.TextColor3 = Color3.new(1, 1, 1)
Header.TextSize = 20
Header.Font = "GothamBold"
Header.TextXAlignment = "Left"

-- زر الإغلاق
local Close = Instance.new("TextButton", Main)
Close.Text = "X"
Close.Size = UDim2.new(0, 30, 0, 30)
Close.Position = UDim2.new(1, -40, 0, 15)
Close.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
Close.TextColor3 = Color3.new(1, 1, 1)
Close.Font = "GothamBold"
Close.MouseButton1Click:Connect(function() Screen:Destroy() end)
Instance.new("UICorner", Close)

-- الخط الفاصل
local Line = Instance.new("Frame", Main)
Line.Size = UDim2.new(1, 0, 0, 1)
Line.Position = UDim2.new(0, 0, 0, 65)
Line.BackgroundColor3 = Color3.fromRGB(220, 220, 220)
Line.BackgroundTransparency = 0.5

-- [ مربع الهوية - اليسار ] --
local ID = Instance.new("Frame", Main)
ID.Size = UDim2.new(0, 215, 0, 210)
ID.Position = UDim2.new(0, 25, 0, 80)
ID.BackgroundColor3 = Color3.fromRGB(12, 12, 12)
Instance.new("UICorner", ID)
Instance.new("UIStroke", ID).Color = Color3.fromRGB(100, 100, 100)

local Av = Instance.new("ImageLabel", ID)
Av.Size = UDim2.new(0, 60, 0, 60)
Av.Position = UDim2.new(0, 15, 0, 15)
Av.Image = "rbxthumb://type=AvatarHeadShot&id="..LP.UserId.."&w=150&h=150"
Instance.new("UICorner", Av)

local DN = Instance.new("TextLabel", ID)
DN.Text = LP.DisplayName
DN.Position = UDim2.new(0, 85, 0, 20)
DN.Size = UDim2.new(0, 120, 0, 20)
DN.TextColor3 = Color3.new(1, 1, 1)
DN.BackgroundTransparency = 1
DN.Font = "GothamBold"; DN.TextSize = 12; DN.TextXAlignment = "Left"

-- رتبة OWNER
local RankFrame = Instance.new("Frame", ID)
RankFrame.Size = UDim2.new(0, 60, 0, 20)
RankFrame.Position = UDim2.new(0, 85, 0, 45)
RankFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
Instance.new("UICorner", RankFrame).CornerRadius = UDim.new(0, 4)
local RT = Instance.new("TextLabel", RankFrame)
RT.Size = UDim2.new(1, 0, 1, 0); RT.Text = "OWNER"; RT.TextColor3 = Color3.new(1, 1, 1)
RT.TextSize = 9; RT.Font = "GothamBold"; RT.BackgroundTransparency = 1

-- الوقت واللاعبين
local SessionTime = Instance.new("TextLabel", ID)
SessionTime.Position = UDim2.new(0, 15, 0, 140)
SessionTime.Size = UDim2.new(1, -20, 0, 20)
SessionTime.TextColor3 = Color3.fromRGB(200, 200, 200)
SessionTime.TextSize = 10; SessionTime.Font = "GothamBold"; SessionTime.TextXAlignment = "Left"; SessionTime.BackgroundTransparency = 1

local OnlineLabel = Instance.new("TextLabel", ID)
OnlineLabel.Position = UDim2.new(0, 15, 1, -30)
OnlineLabel.Size = UDim2.new(1, -20, 0, 20)
OnlineLabel.TextColor3 = Color3.fromRGB(0, 255, 150)
OnlineLabel.TextSize = 9; OnlineLabel.Font = "GothamBold"; OnlineLabel.TextXAlignment = "Left"; OnlineLabel.BackgroundTransparency = 1

-- [ مربع الصورة الفارغ - اليمين ] --
local PicBox = Instance.new("Frame", Main)
PicBox.Size = UDim2.new(1, -285, 0, 210)
PicBox.Position = UDim2.new(0, 255, 0, 80)
PicBox.BackgroundColor3 = Color3.fromRGB(12, 12, 12)
Instance.new("UICorner", PicBox)
Instance.new("UIStroke", PicBox).Color = Color3.fromRGB(100, 100, 100)

-- [ الأزرار السفلية ] --
local function CreateBtn(text, pos, size)
    local b = Instance.new("TextButton", Main)
    b.Text = text; b.Position = pos; b.Size = size
    b.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
    b.TextColor3 = Color3.new(1, 1, 1); b.Font = "GothamBold"; b.TextSize = 10
    Instance.new("UICorner", b)
    Instance.new("UIStroke", b).Color = Color3.fromRGB(120, 120, 120)
end

CreateBtn("CONFIG", UDim2.new(0, 25, 0, 310), UDim2.new(0, 100, 0, 45))
CreateBtn("SETTINGS", UDim2.new(0, 140, 0, 310), UDim2.new(0, 100, 0, 45))
CreateBtn("ADVERTISEMENT", UDim2.new(0, 255, 0, 310), UDim2.new(1, -280, 0, 45))

-- تحديث الوقت
task.spawn(function()
    local start = os.time()
    while task.wait(1) do
        local diff = os.time() - start
        SessionTime.Text = "SESSION: " .. string.format("%02d:%02d:%02d", math.floor(diff/3600), math.floor((diff%3600)/60), diff%60)
        OnlineLabel.Text = "● " .. math.random(2800, 3200) .. " USERS ONLINE"
    end
end)

-- نظام السحب البسيط
local dragging, dragInput, dragStart, startPos
Main.InputBegan:Connect(function(i) if i.UserInputType == Enum.UserInputType.MouseButton1 then dragging = true; dragStart = i.Position; startPos = Main.Position end end)
game:GetService("UserInputService").InputChanged:Connect(function(i)
    if dragging and i.UserInputType == Enum.UserInputType.MouseMovement then
        local d = i.Position - dragStart
        Main.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + d.X, startPos.Y.Scale, startPos.Y.Offset + d.Y)
    end
end)
game:GetService("UserInputService").InputEnded:Connect(function(i) if i.UserInputType == Enum.UserInputType.MouseButton1 then dragging = false end end)
