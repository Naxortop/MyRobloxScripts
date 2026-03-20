-- [[ NAXOR V4 - FINAL INTEGRATED MASTERPIECE ]] --

local Players = game:GetService("Players")
local LP = Players.LocalPlayer
local PlayerGui = LP:WaitForChild("PlayerGui")
local UIS = game:GetService("UserInputService")
local TS = game:GetService("TweenService")

-- تنظيف النسخ القديمة
if PlayerGui:FindFirstChild("Naxor_Official_V4") then
    PlayerGui:FindFirstChild("Naxor_Official_V4"):Destroy()
end

local MainColor = Color3.fromRGB(255, 0, 50)

-- [1] الشاشة الرئيسية والزر العائم
local Screen = Instance.new("ScreenGui", PlayerGui)
Screen.Name = "Naxor_Official_V4"; Screen.IgnoreGuiInset = true

local ToggleBtn = Instance.new("ImageButton", Screen)
ToggleBtn.Size = UDim2.new(0, 50, 0, 50); ToggleBtn.Position = UDim2.new(0, 50, 0, 50)
ToggleBtn.BackgroundColor3 = Color3.fromRGB(15, 15, 15); ToggleBtn.Image = "rbxassetid://6031094067"
ToggleBtn.Visible = false; Instance.new("UICorner", ToggleBtn).CornerRadius = UDim.new(1, 0)
local ToggleStroke = Instance.new("UIStroke", ToggleBtn); ToggleStroke.Thickness = 2; ToggleStroke.Color = MainColor

-- برمجة سحب الزر العائم
local tDragging, tDragStart, tStartPos
ToggleBtn.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        tDragging = true; tDragStart = input.Position; tStartPos = ToggleBtn.Position
        input.Changed:Connect(function() if input.UserInputState == Enum.UserInputState.End then tDragging = false end end)
    end
end)
UIS.InputChanged:Connect(function(input)
    if tDragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
        local delta = input.Position - tDragStart
        ToggleBtn.Position = UDim2.new(tStartPos.X.Scale, tStartPos.X.Offset + delta.X, tStartPos.Y.Scale, tStartPos.Y.Offset + delta.Y)
    end
end)

-- [2] الإطار الرئيسي
local Main = Instance.new("Frame", Screen)
Main.Size = UDim2.new(0, 560, 0, 390); Main.Position = UDim2.new(0.5, -280, 0.5, -195)
Main.BackgroundColor3 = Color3.fromRGB(15, 15, 15); Instance.new("UICorner", Main).CornerRadius = UDim.new(0, 20)
local MainStroke = Instance.new("UIStroke", Main); MainStroke.Thickness = 3; MainStroke.Color = MainColor

local function ToggleUI() Main.Visible = not Main.Visible; ToggleBtn.Visible = not Main.Visible end
ToggleBtn.MouseButton1Click:Connect(ToggleUI)

-- [3] الهيدر (الاسم يسار والقائمة يمين)
local Header = Instance.new("Frame", Main)
Header.Size = UDim2.new(1, 0, 0, 65); Header.BackgroundTransparency = 1; Header.ZIndex = 10

-- الاسم (N.X.R) في أقصى اليسار
local Logo = Instance.new("TextLabel", Header)
Logo.RichText = true; Logo.Text = "N.X.R <font color='#FF0032'>>>> </font>"
Logo.Size = UDim2.new(0, 150, 1, 0); Logo.Position = UDim2.new(0, 25, 0, 0)
Logo.BackgroundTransparency = 1; Logo.TextColor3 = Color3.new(1, 1, 1); Logo.TextSize = 22; Logo.Font = "GothamBold"
Logo.TextXAlignment = "Left"

-- زر الإغلاق في أقصى اليمين
local CloseBtn = Instance.new("TextButton", Header)
CloseBtn.Size = UDim2.new(0, 30, 0, 30); CloseBtn.Position = UDim2.new(1, -45, 0, 15)
CloseBtn.BackgroundTransparency = 1; CloseBtn.Text = "X"; CloseBtn.TextColor3 = MainColor; CloseBtn.TextSize = 20; CloseBtn.Font = "GothamBold"; CloseBtn.MouseButton1Click:Connect(ToggleUI)

-- أزرار التنقل (Nav) في جهة اليمين قبل زر الإغلاق
local Nav = Instance.new("Frame", Header)
Nav.Size = UDim2.new(0, 250, 1, 0); Nav.Position = UDim2.new(1, -310, 0, 0)
Nav.BackgroundTransparency = 1

local Underline = Instance.new("Frame", Nav)
Underline.Size = UDim2.new(0, 40, 0, 2); Underline.Position = UDim2.new(0, 15, 0, 45); Underline.BackgroundColor3 = MainColor
local LineStroke = Instance.new("UIStroke", Underline); LineStroke.Color = MainColor

-- إدارة الصفحات
local Pages = { Home = Instance.new("Frame", Main), Scripts = Instance.new("Frame", Main), Credits = Instance.new("Frame", Main) }
for name, frame in pairs(Pages) do
    frame.Size = UDim2.new(1, 0, 1, 0); frame.BackgroundTransparency = 1; frame.Visible = (name == "Home")
end

local function SwitchTab(btnName, xPos)
    TS:Create(Underline, TweenInfo.new(0.3), {Position = UDim2.new(0, xPos + 15, 0, 45)}):Play()
    for name, frame in pairs(Pages) do frame.Visible = (name == btnName) end
end

local function CreateNavBtn(name, x, target)
    local b = Instance.new("TextButton", Nav); b.Size = UDim2.new(0, 70, 1, 0); b.Position = UDim2.new(0, x, 0, 0); b.BackgroundTransparency = 1; b.Text = name; b.TextColor3 = Color3.new(1, 1, 1); b.Font = "GothamMedium"; b.TextSize = 13
    b.MouseButton1Click:Connect(function() SwitchTab(target, x) end)
