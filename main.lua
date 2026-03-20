-- [[ NAXOR V8.6 - DEFINITIVE DATA FIX ]] --

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
    UIS.InputEnded:Connect(function(input) if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then Dragging = false end end)
end

-- [ الزر العائم ] --
local ToggleBtn = Instance.new("ImageButton", Screen)
ToggleBtn.Size = UDim2.new(0, 50, 0, 50); ToggleBtn.Position = UDim2.new(0, 20, 0.5, -25)
ToggleBtn.BackgroundColor3 = Color3.fromRGB(10, 10, 10); ToggleBtn.Image = "rbxassetid://18443200213"
ToggleBtn.Visible = false; Instance.new("UICorner", ToggleBtn).CornerRadius = UDim.new(1, 0)
local ToggleStroke = Instance.new("UIStroke", ToggleBtn); ToggleStroke.Thickness = 1.5; ToggleStroke.Color = MainColor
MakeDraggable(ToggleBtn, ToggleBtn)

-- [ الإطار الرئيسي ] --
local Main = Instance.new("Frame", Screen)
Main.Size = UDim2.new(0, 560, 0, 390); Main.Position = UDim2.new(0.5, -280, 0.5, -195)
Main.BackgroundColor3 = Color3.fromRGB(8, 8, 8); Main.Active = true; Instance.new("UICorner", Main).CornerRadius = UDim.new(0, 15)
local MainStroke = Instance.new("UIStroke", Main); MainStroke.Thickness = 2; MainStroke.Color = MainColor

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
local Separator = Instance.new("Frame", Main); Separator.Size = UDim2.new(1, 0, 0, 1.5); Separator.Position = UDim2.new(0, 0, 0, 65); Separator.BackgroundColor3 = MainColor; Separator.BorderSizePixel = 0

-- [ نظام الصفحات ] --
local PagesCont = Instance.new("Frame", Main); PagesCont.Size = UDim2.new(1, 0, 1, -65); PagesCont.Position = UDim2.new(0, 0, 0, 65); PagesCont.BackgroundTransparency = 1
local P = { Home = Instance.new("Frame", PagesCont), Pages = Instance.new("Frame", PagesCont), Credits = Instance.new("Frame", PagesCont) }
for name, frame in pairs(P) do frame.Size = UDim2.new(1, 0, 1, 0); frame.BackgroundTransparency = 1; frame.Visible = (name == "Home") end

-- [[ صفحة HOME المصلحة ]] --
local IDCard = Instance.new("Frame", P.Home); IDCard.Size = UDim2.new(0, 210, 0, 210); IDCard.Position = UDim2.new(0, 25, 0, 25); IDCard.BackgroundColor3 = Color3.fromRGB(12, 12, 12); Instance.new("UICorner", IDCard).CornerRadius = UDim.new(0, 10); local IDS = Instance.new("UIStroke", IDCard); IDS.Color = MainColor; IDS.Thickness = 1.8

local pImg = Instance.new("ImageLabel", IDCard); pImg.Size = UDim2.new(0, 60, 0, 60); pImg.Position = UDim2.new(0, 15, 0, 15); pImg.Image = "rbxthumb://type=AvatarHeadShot&id="..LP.UserId.."&w=150&h=150"; Instance.new("UICorner", pImg).CornerRadius = UDim.new(0, 8)
local DName = Instance.new("TextLabel", IDCard); DName.Text = LP.DisplayName; DName.Size = UDim2.new(0, 110, 0, 20); DName.Position = UDim2.new(0, 85, 0, 20); DName.BackgroundTransparency = 1; DName.TextColor3 = Color3.new(1, 1, 1); DName.TextSize = 12; DName.Font = "GothamBold"; DName.TextXAlignment = "Left"
local UName = Instance.new("TextLabel", IDCard); UName.Text = "@"..LP.Name; UName.Size = UDim2.new(0, 110, 0, 20); UName.Position = UDim2.new(0, 85, 0, 38); UName.BackgroundTransparency = 1; UName.TextColor3 = Color3.fromRGB(150, 150, 150); UName.TextSize = 10; UName.Font = "GothamMedium"; UName.TextXAlignment = "Left"

-- [ إضافة معلومات الجهاز وعمر الحساب - تأكيد الظهور ] --
local function AddLabel(text, yPos, color)
    local lbl = Instance.new("TextLabel", IDCard)
    lbl.Text = text; lbl.Size = UDim2.new(1, -30, 0, 20); lbl.Position = UDim2.new(0, 15, 0, yPos)
    lbl.BackgroundTransparency = 1; lbl.TextColor3 = color or Color3.fromRGB(200, 200, 200)
    lbl.TextSize = 10; lbl.Font = "GothamMedium"; lbl.TextXAlignment = "Left"
    return lbl
end

local DeviceType = (UIS.TouchEnabled and not UIS.KeyboardEnabled) and "Mobile" or (UIS.GamepadEnabled and "Console" or "PC")
AddLabel("Device: " .. DeviceType, 85) -- السطر الأول تحت الصورة
AddLabel("Account Age: " .. LP.AccountAge .. " Days", 105) -- السطر الثاني
AddLabel("User ID: " .. LP.UserId, 125) -- السطر الثالث
local PlayTimeLabel = AddLabel("PlayTime: 00:00:00", 155, MainColor); PlayTimeLabel.Font = "GothamBold"

-- [ الأزرار ومستطيل الإعلانات ] --
local function CreateStyledBtn(name, pos, size, parent)
    local btn = Instance.new("TextButton", parent); btn.Size = size; btn.Position = pos; btn.BackgroundColor3 = Color3.fromRGB(15, 15, 15); btn.Text = name; btn.TextColor3 = Color3.new(1, 1, 1); btn.Font = "GothamBold"; btn.TextSize = 11; Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 8); local s = Instance.new("UIStroke", btn); s.Color = MainColor; s.Thickness = 1.2; return btn
end
CreateStyledBtn("CONFIG", UDim2.new(0, 25, 0, 255), UDim2.new(0, 100, 0, 45), P.Home)
CreateStyledBtn("SETTING", UDim2.new(0, 135, 0, 255), UDim2.new(0, 100, 0, 45), P.Home)
CreateStyledBtn("ADVERTISEMENT (إعلان)", UDim2.new(0, 250, 0, 255), UDim2.new(1, -275, 0, 45), P.Home)
local PicBox = Instance.new("Frame", P.Home); PicBox.Size = UDim2.new(1, -275, 0, 210); PicBox.Position = UDim2.new(0, 250, 0, 25); PicBox.BackgroundColor3 = Color3.fromRGB(12, 12, 12); Instance.new("UICorner", PicBox).CornerRadius = UDim.new(0, 10); Instance.new("UIStroke", PicBox).Color = MainColor

-- [ الأنظمة المستمرة ] --
local ST = os.time()
task.spawn(function() while task.wait(1) do local E = os.time()-ST; PlayTimeLabel.Text = string.format("PlayTime: %02d:%02d:%02d", math.floor(E/3600), math.floor((E%3600)/60), E%60) end end)
