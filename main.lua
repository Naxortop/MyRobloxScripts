-- [[ NAXOR V11.1 - FIXED & TESTED ]] --

local Players = game:GetService("Players")
local LP = Players.LocalPlayer
local PlayerGui = LP:WaitForChild("PlayerGui")
local UIS = game:GetService("UserInputService")
local TS = game:GetService("TweenService")

-- تنظيف النسخة القديمة تماماً
if PlayerGui:FindFirstChild("Naxor_Official_V5") then 
    PlayerGui.Naxor_Official_V5:Destroy() 
end

local MainColor = Color3.fromRGB(220, 220, 220)
local Screen = Instance.new("ScreenGui", PlayerGui)
Screen.Name = "Naxor_Official_V5"; Screen.ResetOnSpawn = false

-- [ وظيفة السحب ] --
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
    UIS.InputEnded:Connect(function(input) if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then Dragging = false end end)
end

-- [ الزر العائم ] --
local ToggleBtn = Instance.new("ImageButton", Screen)
ToggleBtn.Size = UDim2.new(0, 50, 0, 50); ToggleBtn.Position = UDim2.new(0, 20, 0.5, -25)
ToggleBtn.BackgroundColor3 = Color3.fromRGB(10, 10, 10); ToggleBtn.Image = "rbxassetid://18443200213"
ToggleBtn.Visible = false; Instance.new("UICorner", ToggleBtn).CornerRadius = UDim.new(1, 0)
local TStroke = Instance.new("UIStroke", ToggleBtn); TStroke.Color = MainColor; TStroke.Thickness = 1.5
MakeDraggable(ToggleBtn, ToggleBtn)

-- [ الإطار الرئيسي ] --
local Main = Instance.new("Frame", Screen)
Main.Size = UDim2.new(0, 560, 0, 390); Main.Position = UDim2.new(0.5, -280, 0.5, -195)
Main.BackgroundColor3 = Color3.fromRGB(8, 8, 8); Main.Active = true; Main.ClipsDescendants = true
Instance.new("UICorner", Main).CornerRadius = UDim.new(0, 15)
local MStroke = Instance.new("UIStroke", Main); MStroke.Color = MainColor; MStroke.Thickness = 2

local function ToggleUI()
    Main.Visible = not Main.Visible
    ToggleBtn.Visible = not Main.Visible
end
ToggleBtn.MouseButton1Click:Connect(ToggleUI)

-- [ الهيدر ] --
local Header = Instance.new("Frame", Main); Header.Size = UDim2.new(1, 0, 0, 65); Header.BackgroundTransparency = 1; Header.ZIndex = 10
MakeDraggable(Main, Header)
local Logo = Instance.new("TextLabel", Header); Logo.RichText = true; Logo.Text = "N.X.R <font color='#DCDCDC'>>>> </font>"; Logo.Size = UDim2.new(0, 150, 1, 0); Logo.Position = UDim2.new(0, 25, 0, 0); Logo.BackgroundTransparency = 1; Logo.TextColor3 = MainColor; Logo.TextSize = 20; Logo.Font = "GothamBold"; Logo.TextXAlignment = "Left"
local CloseBtn = Instance.new("TextButton", Header); CloseBtn.Size = UDim2.new(0, 30, 0, 30); CloseBtn.Position = UDim2.new(1, -40, 0, 17); CloseBtn.BackgroundTransparency = 1; CloseBtn.Text = "X"; CloseBtn.TextColor3 = MainColor; CloseBtn.TextSize = 18; CloseBtn.Font = "GothamBold"; CloseBtn.MouseButton1Click:Connect(ToggleUI)

-- [ النافيجيشن ] --
local Nav = Instance.new("Frame", Header); Nav.Size = UDim2.new(0, 250, 1, 0); Nav.Position = UDim2.new(1, -300, 0, 0); Nav.BackgroundTransparency = 1
local Underline = Instance.new("Frame", Nav); Underline.Size = UDim2.new(0, 35, 0, 1.5); Underline.Position = UDim2.new(0, 15, 0, 45); Underline.BackgroundColor3 = MainColor; Underline.ZIndex = 11

