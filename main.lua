-- [[ NAXOR V4 - CLEAN STABLE VERSION - NO BUGS ]] --

local Players = game:GetService("Players")
local LP = Players.LocalPlayer
local PlayerGui = LP:WaitForChild("PlayerGui")
local UIS = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")

-- [1] تنظيف شامل
for _, v in pairs(PlayerGui:GetChildren()) do
    if v.Name == "Naxor_Official_V4" then v:Destroy() end
end

-- [2] إعدادات الثيم (RGB)
local R, G, B = 255, 0, 50

-- [3] العناصر الأساسية
local Screen = Instance.new("ScreenGui", PlayerGui)
Screen.Name = "Naxor_Official_V4"
Screen.ResetOnSpawn = false

local Main = Instance.new("Frame", Screen)
Main.Size = UDim2.new(0, 480, 0, 340)
Main.Position = UDim2.new(0.5, -240, 0.5, -170)
Main.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
Main.BorderSizePixel = 0
Main.Active = true 
Instance.new("UICorner", Main).CornerRadius = UDim.new(0, 15)

local Stroke = Instance.new("UIStroke", Main)
Stroke.Thickness = 2.5
Stroke.Color = Color3.fromRGB(R, G, B)

-- [4] شريط سحب الآيفون (iPhone Drag Bar) - المكان الوحيد للسحب
local DragBar = Instance.new("Frame", Main)
DragBar.Size = UDim2.new(0, 140, 0, 5)
DragBar.Position = UDim2.new(0.5, -70, 1, -12)
DragBar.BackgroundColor3 = Color3.new(1, 1, 1)
DragBar.BackgroundTransparency = 0.4
Instance.new("UICorner", DragBar).CornerRadius = UDim.new(1, 0)

-- برمجة سحب الواجهة (احترافية)
local Dragging, DragStart, StartPos
DragBar.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        Dragging = true
        DragStart = input.Position
        StartPos = Main.Position
    end
end)

UIS.InputChanged:Connect(function(input)
    if Dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
        local Delta = input.Position - DragStart
        Main.Position = UDim2.new(StartPos.X.Scale, StartPos.X.Offset + Delta.X, StartPos.Y.Scale, StartPos.Y.Offset + Delta.Y)
    end
end)

UIS.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        Dragging = false
    end
end)

-- [5] الشعار والتنقل
local Logo = Instance.new("TextLabel", Main)
Logo.RichText = true
Logo.Text = "N.X.R <font color='#FF0032'>>>> </font>"
Logo.Size = UDim2.new(0, 150, 0, 50); Logo.Position = UDim2.new(0, 20, 0, 5); Logo.BackgroundTransparency = 1; Logo.TextColor3 = Color3.new(1, 1, 1); Logo.TextSize = 24; Logo.Font = "GothamBold"; Logo.TextXAlignment = "Left"

local Indicator = Instance.new("Frame", Main)
Indicator.Size = UDim2.new(0, 35, 0, 2); Indicator.Position = UDim2.new(1, -90, 0, 47); Indicator.BackgroundColor3 = Color3.fromRGB(R, G, B); Indicator.BorderSizePixel = 0

-- الصفحات
local HomeP = Instance.new("Frame", Main); HomeP.Size = UDim2.new(1, 0, 1, 0); HomeP.BackgroundTransparency = 1; HomeP.Visible = true
local ScriptP = Instance.new("Frame", Main); ScriptP.Size = UDim2.new(1, 0, 1, 0); ScriptP.BackgroundTransparency = 1; ScriptP.Visible = false
local SettingsP = Instance.new("Frame", Main); SettingsP.Size = UDim2.new(1, 0, 1, 0); SettingsP.BackgroundTransparency = 1; SettingsP.Visible = false

-- [6] تحديث الألوان
local function UpdateUI()
    local Col = Color3.fromRGB(R, G, B)
    Stroke.Color = Col
    Indicator.BackgroundColor3 = Col
    Logo.Text = "N.X.R <font color='#" .. Col:ToHex() .. "'> >>> </font>"
end

