-- [[ NAXOR V5.3 - FULLY INTEGRATED & STABLE ]] --

local Players = game:GetService("Players")
local LP = Players.LocalPlayer
local PlayerGui = LP:WaitForChild("PlayerGui")
local UIS = game:GetService("UserInputService")
local TS = game:GetService("TweenService")

-- تنظيف النسخ السابقة
if PlayerGui:FindFirstChild("Naxor_Official_V5") then
    PlayerGui:FindFirstChild("Naxor_Official_V5"):Destroy()
end

local MainColor = Color3.fromRGB(220, 220, 220)

-- [1] الشاشة الرئيسية
local Screen = Instance.new("ScreenGui", PlayerGui)
Screen.Name = "Naxor_Official_V5"
Screen.ResetOnSpawn = false

-- [ وظيفة السحب ] --
local function SimpleDrag(Frame, Handle)
    local Dragging, DragInput, DragStart, StartPos
    Handle.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            Dragging = true; DragStart = input.Position; StartPos = Frame.Position
            input.Changed:Connect(function() if input.UserInputState == Enum.UserInputState.End then Dragging = false end end)
        end
    end)
    UIS.InputChanged:Connect(function(input)
        if Dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
            local Delta = input.Position - DragStart
            Frame.Position = UDim2.new(StartPos.X.Scale, StartPos.X.Offset + Delta.X, StartPos.Y.Scale, StartPos.Y.Offset + Delta.Y)
        end
    end)
end

-- [2] الزر العائم
local ToggleBtn = Instance.new("ImageButton", Screen)
ToggleBtn.Size = UDim2.new(0, 45, 0, 45); ToggleBtn.Position = UDim2.new(0.5, -22, 0, 15)
ToggleBtn.BackgroundColor3 = Color3.fromRGB(10, 10, 10); ToggleBtn.Image = "rbxassetid://6031094067"; ToggleBtn.Visible = false
Instance.new("UICorner", ToggleBtn).CornerRadius = UDim.new(1, 0)
local ToggleStroke = Instance.new("UIStroke", ToggleBtn); ToggleStroke.Thickness = 1.5; ToggleStroke.Color = MainColor
SimpleDrag(ToggleBtn, ToggleBtn)

-- [3] الإطار الرئيسي
local Main = Instance.new("Frame", Screen)
Main.Size = UDim2.new(0, 560, 0, 390); Main.Position = UDim2.new(0.5, -280, 0.5, -195)
Main.BackgroundColor3 = Color3.fromRGB(8, 8, 8); Instance.new("UICorner", Main).CornerRadius = UDim.new(0, 15)
local MainStroke = Instance.new("UIStroke", Main); MainStroke.Thickness = 2; MainStroke.Color = MainColor

local FogBg = Instance.new("ImageLabel", Main)
FogBg.Size = UDim2.new(1, 0, 1, 0); FogBg.BackgroundTransparency = 1; FogBg.Image = "rbxassetid://12350036653"
FogBg.ImageColor3 = Color3.fromRGB(50, 50, 50); FogBg.ImageTransparency = 0.85; FogBg.ZIndex = 0

local function ToggleUI() Main.Visible = not Main.Visible; ToggleBtn.Visible = not Main.Visible end
ToggleBtn.MouseButton1Click:Connect(ToggleUI)

-- [4] الهيدر
local Header = Instance.new("Frame", Main); Header.Size = UDim2.new(1, 0, 0, 65); Header.BackgroundTransparency = 1; Header.ZIndex = 10
SimpleDrag(Main, Header)

local Logo = Instance.new("TextLabel", Header)
Logo.RichText = true; Logo.Text = "N.X.R <font color='#DCDCDC'>>>> </font>"; Logo.Size = UDim2.new(0, 150, 1, 0); Logo.Position = UDim2.new(0, 25, 0, 0); Logo.BackgroundTransparency = 1; Logo.TextColor3 = MainColor; Logo.TextSize = 20; Logo.Font = "GothamBold"; Logo.TextXAlignment = "Left"

local CloseBtn = Instance.new("TextButton", Header); CloseBtn.Size = UDim2.new(0, 30, 0, 30); CloseBtn.Position = UDim2.new(1, -40, 0, 17); CloseBtn.BackgroundTransparency = 1; CloseBtn.Text = "X"; CloseBtn.TextColor3 = MainColor; CloseBtn.TextSize = 18; CloseBtn.Font = "GothamBold"; CloseBtn.MouseButton1Click:Connect(ToggleUI)

-- [5] الصفحات
local PagesCont = Instance.new("Frame", Main); PagesCont.Size = UDim2.new(1, 0, 1, -65); PagesCont.Position = UDim2.new(0, 0, 0, 65); PagesCont.BackgroundTransparency = 1
local Pages = { Home = Instance.new("Frame", PagesCont) }
Pages.Home.Size = UDim2.new(1, 0, 1, 0); Pages.Home.BackgroundTransparency = 1

-- [6] صفحة Home (الهوية والأزرار)
local IDCard = Instance.new("Frame", Pages.Home); IDCard.Size = UDim2.new(0, 210, 0, 210); IDCard.Position = UDim2.new(0, 25, 0, 25); IDCard.BackgroundColor3 = Color3.fromRGB(12, 12, 12); IDCard.ZIndex = 3; Instance.new("UICorner", IDCard).CornerRadius = UDim.new(0, 10); local IDS = Instance.new("UIStroke", IDCard); IDS.Color = MainColor; IDS.Thickness = 1.8