end
CreateNavBtn("Home", 0, "Home"); CreateNavBtn("Pages", 75, "Scripts"); CreateNavBtn("Credits", 150, "Credits")

-- سحب المنيو الرئيسي
local mDragging, mDragStart, mStartPos
Header.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        mDragging = true; mDragStart = input.Position; mStartPos = Main.Position
        input.Changed:Connect(function() if input.UserInputState == Enum.UserInputState.End then mDragging = false end end)
    end
end)
UIS.InputChanged:Connect(function(input)
    if mDragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
        local delta = input.Position - mDragStart
        Main.Position = UDim2.new(mStartPos.X.Scale, mStartPos.X.Offset + delta.X, mStartPos.Y.Scale, mStartPos.Y.Offset + delta.Y)
    end
end)

-- [4] محتوى صفحة HOME
local IDCard = Instance.new("Frame", Pages.Home); IDCard.Size = UDim2.new(0, 195, 0, 220); IDCard.Position = UDim2.new(0, 25, 0, 80); IDCard.BackgroundColor3 = Color3.fromRGB(12, 12, 12); Instance.new("UICorner", IDCard).CornerRadius = UDim.new(0, 15)
local IDStroke = Instance.new("UIStroke", IDCard); IDStroke.Thickness = 2; IDStroke.Color = MainColor
local pImg = Instance.new("ImageLabel", IDCard); pImg.Size = UDim2.new(0, 70, 0, 70); pImg.Position = UDim2.new(0, 15, 0, 15); pImg.Image = "rbxthumb://type=AvatarHeadShot&id="..LP.UserId.."&w=150&h=150"; Instance.new("UICorner", pImg).CornerRadius = UDim.new(0, 12)

local function AddInfo(txt, y, col)
    local l = Instance.new("TextLabel", IDCard); l.Text = txt; l.Position = UDim2.new(0, 15, 0, y); l.Size = UDim2.new(1, -30, 0, 20); l.BackgroundTransparency = 1; l.TextColor3 = col or Color3.new(1, 1, 1); l.TextSize = 9; l.Font = "GothamMedium"; l.TextXAlignment = "Left"
end
AddInfo("IDENTIFICATION:", 95, Color3.fromRGB(120, 120, 120)); AddInfo("NAME: "..LP.Name:upper(), 115); AddInfo("STATUS: ONLINE", 135, Color3.fromRGB(0, 255, 130))
local PlayTimeLabel = Instance.new("TextLabel", IDCard); PlayTimeLabel.Text = "PlayTime: 00:00:00"; PlayTimeLabel.Position = UDim2.new(0, 15, 0, 155); PlayTimeLabel.Size = UDim2.new(1, -30, 0, 20); PlayTimeLabel.BackgroundTransparency = 1; PlayTimeLabel.TextColor3 = Color3.fromRGB(255, 80, 80); PlayTimeLabel.TextSize = 9; PlayTimeLabel.Font = "GothamMedium"; PlayTimeLabel.TextXAlignment = "Left"
local accTxt = Instance.new("TextLabel", IDCard); accTxt.Text = "N.X.R HUB ACCESS"; accTxt.Position = UDim2.new(0, 15, 0, 185); accTxt.Size = UDim2.new(1, -30, 0, 20); accTxt.BackgroundTransparency = 1; accTxt.TextColor3 = MainColor; accTxt.TextSize = 10; accTxt.Font = "GothamBold"; accTxt.TextXAlignment = "Left"

local PicBox = Instance.new("Frame", Pages.Home); PicBox.Size = UDim2.new(1, -270, 0, 220); PicBox.Position = UDim2.new(0, 245, 0, 80); PicBox.BackgroundColor3 = Color3.fromRGB(12, 12, 12); Instance.new("UICorner", PicBox).CornerRadius = UDim.new(0, 15)
local PicStroke = Instance.new("UIStroke", PicBox); PicStroke.Thickness = 2; PicStroke.Color = MainColor
local PicLabel = Instance.new("TextLabel", PicBox); PicLabel.Text = "PIC"; PicLabel.Size = UDim2.new(1, 0, 1, 0); PicLabel.BackgroundTransparency = 1; PicLabel.TextColor3 = Color3.fromRGB(30, 30, 30); PicLabel.TextSize = 60; PicLabel.Font = "GothamBold"

-- الأزرار السفلية (تابعة للهوم)
local function CreateBtm(name, x)
    local b = Instance.new("TextButton", Pages.Home); b.Size = UDim2.new(0, 110, 0, 45); b.Position = UDim2.new(0, x + 25, 1, -70); b.BackgroundColor3 = Color3.fromRGB(12, 12, 12); b.Text = name; b.TextColor3 = Color3.new(1, 1, 1); b.Font = "GothamBold"; b.TextSize = 11
    Instance.new("UICorner", b).CornerRadius = UDim.new(0, 10); local s = Instance.new("UIStroke", b); s.Thickness = 2.5; s.Color = MainColor; s.ApplyStrokeMode = "Border"
end
CreateBtm("CONFIG", 60); CreateBtm("SETTING", 225); CreateBtm("AD (إعلان)", 390)

-- [5] نظام PlayTime
local StartTime = os.time()
task.spawn(function()
    while task.wait(1) do
        local Elapsed = os.time() - StartTime
        local H = math.floor(Elapsed / 3600); local M = math.floor((Elapsed % 3600) / 60); local S = Elapsed % 60
        PlayTimeLabel.Text = string.format("PlayTime: %02d:%02d:%02d", H, M, S)
    end
end)

print("Naxor V4: Final Master Merged.")
