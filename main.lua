-- [[ NAXOR SYSTEM - FULL RECOVERY V22.0 ]] --

local Players = game:GetService("Players")
local LP = Players.LocalPlayer
local PlayerGui = LP:WaitForChild("PlayerGui")
local UIS = game:GetService("UserInputService")
local TS = game:GetService("TweenService")

-- تنظيف أي نسخ قديمة
if PlayerGui:FindFirstChild("Naxor_Complete") then PlayerGui.Naxor_Complete:Destroy() end

local Screen = Instance.new("ScreenGui", PlayerGui)
Screen.Name = "Naxor_Complete"; Screen.ResetOnSpawn = false

local MainColor = Color3.fromRGB(220, 220, 220)

-- [[ وظيفة السحب السلس وثبات الكاميرا ]] --
local function Drag(obj)
    local dragging, dragInput, dragStart, startPos
    obj.InputBegan:Connect(function(input)
        if (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) then
            dragging = true; dragStart = input.Position; startPos = obj.Position
        end
    end)
    UIS.InputChanged:Connect(function(input)
        if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
            local delta = input.Position - dragStart
            obj.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
        end
    end)
    UIS.InputEnded:Connect(function(input) if input.UserInputType == Enum.UserInputType.MouseButton1 then dragging = false end end)
end

-- [[ 1. الزر العائم ]] --
local ToggleBtn = Instance.new("ImageButton", Screen)
ToggleBtn.Size = UDim2.new(0, 55, 0, 55); ToggleBtn.Position = UDim2.new(0, 50, 0.5, -25)
ToggleBtn.BackgroundColor3 = Color3.fromRGB(15, 15, 15); ToggleBtn.Visible = false
ToggleBtn.Image = "rbxassetid://18443200213"
Instance.new("UICorner", ToggleBtn).CornerRadius = UDim.new(1, 0)
local BTNStroke = Instance.new("UIStroke", ToggleBtn); BTNStroke.Color = MainColor; Drag(ToggleBtn)

-- [[ 2. الواجهة الرئيسية (Main) ]] --
local Main = Instance.new("Frame", Screen)
Main.Size = UDim2.new(0, 560, 0, 390); Main.Position = UDim2.new(0.5, -280, 0.5, -195)
Main.BackgroundColor3 = Color3.fromRGB(8, 8, 8); Main.Active = true; Main.ClipsDescendants = true
Instance.new("UICorner", Main).CornerRadius = UDim.new(0, 15)
local MainStroke = Instance.new("UIStroke", Main); MainStroke.Color = MainColor; MainStroke.Thickness = 2; Drag(Main)

-- [[ 3. الهيدر (إسم السكربت والصفحات) ]] --
local Header = Instance.new("Frame", Main); Header.Size = UDim2.new(1, 0, 0, 65); Header.BackgroundTransparency = 1
local Logo = Instance.new("TextLabel", Header)
Logo.Text = "N.X.R >>> SYSTEM"; Logo.Position = UDim2.new(0, 25, 0, 0); Logo.Size = UDim2.new(0, 200, 1, 0)
Logo.TextColor3 = Color3.new(1,1,1); Logo.Font = "GothamBold"; Logo.TextSize = 20; Logo.BackgroundTransparency = 1; Logo.TextXAlignment = "Left"

-- خط نيون فاصل
local Neon = Instance.new("Frame", Main); Neon.Size = UDim2.new(1, 0, 0, 1); Neon.Position = UDim2.new(0, 0, 0, 65); Neon.BackgroundColor3 = MainColor; Neon.BorderSizePixel = 0
local NeonGlow = Instance.new("UIStroke", Neon); NeonGlow.Color = MainColor; NeonGlow.Thickness = 1.5

-- [[ 4. صفحة HOME (استعادة المحتوى المفقود) ]] --
local HomeFrame = Instance.new("Frame", Main); HomeFrame.Size = UDim2.new(1, 0, 1, -70); HomeFrame.Position = UDim2.new(0, 0, 0, 70); HomeFrame.BackgroundTransparency = 1

