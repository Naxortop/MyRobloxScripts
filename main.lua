local Players = game:GetService("Players")
local LP = Players.LocalPlayer
local PlayerGui = LP:WaitForChild("PlayerGui")
local UIS = game:GetService("UserInputService")
local TS = game:GetService("TweenService")

-- تنظيف النسخ السابقة
for _, v in pairs(PlayerGui:GetChildren()) do
    if v.Name == "Naxor_Official_V4" then
        v:Destroy()
    end
end

-- ألوان
local R, G, B = 255, 0, 50
local function getColor()
    return Color3.fromRGB(R, G, B)
end

-- GUI
local Screen = Instance.new("ScreenGui")
Screen.Name = "Naxor_Official_V4"
Screen.Parent = PlayerGui

local Main = Instance.new("Frame", Screen)
Main.Size = UDim2.new(0, 560, 0, 390)
Main.Position = UDim2.new(0.5, -280, 0.5, -195)
Main.BackgroundColor3 = Color3.fromRGB(15,15,15)
Main.BorderSizePixel = 0
Instance.new("UICorner", Main).CornerRadius = UDim.new(0,20)

local MainStroke = Instance.new("UIStroke", Main)
MainStroke.Thickness = 3
MainStroke.Color = getColor()

-- Drag
local DragHeader = Instance.new("Frame", Main)
DragHeader.Size = UDim2.new(1,0,0,65)
DragHeader.BackgroundTransparency = 1

local dragging = false
local dragStart, startPos

DragHeader.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        dragStart = input.Position
        startPos = Main.Position
    end
end)

UIS.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = false
    end
end)

UIS.InputChanged:Connect(function(input)
    if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
        local delta = input.Position - dragStart
        Main.Position = UDim2.new(
            startPos.X.Scale,
            startPos.X.Offset + delta.X,
            startPos.Y.Scale,
            startPos.Y.Offset + delta.Y
        )
    end
end)

-- Logo
local Logo = Instance.new("TextLabel", DragHeader)
Logo.RichText = true
Logo.Size = UDim2.new(0,150,1,0)
Logo.Position = UDim2.new(0,25,0,0)
Logo.BackgroundTransparency = 1
Logo.TextColor3 = Color3.new(1,1,1)
Logo.TextSize = 26
Logo.Font = Enum.Font.GothamBold

-- تحديث اللون
local function UpdateRGB()
    local c = getColor()
    MainStroke.Color = c

    local hex = string.format("#%02X%02X%02X", R, G, B)
    Logo.Text = "N.X.R <font color='"..hex.."'> >>> </font>"
end

UpdateRGB()

-- صفحات
local HomePage = Instance.new("Frame", Main)
HomePage.Size = UDim2.new(1,-50,1,-170)
HomePage.Position = UDim2.new(0,25,0,80)
HomePage.BackgroundTransparency = 1

local SettingsPage = HomePage:Clone()
SettingsPage.Parent = Main
SettingsPage.Visible = false

-- Slider (محسن)
local function CreateSlider(name, color, order)
    local f = Instance.new("Frame", SettingsPage)
    f.Size = UDim2.new(0,280,0,45)
    f.Position = UDim2.new(0,10,0,order * 55)
    f.BackgroundColor3 = Color3.fromRGB(20,20,20)
    Instance.new("UICorner", f)

    local bar = Instance.new("Frame", f)
    bar.Size = UDim2.new(0,180,0,4)
    bar.Position = UDim2.new(0,85,0.5,-2)
    bar.BackgroundColor3 = Color3.fromRGB(40,40,40)

    local dot = Instance.new("Frame", bar)
    dot.Size = UDim2.new(0,16,0,16)
    dot.Position = UDim2.new(0,0,0.5,-8)
    dot.BackgroundColor3 = color
    Instance.new("UICorner", dot)

    local draggingSlider = false

    bar.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            draggingSlider = true
        end
    end)

    UIS.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            draggingSlider = false
        end
    end)

    UIS.InputChanged:Connect(function(input)
        if draggingSlider and input.UserInputType == Enum.UserInputType.MouseMovement then
            local pos = math.clamp(
                (input.Position.X - bar.AbsolutePosition.X) / bar.AbsoluteSize.X,
                0, 1
            )

            dot.Position = UDim2.new(pos, -8, 0.5, -8)

            local val = math.floor(pos * 255)

            if name == "R" then
                R = val
            elseif name == "G" then
                G = val
            elseif name == "B" then
                B = val
            end

            UpdateRGB()
        end
    end)
end

CreateSlider("R", Color3.new(1,0,0), 0)
CreateSlider("G", Color3.new(0,1,0), 1)
CreateSlider("B", Color3.new(0,0,1), 2)

-- زر Settings
local btn = Instance.new("TextButton", Main)
btn.Size = UDim2.new(0,160,0,60)
btn.Position = UDim2.new(0,200,1,-80)
btn.Text = "SETTINGS"
btn.BackgroundColor3 = Color3.fromRGB(20,20,20)

btn.MouseButton1Click:Connect(function()
    HomePage.Visible = false
    SettingsPage.Visible = true
end)

print("Naxor V4 Fixed ✅")
