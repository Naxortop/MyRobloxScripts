-- [[ NAXOR V23.0 - USERNAME + RANK + FULL RECOVERY ]] --

local Players = game:GetService("Players")
local LP = Players.LocalPlayer
local PlayerGui = LP:WaitForChild("PlayerGui")
local UIS = game:GetService("UserInputService")
local TS = game:GetService("TweenService")

-- [ تنظيف ] --
if PlayerGui:FindFirstChild("Naxor_Official_V5") then PlayerGui.Naxor_Official_V5:Destroy() end

local Screen = Instance.new("ScreenGui", PlayerGui)
Screen.Name = "Naxor_Official_V5"; Screen.ResetOnSpawn = false

local Theme = {
    Main = Color3.fromRGB(8, 8, 8),
    Accent = Color3.fromRGB(220, 220, 220),
    NeonSharp = Color3.fromRGB(55, 55, 55),
    Text = Color3.fromRGB(255, 255, 255),
    DarkText = Color3.fromRGB(150, 150, 150),
    Green = Color3.fromRGB(0, 255, 100)
}

-- [[ أدوات المساعدة ]] --
local Utils = {}
function Utils:ApplyNeon(obj, color, thickness)
    local s = Instance.new("UIStroke", obj); s.Color = color or Theme.NeonSharp; s.Thickness = thickness or 1.2; s.ApplyStrokeMode = Enum.ApplyStrokeMode.Border; return s
end
function Utils:MakeDraggable(Frame, Handle)
    local Dragging, DragInput, DragStart, StartPos
    Handle.InputBegan:Connect(function(input)
        if (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) then Dragging = true; DragStart = input.Position; StartPos = Frame.Position end
    end)
    UIS.InputChanged:Connect(function(input)
        if Dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
            local Delta = input.Position - DragStart
            Frame.Position = UDim2.new(StartPos.X.Scale, StartPos.X.Offset + Delta.X, StartPos.Y.Scale, StartPos.Y.Offset + Delta.Y)
        end
    end)
    UIS.InputEnded:Connect(function(input) if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then Dragging = false end end)
end

-- [[ 1. الزر العائم ]] --
local ToggleBtn = Instance.new("ImageButton", Screen)
ToggleBtn.Name = "NaxorToggle"; ToggleBtn.Size = UDim2.new(0, 60, 0, 60); ToggleBtn.Position = UDim2.new(0.5, -30, 0, 15); ToggleBtn.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
ToggleBtn.Image = "rbxassetid://138676646535560"; ToggleBtn.Visible = false; Instance.new("UICorner", ToggleBtn).CornerRadius = UDim.new(1, 0)
Utils:ApplyNeon(ToggleBtn, Theme.Accent); Utils:MakeDraggable(ToggleBtn, ToggleBtn)

-- 2. الإطار الرئيسي
local Main = Instance.new("Frame", Screen)
Main.Size = UDim2.new(0, 560, 0, 390); Main.Position = UDim2.new(0.5, -280, 0.5, -195); Main.BackgroundColor3 = Theme.Main
Instance.new("UICorner", Main).CornerRadius = UDim.new(0, 12); Utils:ApplyNeon(Main, Theme.Accent, 1.8)

local function ToggleUI() Main.Visible = not Main.Visible; ToggleBtn.Visible = not Main.Visible end
ToggleBtn.MouseButton1Click:Connect(ToggleUI)

-- 3. الهيدر والنافيجيشن
local Header = Instance.new("Frame", Main); Header.Size = UDim2.new(1, 0, 0, 65); Header.BackgroundTransparency = 1; Header.ZIndex = 100; Utils:MakeDraggable(Main, Header)
local Logo = Instance.new("TextLabel", Header); Logo.RichText = true; Logo.Text = "N.X.R <font color='#DCDCDC'>>>> </font>"; Logo.Size = UDim2.new(0, 150, 1, 0); Logo.Position = UDim2.new(0, 25, 0, 0); Logo.BackgroundTransparency = 1; Logo.TextColor3 = Theme.Accent; Logo.TextSize = 22; Logo.Font = "GothamBold"; Logo.TextXAlignment = "Left"
local CloseBtn = Instance.new("TextButton", Header); CloseBtn.Size = UDim2.new(0, 30, 0, 30); CloseBtn.Position = UDim2.new(1, -45, 0, 17); CloseBtn.BackgroundTransparency = 1; CloseBtn.Text = "X"; CloseBtn.TextColor3 = Theme.Accent; CloseBtn.TextSize = 20; CloseBtn.Font = "GothamBold"; CloseBtn.ZIndex = 110; CloseBtn.MouseButton1Click:Connect(ToggleUI)

