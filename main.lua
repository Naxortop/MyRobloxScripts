-- [[ NAXOR V14.0 - NO IMAGE VERSION ]] --
-- [ المربع موجود ولكن بدون صورة - الحفاظ على الهيكل الأصلي ] --

local Players = game:GetService("Players")
local LP = Players.LocalPlayer
local PlayerGui = LP:WaitForChild("PlayerGui")
local UIS = game:GetService("UserInputService")
local TS = game:GetService("TweenService")

if PlayerGui:FindFirstChild("Naxor_Official_V5") then PlayerGui:FindFirstChild("Naxor_Official_V5"):Destroy() end

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
    UIS.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then Dragging = false end
    end)
end

-- [ الإطار الرئيسي ] --
local Main = Instance.new("Frame", Screen)
Main.Size = UDim2.new(0, 560, 0, 390); Main.Position = UDim2.new(0.5, -280, 0.5, -195)
Main.BackgroundColor3 = Color3.fromRGB(8, 8, 8); Instance.new("UICorner", Main).CornerRadius = UDim.new(0, 15)
local MainStroke = Instance.new("UIStroke", Main); MainStroke.Thickness = 2; MainStroke.Color = MainColor; Main.Active = true

-- [ الهيدر ] --
local Header = Instance.new("Frame", Main); Header.Size = UDim2.new(1, 0, 0, 65); Header.BackgroundTransparency = 1; Header.ZIndex = 10
MakeDraggable(Main, Header)

local Logo = Instance.new("TextLabel", Header); Logo.RichText = true; Logo.Text = "N.X.R <font color='#DCDCDC'>>>> </font>"; Logo.Size = UDim2.new(0, 150, 1, 0); Logo.Position = UDim2.new(0, 25, 0, 0); Logo.BackgroundTransparency = 1; Logo.TextColor3 = MainColor; Logo.TextSize = 20; Logo.Font = "GothamBold"; Logo.TextXAlignment = "Left"
local CloseBtn = Instance.new("TextButton", Header); CloseBtn.Size = UDim2.new(0, 30, 0, 30); CloseBtn.Position = UDim2.new(1, -40, 0, 17); CloseBtn.BackgroundTransparency = 1; CloseBtn.Text = "X"; CloseBtn.TextColor3 = MainColor; CloseBtn.TextSize = 18; CloseBtn.Font = "GothamBold"; CloseBtn.MouseButton1Click:Connect(function() Screen:Destroy() end)

-- [ نظام الصفحات ] --
local Nav = Instance.new("Frame", Header); Nav.Size = UDim2.new(0, 250, 1, 0); Nav.Position = UDim2.new(1, -300, 0, 0); Nav.BackgroundTransparency = 1
local Underline = Instance.new("Frame", Nav); Underline.Size = UDim2.new(0, 35, 0, 2); Underline.Position = UDim2.new(0, 15, 0, 45); Underline.BackgroundColor3 = MainColor

local PagesCont = Instance.new("Frame", Main); PagesCont.Size = UDim2.new(1, 0, 1, -65); PagesCont.Position = UDim2.new(0, 0, 0, 65); PagesCont.BackgroundTransparency = 1
local P = { Home = Instance.new("Frame", PagesCont), Pages = Instance.new("Frame", PagesCont), Credits = Instance.new("Frame", PagesCont) }
for name, frame in pairs(P) do frame.Size = UDim2.new(1, 0, 1, 0); frame.BackgroundTransparency = 1; frame.Visible = (name == "Home") end

local function CreateNavBtn(text, x, target)
    local b = Instance.new("TextButton", Nav); b.Size = UDim2.new(0, 70, 1, 0); b.Position = UDim2.new(0, x, 0, 0); b.BackgroundTransparency = 1; b.Text = text; b.TextColor3 = Color3.fromRGB(150, 150, 150); b.Font = "GothamBold"; b.TextSize = 12
    b.MouseButton1Click:Connect(function()
        TS:Create(Underline, TweenInfo.new(0.3), {Position = UDim2.new(0, x + 15, 0, 45)}):Play()
        for n, f in pairs(P) do f.Visible = (n == target) end
    end)
end
CreateNavBtn("Home", 0, "Home"); CreateNavBtn("Pages", 75, "Pages"); CreateNavBtn("Credits", 150, "Credits")

-- [[ صفحة HOME ]] --
local IDCard = Instance.new("Frame", P.Home); IDCard.Size = UDim2.new(0, 210, 0, 210); IDCard.Position = UDim2.new(0, 25, 0, 25); IDCard.BackgroundColor3 = Color3.fromRGB(12, 12, 12); Instance.new("UICorner", IDCard).CornerRadius = UDim.new(0, 10); local IDS = Instance.new("UIStroke", IDCard); IDS.Color = MainColor; IDS.Thickness = 1.8