-- [ نظام الصفحات ] --
local PagesCont = Instance.new("Frame", Main); PagesCont.Size = UDim2.new(1, 0, 1, -65); PagesCont.Position = UDim2.new(0, 0, 0, 65); PagesCont.BackgroundTransparency = 1
local P = { Home = Instance.new("Frame", PagesCont), Pages = Instance.new("Frame", PagesCont), Credits = Instance.new("Frame", PagesCont) }
for name, frame in pairs(P) do frame.Size = UDim2.new(1, 0, 1, 0); frame.BackgroundTransparency = 1; frame.Visible = (name == "Home") end

local function CreateNavBtn(name, x, target)
    local b = Instance.new("TextButton", Nav); b.Size = UDim2.new(0, 70, 1, 0); b.Position = UDim2.new(0, x, 0, 0); b.BackgroundTransparency = 1; b.Text = name; b.TextColor3 = Color3.fromRGB(180, 180, 180); b.Font = "GothamMedium"; b.TextSize = 12
    b.MouseButton1Click:Connect(function()
        TS:Create(Underline, TweenInfo.new(0.25), {Position = UDim2.new(0, x + 15, 0, 45)}):Play()
        for n, f in pairs(P) do f.Visible = (n == target) end
        for _, v in pairs(Nav:GetChildren()) do if v:IsA("TextButton") then v.TextColor3 = Color3.fromRGB(180, 180, 180) end end
        b.TextColor3 = Color3.new(1, 1, 1)
    end)
end
CreateNavBtn("Home", 0, "Home"); CreateNavBtn("Pages", 75, "Pages"); CreateNavBtn("Credits", 150, "Credits")

-- [ الخط الفاصل ] --
local Separator = Instance.new("Frame", Main)
Separator.Size = UDim2.new(1, 0, 0, 1); Separator.Position = UDim2.new(0, 0, 0, 65); Separator.BackgroundColor3 = Color3.fromRGB(40, 40, 40); Separator.BorderSizePixel = 0; Separator.ZIndex = 12

-- [[ محتوى صفحة HOME - البطاقة ]] --
local IDCard = Instance.new("Frame", P.Home); IDCard.Size = UDim2.new(0, 210, 0, 210); IDCard.Position = UDim2.new(0, 25, 0, 25); IDCard.BackgroundColor3 = Color3.fromRGB(12, 12, 12); Instance.new("UICorner", IDCard).CornerRadius = UDim.new(0, 10)
local IDS = Instance.new("UIStroke", IDCard); IDS.Color = Color3.fromRGB(50, 50, 50); IDS.Thickness = 1.2

-- صورة اللاعب (تم التصحيح)
local pImg = Instance.new("ImageLabel", IDCard); pImg.Size = UDim2.new(0, 60, 0, 60); pImg.Position = UDim2.new(0, 15, 0, 15); pImg.Image = "rbxthumb://type=AvatarHeadShot&id="..LP.UserId.."&w=150&h=150"; pImg.BackgroundTransparency = 1; Instance.new("UICorner", pImg).CornerRadius = UDim.new(0, 8)

-- النقطة الخضراء
local Dot = Instance.new("Frame", IDCard); Dot.Size = UDim2.new(0, 7, 0, 7); Dot.Position = UDim2.new(0, 15, 0, 81); Dot.BackgroundColor3 = Color3.fromRGB(0, 255, 100); Instance.new("UICorner", Dot).CornerRadius = UDim.new(1, 0)
local StatusT = Instance.new("TextLabel", IDCard); StatusT.Text = "Active Status"; StatusT.Position = UDim2.new(0, 28, 0, 74); StatusT.Size = UDim2.new(0, 80, 0, 20); StatusT.TextColor3 = Color3.fromRGB(0, 255, 100); StatusT.TextSize = 8; StatusT.Font = "GothamBold"; StatusT.BackgroundTransparency = 1; StatusT.TextXAlignment = "Left"