-- [7] نظام اختيار الألوان (Sliders) - مصلح ومستقر
local function CreateSlider(name, sliderCol, order)
    local SFrame = Instance.new("Frame", SettingsP)
    SFrame.Size = UDim2.new(0, 240, 0, 35); SFrame.Position = UDim2.new(0, 20, 0, 100 + (order * 40)); SFrame.BackgroundColor3 = Color3.fromRGB(22, 22, 22)
    Instance.new("UICorner", SFrame).CornerRadius = UDim.new(0, 6)
    
    local Bar = Instance.new("Frame", SFrame); Bar.Size = UDim2.new(0, 180, 0, 4); Bar.Position = UDim2.new(0, 45, 0.5, -2); Bar.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    local Dot = Instance.new("TextButton", Bar); Dot.Size = UDim2.new(0, 14, 0, 14); Dot.Position = UDim2.new(0, 0, 0.5, -7); Dot.BackgroundColor3 = sliderCol; Dot.Text = ""; Instance.new("UICorner", Dot).CornerRadius = UDim.new(1, 0)
    
    local sDragging = false
    Dot.MouseButton1Down:Connect(function() sDragging = true end)
    
    UIS.InputChanged:Connect(function(input)
        if sDragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
            local relativePos = math.clamp((input.Position.X - Bar.AbsolutePosition.X) / Bar.AbsoluteSize.X, 0, 1)
            Dot.Position = UDim2.new(relativePos, -7, 0.5, -7)
            local Val = math.floor(relativePos * 255)
            if name == "R" then R = Val elseif name == "G" then G = Val elseif name == "B" then B = Val end
            UpdateUI()
        end
    end)
    
    UIS.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            sDragging = false
        end
    end)
end

CreateSlider("R", Color3.new(1, 0, 0), 0)
CreateSlider("G", Color3.new(0, 1, 0), 1)
CreateSlider("B", Color3.new(0, 0.6, 1), 2)

-- [8] أزرار التنقل
local HomeBtn = Instance.new("TextButton", Main); HomeBtn.Size = UDim2.new(0, 35, 0, 35); HomeBtn.Position = UDim2.new(1, -90, 0, 12); HomeBtn.Text = "🏠"; HomeBtn.BackgroundColor3 = Color3.fromRGB(25, 25, 25); HomeBtn.TextColor3 = Color3.new(1,1,1); Instance.new("UICorner", HomeBtn).CornerRadius = UDim.new(0, 8)
local ScriptBtn = Instance.new("TextButton", Main); ScriptBtn.Size = UDim2.new(0, 35, 0, 35); ScriptBtn.Position = UDim2.new(1, -45, 0, 12); ScriptBtn.Text = "📄"; ScriptBtn.BackgroundColor3 = Color3.fromRGB(25, 25, 25); ScriptBtn.TextColor3 = Color3.new(1,1,1); Instance.new("UICorner", ScriptBtn).CornerRadius = UDim.new(0, 8)

HomeBtn.MouseButton1Click:Connect(function()
    HomeP.Visible = true; ScriptP.Visible = false; SettingsP.Visible = false
    TweenService:Create(Indicator, TweenInfo.new(0.3), {Position = UDim2.new(1, -90, 0, 47)}):Play()
end)
ScriptBtn.MouseButton1Click:Connect(function()
    HomeP.Visible = false; ScriptP.Visible = true; SettingsP.Visible = false
    TweenService:Create(Indicator, TweenInfo.new(0.3), {Position = UDim2.new(1, -45, 0, 47)}):Play()
end)

-- [9] أزرار الهوم السفلية
local HomeBottom = Instance.new("Frame", HomeP); HomeBottom.Size = UDim2.new(1, 0, 0, 80); HomeBottom.Position = UDim2.new(0, 0, 0, 250); HomeBottom.BackgroundTransparency = 1
local function AddBBtn(txt, pos, cb)
    local b = Instance.new("TextButton", HomeBottom); b.Size = UDim2.new(0, 140, 0, 60); b.Position = pos; b.BackgroundColor3 = Color3.fromRGB(22, 22, 22); b.Text = txt; b.TextColor3 = Color3.new(1,1,1); b.Font = "GothamBold"; Instance.new("UICorner", b).CornerRadius = UDim.new(0, 8)
    b.MouseButton1Click:Connect(cb)
end
AddBBtn("SETTING", UDim2.new(0, 170, 0, 0), function() 
    HomeP.Visible = false; SettingsP.Visible = true
    TweenService:Create(Indicator, TweenInfo.new(0.3), {Position = UDim2.new(1, -67, 0, 47)}):Play()
end)

-- الزر العائم NXR
local Toggle = Instance.new("TextButton", Screen); Toggle.Size = UDim2.new(0, 50, 0, 50); Toggle.Position = UDim2.new(1, -60, 0, 20); Toggle.Text = "NXR"; Toggle.BackgroundColor3 = Color3.fromRGB(15, 15, 15); Toggle.TextColor3 = Color3.fromRGB(255, 0, 50); Instance.new("UICorner", Toggle).CornerRadius = UDim.new(1, 0); Toggle.Draggable = true
Toggle.MouseButton1Click:Connect(function() Main.Visible = not Main.Visible end)