-- مربع الهوية (صورة اللاعب واسمه)
local ID = Instance.new("Frame", HomeFrame); ID.Size = UDim2.new(0, 215, 0, 210); ID.Position = UDim2.new(0, 25, 0, 15); ID.BackgroundColor3 = Color3.fromRGB(12, 12, 12)
Instance.new("UICorner", ID); Instance.new("UIStroke", ID).Color = Color3.fromRGB(100, 100, 100)

local Av = Instance.new("ImageLabel", ID) -- صورة اللاعب
Av.Size = UDim2.new(0, 65, 0, 65); Av.Position = UDim2.new(0.5, -32, 0, 20)
Av.Image = "rbxthumb://type=AvatarHeadShot&id="..LP.UserId.."&w=150&h=150"
Av.ZIndex = 5; Instance.new("UICorner", Av).CornerRadius = UDim.new(0, 8)

local DN = Instance.new("TextLabel", ID) -- اسم اللاعب
DN.Text = LP.DisplayName; DN.Position = UDim2.new(0, 0, 0, 95); DN.Size = UDim2.new(1, 0, 0, 20)
DN.TextColor3 = Color3.new(1, 1, 1); DN.Font = "GothamBold"; DN.TextSize = 13; DN.BackgroundTransparency = 1

local RT = Instance.new("TextLabel", ID); RT.Text = "OWNER"; RT.Size = UDim2.new(0, 60, 0, 18); RT.Position = UDim2.new(0.5, -30, 0, 120); RT.TextColor3 = MainColor; RT.Font = "GothamBold"; RT.TextSize = 10; RT.BackgroundTransparency = 1

-- [[ 5. الأزرار ومستطيل الإعلانات ]] --
local function CreateBtn(txt, x, y, w, h)
    local b = Instance.new("TextButton", HomeFrame); b.Text = txt; b.Size = UDim2.new(0, w, 0, h); b.Position = UDim2.new(0, x, 0, y)
    b.BackgroundColor3 = Color3.fromRGB(15, 15, 15); b.TextColor3 = Color3.new(1, 1, 1); b.Font = "GothamBold"; b.TextSize = 10
    Instance.new("UICorner", b); Instance.new("UIStroke", b).Color = Color3.fromRGB(120, 120, 120)
    return b
end

CreateBtn("CONFIG", 25, 235, 100, 45) -- زر الـ Config
CreateBtn("SETTINGS", 135, 235, 105, 45) -- زر الإعدادات
CreateBtn("ADVERTISEMENT (إعلان)", 255, 235, 280, 45) -- مستطيل الإعلانات

-- المربع اليمين الفارغ
local PicBox = Instance.new("Frame", HomeFrame); PicBox.Size = UDim2.new(1, -285, 0, 210); PicBox.Position = UDim2.new(0, 255, 0, 15); PicBox.BackgroundColor3 = Color3.fromRGB(12, 12, 12)
Instance.new("UICorner", PicBox); Instance.new("UIStroke", PicBox).Color = Color3.fromRGB(100, 100, 100)

-- [[ التحكم بالفتح والإغلاق ]] --
local function Toggle(s)
    if s then Main.Visible = true; ToggleBtn.Visible = false
    else Main.Visible = false; ToggleBtn.Visible = true end
end

ToggleBtn.MouseButton1Click:Connect(function() Toggle(true) end)
local Close = Instance.new("TextButton", Header); Close.Text = "X"; Close.Size = UDim2.new(0, 30, 0, 30); Close.Position = UDim2.new(1, -40, 0, 17); Close.BackgroundTransparency = 1; Close.TextColor3 = MainColor; Close.Font = "GothamBold"; Close.MouseButton1Click:Connect(function() Toggle(false) end)
