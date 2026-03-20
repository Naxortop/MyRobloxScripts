-- [[ NAXOR V12.1 - PICBOX RESTORED EDITION ]] --
-- Features: PicBox Restored, Spacing Fixed, Anti-Camera Drag, Full Info

local Players = game:GetService("Players")
local LP = Players.LocalPlayer
local PlayerGui = LP:WaitForChild("PlayerGui")
local UIS = game:GetService("UserInputService")
local TS = game:GetService("TweenService")

-- [ 1. تنظيف النسخ السابقة ] --
if PlayerGui:FindFirstChild("Naxor_Official_System") then 
    PlayerGui:FindFirstChild("Naxor_Official_System"):Destroy() 
end

local MainColor = Color3.fromRGB(220, 220, 220)
local Screen = Instance.new("ScreenGui", PlayerGui)
Screen.Name = "Naxor_Official_System"; Screen.ResetOnSpawn = false

-- [ 2. وظيفة السحب المصلحة لمنع تحرك الكاميرا ] --
local function MakeDraggable(Frame, Handle)
    local Dragging, DragInput, DragStart, StartPos
    Handle.InputBegan:Connect(function(input)
        if (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) then
            Dragging = true; DragStart = input.Position; StartPos = Frame.Position
            input.Changed:Connect(function() 
                if input.UserInputState == Enum.UserInputState.End then Dragging = false end 
            end)
        end
    end)
    UIS.InputChanged:Connect(function(input)
        if Dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
            local Delta = input.Position - DragStart
            Frame.Position = UDim2.new(StartPos.X.Scale, StartPos.X.Offset + Delta.X, StartPos.Y.Scale, StartPos.Y.Offset + Delta.Y)
        end
    end)
end

-- [ 3. الإطار الرئيسي ] --
local Main = Instance.new("Frame", Screen)
Main.Size = UDim2.new(0, 560, 0, 390); Main.Position = UDim2.new(0.5, -280, 0.5, -195)
Main.BackgroundColor3 = Color3.fromRGB(8, 8, 8); Main.BorderSizePixel = 0; Main.Active = true
Instance.new("UICorner", Main).CornerRadius = UDim.new(0, 15)
local MainStroke = Instance.new("UIStroke", Main); MainStroke.Thickness = 2; MainStroke.Color = MainColor

-- [ 4. الهيدر، زر الإغلاق، والخط الفاصل ] --
local Header = Instance.new("Frame", Main); Header.Size = UDim2.new(1, 0, 0, 65); Header.BackgroundTransparency = 1; Header.ZIndex = 10
MakeDraggable(Main, Header)

local Logo = Instance.new("TextLabel", Header); Logo.RichText = true; Logo.Text = "N.X.R <font color='#888'>>>> </font> SYSTEM"; Logo.Size = UDim2.new(0, 200, 1, 0); Logo.Position = UDim2.new(0, 25, 0, 0); Logo.BackgroundTransparency = 1; Logo.TextColor3 = MainColor; Logo.TextSize = 20; Logo.Font = "GothamBold"; Logo.TextXAlignment = "Left"

local CloseBtn = Instance.new("TextButton", Header); CloseBtn.Size = UDim2.new(0, 30, 0, 30); CloseBtn.Position = UDim2.new(1, -40, 0, 17); CloseBtn.BackgroundTransparency = 1; CloseBtn.Text = "X"; CloseBtn.TextColor3 = MainColor; CloseBtn.TextSize = 18; CloseBtn.Font = "GothamBold"; CloseBtn.MouseButton1Click:Connect(function() Screen:Destroy() end)

local Separator = Instance.new("Frame", Main); Separator.Size = UDim2.new(1, 0, 0, 1.5); Separator.Position = UDim2.new(0, 0, 0, 65); Separator.BackgroundColor3 = MainColor; Separator.BorderSizePixel = 0

-- [ 5. نظام التنقل (Tabs) ] --
local Nav = Instance.new("Frame", Header); Nav.Size = UDim2.new(0, 250, 1, 0); Nav.Position = UDim2.new(1, -300, 0, 0); Nav.BackgroundTransparency = 1
local Underline = Instance.new("Frame", Nav); Underline.Size = UDim2.new(0, 35, 0, 2); Underline.Position = UDim2.new(0, 15, 0, 45); Underline.BackgroundColor3 = MainColor

local PagesCont = Instance.new("Frame", Main); PagesCont.Size = UDim2.new(1, 0, 1, -65); PagesCont.Position = UDim2.new(0, 0, 0, 65); PagesCont.BackgroundTransparency = 1
local P = { Home = Instance.new("Frame", PagesCont), Pages = Instance.new("Frame", PagesCont), Credits = Instance.new("Frame", PagesCont) }
for name, f in pairs(P) do f.Size = UDim2.new(1, 0, 1, 0); f.BackgroundTransparency = 1; f.Visible = (name == "Home") end

local function CreateNavBtn(name, x, target)
    local b = Instance.new("TextButton", Nav); b.Size = UDim2.new(0, 70, 1, 0); b.Position = UDim2.new(0, x, 0, 0); b.BackgroundTransparency = 1; b.Text = name; b.TextColor3 = Color3.fromRGB(150, 150, 150); b.Font = "GothamBold"; b.TextSize = 12
    b.MouseButton1Click:Connect(function()
        TS:Create(Underline, TweenInfo.new(0.3), {Position = UDim2.new(0, x + 15, 0, 45)}):Play()
        for n, f in pairs(P) do f.Visible = (n == target) end
    end)
end
CreateNavBtn("HOME", 0, "Home"); CreateNavBtn("PAGES", 75, "Pages"); CreateNavBtn("CREDITS", 150, "Credits")