local pImg = Instance.new("ImageLabel", IDCard); pImg.Size = UDim2.new(0, 60, 0, 60); pImg.Position = UDim2.new(0, 15, 0, 15); pImg.Image = "rbxthumb://type=AvatarHeadShot&id="..LP.UserId.."&w=150&h=150"; pImg.ZIndex = 5; Instance.new("UICorner", pImg).CornerRadius = UDim.new(0, 8)
local DName = Instance.new("TextLabel", IDCard); DName.Text = LP.DisplayName; DName.Size = UDim2.new(0, 110, 0, 20); DName.Position = UDim2.new(0, 85, 0, 20); DName.BackgroundTransparency = 1; DName.TextColor3 = Color3.new(1, 1, 1); DName.TextSize = 12; DName.Font = "GothamBold"; DName.TextXAlignment = "Left"; DName.ZIndex = 5
local UName = Instance.new("TextLabel", IDCard); UName.Text = "@"..LP.Name; UName.Size = UDim2.new(0, 110, 0, 20); UName.Position = UDim2.new(0, 85, 0, 38); UName.BackgroundTransparency = 1; UName.TextColor3 = Color3.fromRGB(150, 150, 150); UName.TextSize = 10; UName.Font = "GothamMedium"; UName.TextXAlignment = "Left"; UName.ZIndex = 5

local RankTag = Instance.new("Frame", IDCard); RankTag.Size = UDim2.new(0, 55, 0, 18); RankTag.Position = UDim2.new(0, 85, 0, 58); RankTag.BackgroundColor3 = Color3.fromRGB(20, 20, 20); RankTag.ZIndex = 5; Instance.new("UICorner", RankTag).CornerRadius = UDim.new(0, 4); local RS = Instance.new("UIStroke", RankTag); RS.Color = MainColor; RS.Thickness = 1
local RT = Instance.new("TextLabel", RankTag); RT.Size = UDim2.new(1, 0, 1, 0); RT.Text = "OWNER"; RT.TextColor3 = MainColor; RT.TextSize = 8; RT.Font = "GothamBold"; RT.BackgroundTransparency = 1; RT.ZIndex = 6

local PlayTimeLabel = Instance.new("TextLabel", IDCard); PlayTimeLabel.Text = "PlayTime: 00:00:00"; PlayTimeLabel.Position = UDim2.new(0, 15, 0, 150); PlayTimeLabel.Size = UDim2.new(1, -30, 0, 20); PlayTimeLabel.BackgroundTransparency = 1; PlayTimeLabel.TextColor3 = MainColor; PlayTimeLabel.TextSize = 10; PlayTimeLabel.Font = "GothamBold"; PlayTimeLabel.TextXAlignment = "Left"; PlayTimeLabel.ZIndex = 5

local PicBox = Instance.new("Frame", Pages.Home); PicBox.Size = UDim2.new(1, -275, 0, 210); PicBox.Position = UDim2.new(0, 250, 0, 25); PicBox.BackgroundColor3 = Color3.fromRGB(12, 12, 12); PicBox.ZIndex = 3; Instance.new("UICorner", PicBox).CornerRadius = UDim.new(0, 10); local PIS = Instance.new("UIStroke", PicBox); PIS.Color = MainColor; PIS.Thickness = 1.8

-- الأزرار السفلية
local function CreateMiniBtn(name, x, y)
    local b = Instance.new("TextButton", Pages.Home); b.Size = UDim2.new(0, 95, 0, 42); b.Position = UDim2.new(0, x, 0, y); b.BackgroundColor3 = Color3.fromRGB(10, 10, 10); b.Text = name; b.TextColor3 = MainColor; b.Font = "GothamBold"; b.TextSize = 10; b.ZIndex = 3
    Instance.new("UICorner", b).CornerRadius = UDim.new(0, 6); local s = Instance.new("UIStroke", b); s.Color = MainColor; s.Thickness = 1.2; s.ApplyStrokeMode = "Border"
end
CreateMiniBtn("CONFIG", 25, 255); CreateMiniBtn("SETTING", 130, 255)

local AdBtn = Instance.new("TextButton", Pages.Home); AdBtn.Size = UDim2.new(1, -275, 0, 42); AdBtn.Position = UDim2.new(0, 250, 0, 255); AdBtn.BackgroundColor3 = Color3.fromRGB(10, 10, 10); AdBtn.Text = "ADVERTISEMENT (إعلان)"; AdBtn.TextColor3 = MainColor; AdBtn.Font = "GothamBold"; AdBtn.TextSize = 11; AdBtn.ZIndex = 3
Instance.new("UICorner", AdBtn).CornerRadius = UDim.new(0, 6); local AdStroke = Instance.new("UIStroke", AdBtn); AdStroke.Color = MainColor; AdStroke.Thickness = 1.2; AdStroke.ApplyStrokeMode = "Border"

-- تحديث البيانات
local StartTime = os.time()
task.spawn(function()
    while task.wait(1) do
        local E = os.time() - StartTime
        PlayTimeLabel.Text = string.format("PlayTime: %02d:%02d:%02d", math.floor(E/3600), math.floor((E%3600)/60), E%60)
    end
end)
