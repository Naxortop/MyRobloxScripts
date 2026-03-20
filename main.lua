-- [[ NAXOR V8.0 - THE DEFINITIVE MERGED VERSION ]] --

local Players = game:GetService("Players")
local LP = Players.LocalPlayer
local PlayerGui = LP:WaitForChild("PlayerGui")
local UIS = game:GetService("UserInputService")
local TS = game:GetService("TweenService")

-- تنظيف النسخ القديمة
if PlayerGui:FindFirstChild("Naxor_Official_V5") then 
    PlayerGui:FindFirstChild("Naxor_Official_V5"):Destroy() 
end

local MainColor = Color3.fromRGB(220, 220, 220)
local Screen = Instance.new("ScreenGui", PlayerGui)
Screen.Name = "Naxor_Official_V5"; Screen.ResetOnSpawn = false

-- [ وظيفة السحب المصلحة لمنع تحرك الكاميرا ] --
local function MakeDraggable(Frame, Handle)
    local Dragging, DragInput, DragStart, StartPos
    Handle.InputBegan:Connect(function(input)
        if (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) then
            Dragging = true; DragStart = input.Position; StartPos = Frame.Position
        end
    end)
    UIS.InputChanged:Connect(function(input)
        if Dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
            local Delta = input.Position - DragStart
            Frame.Position = UDim2.new(StartPos.X.Scale, StartPos.X.Offset + Delta.X, StartPos.Y.Scale, StartPos.Y.Offset + Delta.Y)
        end
    end)
    UIS.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            Dragging = false
        end
    end)
end

-- [ الإطار الرئيسي ] --
local Main = Instance.new("Frame", Screen)
Main.Size = UDim2.new(0, 560, 0, 390); Main.Position = UDim2.new(0.5, -280, 0.5, -195)
Main.BackgroundColor3 = Color3.fromRGB(8, 8, 8); Instance.new("UICorner", Main).CornerRadius = UDim.new(0, 15)
local MainStroke = Instance.new("UIStroke", Main); MainStroke.Thickness = 2; MainStroke.Color = MainColor
Main.Active = true -- منع مرور اللمس للكاميرا

-- [ الهيدر ] --
local Header = Instance.new("Frame", Main); Header.Size = UDim2.new(1, 0, 0, 65); Header.BackgroundTransparency = 1; Header.ZIndex = 10
MakeDraggable(Main, Header)

local Logo = Instance.new("TextLabel", Header); Logo.RichText = true; Logo.Text = "N.X.R <font color='#DCDCDC'>>>> </font>"; Logo.Size = UDim2.new(0, 150, 1, 0); Logo.Position = UDim2.new(0, 25, 0, 0); Logo.BackgroundTransparency = 1; Logo.TextColor3 = MainColor; Logo.TextSize = 20; Logo.Font = "GothamBold"; Logo.TextXAlignment = "Left"

-- [ نظام الصفحات ] --
local PagesCont = Instance.new("Frame", Main); PagesCont.Size = UDim2.new(1, 0, 1, -65); PagesCont.Position = UDim2.new(0, 0, 0, 65); PagesCont.BackgroundTransparency = 1
local P = { Home = Instance.new("Frame", PagesCont), Pages = Instance.new("Frame", PagesCont), Credits = Instance.new("Frame", PagesCont) }
for name, frame in pairs(P) do frame.Size = UDim2.new(1, 0, 1, 0); frame.BackgroundTransparency = 1; frame.Visible = (name == "Home") end

-- [[ محتوى صفحة HOME ]] --

-- 1. مربع الهوية (اليسار)
local IDCard = Instance.new("Frame", P.Home); IDCard.Size = UDim2.new(0, 210, 0, 210); IDCard.Position = UDim2.new(0, 25, 0, 25); IDCard.BackgroundColor3 = Color3.fromRGB(12, 12, 12); Instance.new("UICorner", IDCard).CornerRadius = UDim.new(0, 10); local IDS = Instance.new("UIStroke", IDCard); IDS.Color = MainColor; IDS.Thickness = 1.8

-- 2. مربع الصورة (GUTS - اليمين)
local PicBox = Instance.new("Frame", P.Home); PicBox.Size = UDim2.new(1, -275, 0, 210); PicBox.Position = UDim2.new(0, 250, 0, 25); PicBox.BackgroundColor3 = Color3.fromRGB(12, 12, 12); Instance.new("UICorner", PicBox).CornerRadius = UDim.new(0, 10); local PIS = Instance.new("UIStroke", PicBox); PIS.Color = MainColor; PIS.Thickness = 1.8
PicBox.ClipsDescendants = true

local GutsImage = Instance.new("ImageLabel", PicBox)
GutsImage.Size = UDim2.new(1, 0, 1, 0); GutsImage.BackgroundTransparency = 1
GutsImage.Image = "rbxassetid://18443200213" -- معرف صورة Guts فخم ومجرب
GutsImage.ScaleType = Enum.ScaleType.Crop; GutsImage.ZIndex = 2

-- 3. الأزرار السفلية (مع المسافة المطلوبة)
local function CreateStyledBtn(name, pos, size, parent)
    local btn = Instance.new("TextButton", parent)
    btn.Size = size; btn.Position = pos; btn.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
    btn.Text = name; btn.TextColor3 = Color3.fromRGB(255, 255, 255); btn.Font = "GothamBold"; btn.TextSize = 11; btn.ZIndex = 10
    Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 8)
    local s = Instance.new("UIStroke", btn); s.Color = MainColor; s.Thickness = 1.2; s.ApplyStrokeMode = "Border"
    return btn
end

CreateStyledBtn("CONFIG", UDim2.new(0, 25, 0, 255), UDim2.new(0, 100, 0, 45), P.Home)
CreateStyledBtn("SETTING", UDim2.new(0, 135, 0, 255), UDim2.new(0, 100, 0, 45), P.Home)
CreateStyledBtn("ADVERTISEMENT (إعلان)", UDim2.new(0, 250, 0, 255), UDim2.new(1, -275, 0, 45), P.Home)

-- [ بيانات المستخدم ] --
local pImg = Instance.new("ImageLabel", IDCard); pImg.Size = UDim2.new(0, 60, 0, 60); pImg.Position = UDim2.new(0, 15, 0, 15); pImg.Image = "rbxthumb://type=AvatarHeadShot&id="..LP.UserId.."&w=150&h=150"; Instance.new("UICorner", pImg).CornerRadius = UDim.new(0, 8)
local DName = Instance.new("TextLabel", IDCard); DName.Text = LP.DisplayName; DName.Size = UDim2.new(0, 110, 0, 20); DName.Position = UDim2.new(0, 85, 0, 20); DName.BackgroundTransparency = 1; DName.TextColor3 = Color3.new(1, 1, 1); DName.TextSize = 12; DName.Font = "GothamBold"; DName.TextXAlignment = "Left"
local PlayTimeLabel = Instance.new("TextLabel", IDCard); PlayTimeLabel.Text = "PlayTime: 00:00:00"; PlayTimeLabel.Position = UDim2.new(0, 15, 0, 150); PlayTimeLabel.Size = UDim2.new(1, -30, 0, 20); PlayTimeLabel.BackgroundTransparency = 1; PlayTimeLabel.TextColor3 = MainColor; PlayTimeLabel.TextSize = 10; PlayTimeLabel.Font = "GothamBold"; PlayTimeLabel.TextXAlignment = "Left"