-- [ نظام الصفحات ] --
local PagesCont = Instance.new("Frame", Main); PagesCont.Size = UDim2.new(1, 0, 1, -65); PagesCont.Position = UDim2.new(0, 0, 0, 65); PagesCont.BackgroundTransparency = 1
local P = { Home = Instance.new("Frame", PagesCont), Scripts = Instance.new("Frame", PagesCont), Credits = Instance.new("Frame", PagesCont) }
for n, f in pairs(P) do f.Size = UDim2.new(1, 0, 1, 0); f.BackgroundTransparency = 1; f.Visible = (n == "Home") end

local Nav = Instance.new("Frame", Header); Nav.Size = UDim2.new(0, 250, 1, 0); Nav.Position = UDim2.new(1, -310, 0, 0); Nav.BackgroundTransparency = 1
local Underline = Instance.new("Frame", Nav); Underline.Size = UDim2.new(0, 35, 0, 2); Underline.Position = UDim2.new(0, 15, 0, 48); Underline.BackgroundColor3 = Theme.Accent; Underline.ZIndex = 101
local function AddTab(name, x, target)
    local btn = Instance.new("TextButton", Nav); btn.Size = UDim2.new(0, 75, 1, 0); btn.Position = UDim2.new(0, x, 0, 0); btn.BackgroundTransparency = 1; btn.Text = name; btn.TextColor3 = Theme.DarkText; btn.Font = "GothamMedium"; btn.TextSize = 13; btn.ZIndex = 105
    btn.MouseButton1Click:Connect(function()
        TS:Create(Underline, TweenInfo.new(0.3), {Position = UDim2.new(0, x + 18, 0, 48)}):Play()
        for n, f in pairs(P) do f.Visible = (n == target) end
        for _, v in pairs(Nav:GetChildren()) do if v:IsA("TextButton") then v.TextColor3 = Theme.DarkText end end
        btn.TextColor3 = Theme.Text
    end)
end
AddTab("HOME", 0, "Home"); AddTab("PAGES", 80, "Scripts"); AddTab("CREDITS", 160, "Credits")

-- [[ محتوى HOME ]] --
local IDCard = Instance.new("Frame", P.Home); IDCard.Size = UDim2.new(0, 220, 0, 220); IDCard.Position = UDim2.new(0, 25, 0, 20); IDCard.BackgroundColor3 = Color3.fromRGB(12, 12, 12)
Instance.new("UICorner", IDCard).CornerRadius = UDim.new(0, 10); Utils:ApplyNeon(IDCard)

-- صورة اللاعب
local pImg = Instance.new("ImageLabel", IDCard); pImg.Size = UDim2.new(0, 65, 0, 65); pImg.Position = UDim2.new(0, 15, 0, 15); pImg.Image = "rbxthumb://type=AvatarHeadShot&id="..LP.UserId.."&w=150&h=150"; pImg.BackgroundTransparency = 1; Instance.new("UICorner", pImg).CornerRadius = UDim.new(0, 8)

-- اسم العرض (Display Name)
local DName = Instance.new("TextLabel", IDCard); DName.Text = LP.DisplayName; DName.Position = UDim2.new(0, 90, 0, 18); DName.Size = UDim2.new(0, 120, 0, 20); DName.TextColor3 = Theme.Text; DName.Font = "GothamBold"; DName.TextSize = 14; DName.BackgroundTransparency = 1; DName.TextXAlignment = "Left"

-- [ الجديد: يوزر اللاعب @Username ] --
local UName = Instance.new("TextLabel", IDCard); UName.Text = "@"..LP.Name; UName.Position = UDim2.new(0, 90, 0, 33); UName.Size = UDim2.new(0, 120, 0, 15); UName.TextColor3 = Theme.DarkText; UName.Font = "GothamMedium"; UName.TextSize = 10; UName.BackgroundTransparency = 1; UName.TextXAlignment = "Left"