-- المربع اللي كان فيه الصورة (خليته موجود بس فاضي لعيونك)
local PicBox = Instance.new("Frame", P.Home); PicBox.Size = UDim2.new(1, -275, 0, 210); PicBox.Position = UDim2.new(0, 250, 0, 25); PicBox.BackgroundColor3 = Color3.fromRGB(12, 12, 12); Instance.new("UICorner", PicBox).CornerRadius = UDim.new(0, 10); local PIS = Instance.new("UIStroke", PicBox); PIS.Color = MainColor; PIS.Thickness = 1.8

-- البيانات الشخصية
local pImg = Instance.new("ImageLabel", IDCard); pImg.Size = UDim2.new(0, 60, 0, 60); pImg.Position = UDim2.new(0, 15, 0, 15); pImg.Image = "rbxthumb://type=AvatarHeadShot&id="..LP.UserId.."&w=150&h=150"; Instance.new("UICorner", pImg).CornerRadius = UDim.new(0, 8)
local DName = Instance.new("TextLabel", IDCard); DName.Text = LP.DisplayName; DName.Size = UDim2.new(0, 110, 0, 20); DName.Position = UDim2.new(0, 85, 0, 20); DName.BackgroundTransparency = 1; DName.TextColor3 = Color3.new(1, 1, 1); DName.TextSize = 12; DName.Font = "GothamBold"; DName.TextXAlignment = "Left"
local UName = Instance.new("TextLabel", IDCard); UName.Text = "@"..LP.Name; UName.Size = UDim2.new(0, 110, 0, 20); UName.Position = UDim2.new(0, 85, 0, 38); UName.BackgroundTransparency = 1; UName.TextColor3 = Color3.fromRGB(150, 150, 150); UName.TextSize = 10; UName.Font = "GothamMedium"; UName.TextXAlignment = "Left"

-- Rank Tag
local RankTag = Instance.new("Frame", IDCard); RankTag.Size = UDim2.new(0, 55, 0, 18); RankTag.Position = UDim2.new(0, 85, 0, 58); RankTag.BackgroundColor3 = Color3.fromRGB(20, 20, 20); Instance.new("UICorner", RankTag).CornerRadius = UDim.new(0, 4); local RS = Instance.new("UIStroke", RankTag); RS.Color = MainColor; RS.Thickness = 1
local RT = Instance.new("TextLabel", RankTag); RT.Size = UDim2.new(1, 0, 1, 0); RT.Text = "OWNER"; RT.TextColor3 = MainColor; RT.TextSize = 8; RT.Font = "GothamBold"; RT.BackgroundTransparency = 1

local PlayTimeLabel = Instance.new("TextLabel", IDCard); PlayTimeLabel.Text = "PlayTime: 00:00:00"; PlayTimeLabel.Position = UDim2.new(0, 15, 0, 150); PlayTimeLabel.Size = UDim2.new(1, -30, 0, 20); PlayTimeLabel.BackgroundTransparency = 1; PlayTimeLabel.TextColor3 = MainColor; PlayTimeLabel.TextSize = 10; PlayTimeLabel.Font = "GothamBold"; PlayTimeLabel.TextXAlignment = "Left"
local Online = Instance.new("TextLabel", IDCard); Online.Text = "● 0 ONLINE"; Online.Position = UDim2.new(0, 15, 1, -30); Online.Size = UDim2.new(1, -30, 0, 20); Online.BackgroundTransparency = 1; Online.TextColor3 = Color3.fromRGB(0, 255, 120); Online.Font = "GothamMedium"; Online.TextSize = 9; Online.TextXAlignment = "Left"

-- [ الأزرار السفلية ] --
local function CreateStyledBtn(name, pos, size, parent)
    local btn = Instance.new("TextButton", parent); btn.Size = size; btn.Position = pos; btn.BackgroundColor3 = Color3.fromRGB(15, 15, 15); btn.Text = name; btn.TextColor3 = Color3.fromRGB(255, 255, 255); btn.Font = "GothamBold"; btn.TextSize = 11; Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 8); local s = Instance.new("UIStroke", btn); s.Color = MainColor; s.Thickness = 1.2; return btn
end
CreateStyledBtn("CONFIG", UDim2.new(0, 25, 0, 255), UDim2.new(0, 100, 0, 45), P.Home)
CreateStyledBtn("SETTING", UDim2.new(0, 135, 0, 255), UDim2.new(0, 100, 0, 45), P.Home)
CreateStyledBtn("ADVERTISEMENT", UDim2.new(0, 250, 0, 255), UDim2.new(1, -275, 0, 45), P.Home)

-- [ المحرك ] --
task.spawn(function()
    local ST = os.time()
    while task.wait(1) do
        local E = os.time()-ST
        PlayTimeLabel.Text = string.format("PlayTime: %02d:%02d:%02d", math.floor(E/3600), math.floor((E%3600)/60), diff%60)
        Online.Text = "● " .. math.random(2900, 3300) .. " ONLINE"
    end
end)