-- الاسم والرتبة
local DName = Instance.new("TextLabel", IDCard); DName.Text = LP.DisplayName; DName.Position = UDim2.new(0, 85, 0, 18); DName.Size = UDim2.new(0, 110, 0, 20); DName.TextColor3 = Color3.new(1, 1, 1); DName.Font = "GothamBold"; DName.TextSize = 12; DName.BackgroundTransparency = 1; DName.TextXAlignment = "Left"
local RankTag = Instance.new("Frame", IDCard); RankTag.Size = UDim2.new(0, 60, 0, 16); RankTag.Position = UDim2.new(0, 85, 0, 42); RankTag.BackgroundColor3 = Color3.fromRGB(20, 20, 20); Instance.new("UICorner", RankTag).CornerRadius = UDim.new(0, 4); local RS = Instance.new("UIStroke", RankTag); RS.Color = MainColor; RS.Thickness = 1
local RT = Instance.new("TextLabel", RankTag); RT.Size = UDim2.new(1, 0, 1, 0); RT.Text = "OWNER"; RT.TextColor3 = MainColor; RT.TextSize = 8; RT.Font = "GothamBold"; RT.BackgroundTransparency = 1

-- معلومات إضافية
local function AddInfo(t, y, c)
    local l = Instance.new("TextLabel", IDCard); l.Text = t; l.Size = UDim2.new(1, -30, 0, 20); l.Position = UDim2.new(0, 15, 0, y); l.BackgroundTransparency = 1; l.TextColor3 = c or Color3.fromRGB(200, 200, 200); l.TextSize = 9; l.Font = "GothamMedium"; l.TextXAlignment = "Left"; return l
end
local Dev = (UIS.TouchEnabled and not UIS.KeyboardEnabled) and "Mobile" or "PC"
AddInfo("Device: "..Dev, 100); AddInfo("Account Age: "..LP.AccountAge.." Days", 118); AddInfo("User ID: "..LP.UserId, 136)

local UserCount = AddInfo("Users: 1,402", 162, Color3.fromRGB(150, 150, 150))
local PlayTimeLabel = AddInfo("PlayTime: 00:00:00", 182, MainColor); PlayTimeLabel.Font = "GothamBold"

-- [ الأزرار والوقت ] --
local function CreateStyledBtn(name, pos, size, parent)
    local btn = Instance.new("TextButton", parent); btn.Size = size; btn.Position = pos; btn.BackgroundColor3 = Color3.fromRGB(15, 15, 15); btn.Text = name; btn.TextColor3 = Color3.new(1, 1, 1); btn.Font = "GothamBold"; btn.TextSize = 11; Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 8); local s = Instance.new("UIStroke", btn); s.Color = Color3.fromRGB(40, 40, 40); s.Thickness = 1; return btn
end
CreateStyledBtn("CONFIG", UDim2.new(0, 25, 0, 255), UDim2.new(0, 100, 0, 45), P.Home); CreateStyledBtn("SETTING", UDim2.new(0, 135, 0, 255), UDim2.new(0, 100, 0, 45), P.Home); CreateStyledBtn("ADVERTISEMENT (إعلان)", UDim2.new(0, 250, 0, 255), UDim2.new(1, -275, 0, 45), P.Home)
local PicBox = Instance.new("Frame", P.Home); PicBox.Size = UDim2.new(1, -275, 0, 210); PicBox.Position = UDim2.new(0, 250, 0, 25); PicBox.BackgroundColor3 = Color3.fromRGB(12, 12, 12); Instance.new("UICorner", PicBox).CornerRadius = UDim.new(0, 10); local PS = Instance.new("UIStroke", PicBox); PS.Color = Color3.fromRGB(40, 40, 40); PS.Thickness = 1

local ST = os.time(); task.spawn(function