-- الرتبة (OWNER) - تحت اليوزر
local Rank = Instance.new("Frame", IDCard); Rank.Size = UDim2.new(0, 65, 0, 16); Rank.Position = UDim2.new(0, 90, 0, 52); Rank.BackgroundColor3 = Color3.fromRGB(20, 20, 20); Instance.new("UICorner", Rank).CornerRadius = UDim.new(0, 4); Utils:ApplyNeon(Rank, Theme.Accent)
local RT = Instance.new("TextLabel", Rank); RT.Size = UDim2.new(1, 0, 1, 0); RT.Text = "OWNER"; RT.TextColor3 = Theme.Accent; RT.Font = "GothamBold"; RT.TextSize = 8; RT.BackgroundTransparency = 1

-- معلومات إضافية والوقت
local function AddInfo(t, y, isPlaytime)
    local l = Instance.new("TextLabel", IDCard); l.Text = t; l.Size = UDim2.new(1, -30, 0, 20); l.Position = UDim2.new(0, 15, 0, y); l.BackgroundTransparency = 1; l.TextColor3 = Theme.DarkText; l.TextSize = 9; l.Font = "GothamMedium"; l.TextXAlignment = "Left"
    if isPlaytime then l.TextColor3 = Theme.Accent; l.Font = "GothamBold" end; return l
end
AddInfo("Device: " .. (UIS.TouchEnabled and "Mobile" or "PC"), 85); AddInfo("Account Age: "..LP.AccountAge.." Days", 100)
local PlayTimeLabel = AddInfo("PlayTime: 00:00:00", 125, true)

-- عداد اليوزر Active Users
local UserBox = Instance.new("Frame", IDCard); UserBox.Size = UDim2.new(0, 130, 0, 25); UserBox.Position = UDim2.new(0, 15, 1, -40); UserBox.BackgroundTransparency = 1
local Dot = Instance.new("Frame", UserBox); Dot.Size = UDim2.new(0, 8, 0, 8); Dot.Position = UDim2.new(0, 0, 0.5, -4); Dot.BackgroundColor3 = Theme.Green; Instance.new("UICorner", Dot).CornerRadius = UDim.new(1, 0); Utils:ApplyNeon(Dot, Theme.Green)
local ULabel = Instance.new("TextLabel", UserBox); ULabel.Size = UDim2.new(1, -15, 1, 0); ULabel.Position = UDim2.new(0, 15, 0, 0); ULabel.BackgroundTransparency = 1; ULabel.TextColor3 = Theme.Green; ULabel.Font = "GothamBold"; ULabel.TextSize = 10; ULabel.TextXAlignment = "Left"; ULabel.Text = "Active Users: 1,402"

-- مربع الإعلان BigBox
local BigBox = Instance.new("Frame", P.Home); BigBox.Size = UDim2.new(1, -285, 0, 220); BigBox.Position = UDim2.new(0, 260, 0, 20); BigBox.BackgroundColor3 = Color3.fromRGB(12, 12, 12); Instance.new("UICorner", BigBox).CornerRadius = UDim.new(0, 10); Utils:ApplyNeon(BigBox)

-- تحديثات
local baseU = 1402; local StartT = os.time()
task.spawn(function()
    while task.wait(1) do
        if not Screen.Parent then break end
        local elapsed = os.time() - StartT
        PlayTimeLabel.Text = string.format("PlayTime: %02d:%02d:%02d", math.floor(elapsed/3600), math.floor((elapsed%3600)/60), elapsed%60)
        if elapsed % 5 == 0 then baseU = baseU + math.random(-2, 4); ULabel.Text = "Active Users: " .. baseU end
    end
end)

-- الأزرار والخط
local function CreateActionBtn(name, pos, size)
    local btn = Instance.new("TextButton", P.Home); btn.Size = size; btn.Position = pos; btn.BackgroundColor3 = Color3.fromRGB(15, 15, 15); btn.Text = name; btn.TextColor3 = Theme.Text; btn.Font = "GothamBold"; btn.TextSize = 11; Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 8); Utils:ApplyNeon(btn); return btn
end
CreateActionBtn("CONFIG SYSTEM", UDim2.new(0, 25, 0, 255), UDim2.new(0, 105, 0, 50))
CreateActionBtn("UI SETTINGS", UDim2.new(0, 140, 0, 255), UDim2.new(0, 105, 0, 50))
CreateActionBtn("NEWS & ANNOUNCEMENTS", UDim2.new(0, 260, 0, 255), UDim2.new(1, -285, 0, 50))
local Line = Instance.new("Frame", Main); Line.Size = UDim2.new(1, 0, 0, 1); Line.Position = UDim2.new(0, 0, 0, 65); Line.BackgroundColor3 = Color3.fromRGB(40, 40, 40); Line.BorderSizePixel = 0; Line.ZIndex = 5