-- [[ 6. محتوى صفحة HOME - الهوية والصورة المعاد تفعيلها ]] --

-- مربع الهوية (اليسار)
local IDCard = Instance.new("Frame", P.Home); IDCard.Size = UDim2.new(0, 215, 0, 210); IDCard.Position = UDim2.new(0, 25, 0, 25); IDCard.BackgroundColor3 = Color3.fromRGB(12, 12, 12); Instance.new("UICorner", IDCard).CornerRadius = UDim.new(0, 10); local IDS = Instance.new("UIStroke", IDCard); IDS.Color = MainColor; IDS.Thickness = 1.5

-- مربع الصورة (اليمين) - تم إرجاعه!
local PicBox = Instance.new("Frame", P.Home); PicBox.Size = UDim2.new(1, -285, 0, 210); PicBox.Position = UDim2.new(0, 255, 0, 25); PicBox.BackgroundColor3 = Color3.fromRGB(12, 12, 12); Instance.new("UICorner", PicBox).CornerRadius = UDim.new(0, 10); local PIS = Instance.new("UIStroke", PicBox); PIS.Color = MainColor; PIS.Thickness = 1.5; PicBox.ClipsDescendants = true
local AdLabel = Instance.new("TextLabel", PicBox); AdLabel.Size = UDim2.new(1, 0, 1, 0); AdLabel.Text = "IMAGE / AD PLACE"; AdLabel.TextColor3 = Color3.fromRGB(60, 60, 60); AdLabel.Font = "GothamBold"; AdLabel.TextSize = 12; AdLabel.BackgroundTransparency = 1

-- [ 7. الأزرار السفلية (المسافة المصلحة Y = 255) ] --
local function ActionBtn(name, pos, size)
    local btn = Instance.new("TextButton", P.Home); btn.Size = size; btn.Position = pos; btn.BackgroundColor3 = Color3.fromRGB(15, 15, 15); btn.Text = name; btn.TextColor3 = Color3.new(1,1,1); btn.Font = "GothamBold"; btn.TextSize = 10; Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 8); local s = Instance.new("UIStroke", btn); s.Color = MainColor; s.Thickness = 1.2; return btn
end

ActionBtn("CONFIG SYSTEM", UDim2.new(0, 25, 0, 255), UDim2.new(0, 100, 0, 48))
ActionBtn("SETTINGS", UDim2.new(0, 140, 0, 255), UDim2.new(0, 100, 0, 48))
ActionBtn("ADVERTISEMENT", UDim2.new(0, 255, 0, 255), UDim2.new(1, -280, 0, 48))

-- [ 8. أنظمة البيانات (Online & Time) ] --
local Avatar = Instance.new("ImageLabel", IDCard); Avatar.Size = UDim2.new(0, 60, 0, 60); Avatar.Position = UDim2.new(0, 15, 0, 15); Avatar.Image = "rbxthumb://type=AvatarHeadShot&id="..LP.UserId.."&w=150&h=150"; Instance.new("UICorner", Avatar).CornerRadius = UDim.new(0, 8)
local DName = Instance.new("TextLabel", IDCard); DName.Text = LP.DisplayName; DName.Size = UDim2.new(0, 120, 0, 20); DName.Position = UDim2.new(0, 85, 0, 20); DName.BackgroundTransparency = 1; DName.TextColor3 = Color3.new(1,1,1); DName.Font = "GothamBold"; DName.TextXAlignment = "Left"; DName.TextSize = 12
local UName = Instance.new("TextLabel", IDCard); UName.Text = "@"..LP.Name; UName.Size = UDim2.new(0, 110, 0, 20); UName.Position = UDim2.new(0, 85, 0, 38); UName.BackgroundTransparency = 1; UName.TextColor3 = Color3.fromRGB(150, 150, 150); UName.TextSize = 10; UName.Font = "GothamMedium"; UName.TextXAlignment = "Left"

local RankTag = Instance.new("Frame", IDCard); RankTag.Size = UDim2.new(0, 55, 0, 18); RankTag.Position = UDim2.new(0, 85, 0, 58); RankTag.BackgroundColor3 = Color3.fromRGB(20, 20, 20); Instance.new("UICorner", RankTag).CornerRadius = UDim.new(0, 4); local RS = Instance.new("UIStroke", RankTag); RS.Color = MainColor; RS.Thickness = 1
local RT = Instance.new("TextLabel", RankTag); RT.Size = UDim2.new(1, 0, 1, 0); RT.Text = "OWNER"; RT.TextColor3 = MainColor; RT.TextSize = 8; RT.Font = "GothamBold"; RT.BackgroundTransparency = 1

local PlayTime = Instance.new("TextLabel", IDCard); PlayTime.Position = UDim2.new(0, 15, 0, 140); PlayTime.Size = UDim2.new(1, -30, 0, 20); PlayTime.BackgroundTransparency = 1; PlayTime.TextColor3 = MainColor; PlayTime.Font = "GothamBold"; PlayTime.TextSize = 10; PlayTime.TextXAlignment = "Left"
local Online = Instance.new("TextLabel", IDCard); Online.Position = UDim2.new(0, 15, 1, -30); Online.Size = UDim2.new(1, -30, 0, 20); Online.BackgroundTransparency = 1; Online.TextColor3 = Color3.fromRGB(0, 255, 120); Online.Font = "GothamMedium"; Online.TextSize = 9; Online.TextXAlignment = "Left"

task.spawn(function()
    local start = os.time()
    while task.wait(1) do
        local diff = os.time() - start
        PlayTime.Text = string.format("SESSION: %02d:%02d:%02d", math.floor(diff/3600), math.floor((diff%3600)/60), diff%60)
        Online.Text = "● " .. math.random(2900, 3300) .. " ONLINE"
    end
end)
