-- [[ NAXOR V5.1 - SMOOTH DRAG & STABLE UI ]] --

local Players = game:GetService("Players")
local LP = Players.LocalPlayer
local PlayerGui = LP:WaitForChild("PlayerGui")
local UIS = game:GetService("UserInputService")
local TS = game:GetService("TweenService")

if PlayerGui:FindFirstChild("Naxor_Official_V5") then
    PlayerGui:FindFirstChild("Naxor_Official_V5"):Destroy()
end

local MainColor = Color3.fromRGB(220, 220, 220)

-- [1] الشاشة الرئيسية
local Screen = Instance.new("ScreenGui", PlayerGui)
Screen.Name = "Naxor_Official_V5"; Screen.IgnoreGuiInset = true

-- [ وظيفة السحب الاحترافية ] --
local function MakeDraggable(UIElement, Handle)
    local Dragging, DragInput, DragStart, StartPos
    Handle = Handle or UIElement
    
    Handle.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            Dragging = true; DragStart = input.Position; StartPos = UIElement.Position
            input.Changed:Connect(function() if input.UserInputState == Enum.UserInputState.End then Dragging = false end end)
        end
    end)
    
    Handle.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then DragInput = input end
    end)
    
    UIS.InputChanged:Connect(function(input)
        if input == DragInput and Dragging then
            local Delta = input.Position - DragStart
            UIElement.Position = UDim2.new(StartPos.X.Scale, StartPos.X.Offset + Delta.X, StartPos.Y.Scale, StartPos.Y.Offset + Delta.Y)
        end
    end)
end

-- [2] الزر العائم (قابل للسحب بسلاسة)
local ToggleBtn = Instance.new("ImageButton", Screen)
ToggleBtn.Size = UDim2.new(0, 45, 0, 45); ToggleBtn.Position = UDim2.new(0.5, -22, 0, 15)
ToggleBtn.BackgroundColor3 = Color3.fromRGB(10, 10, 10); ToggleBtn.Image = "rbxassetid://6031094067"
ToggleBtn.Visible = false; Instance.new("UICorner", ToggleBtn).CornerRadius = UDim.new(1, 0)
local ToggleStroke = Instance.new("UIStroke", ToggleBtn); ToggleStroke.Thickness = 1.5; ToggleStroke.Color = MainColor
MakeDraggable(ToggleBtn)

-- [3] الإطار الرئيسي
local Main = Instance.new("Frame", Screen)
Main.Size = UDim2.new(0, 560, 0, 390); Main.Position = UDim2.new(0.5, -280, 0.5, -195)
Main.BackgroundColor3 = Color3.fromRGB(8, 8, 8); Main.ClipsDescendants = true
Instance.new("UICorner", Main).CornerRadius = UDim.new(0, 15)
local MainStroke = Instance.new("UIStroke", Main); MainStroke.Thickness = 2; MainStroke.Color = MainColor

-- خلفية الضباب
local FogBg = Instance.new("ImageLabel", Main)
FogBg.Size = UDim2.new(1, 0, 1, 0); FogBg.BackgroundTransparency = 1; FogBg.Image = "rbxassetid://12350036653"; FogBg.ImageColor3 = Color3.fromRGB(50, 50, 50); FogBg.ImageTransparency = 0.85; FogBg.ZIndex = 0

local function ToggleUI() Main.Visible = not Main.Visible; ToggleBtn.Visible = not Main.Visible end
ToggleBtn.MouseButton1Click:Connect(ToggleUI)

-- [4] الهيدر والسحب (جعلنا الهيدر هو مقبض السحب فقط)
local Header = Instance.new("Frame", Main); Header.Size = UDim2.new(1, 0, 0, 65); Header.BackgroundTransparency = 1; Header.ZIndex = 10
MakeDraggable(Main, Header)

local Logo = Instance.new("TextLabel", Header); Logo.RichText = true; Logo.Text = "N.X.R <font color='#DCDCDC'>>>> </font>"; Logo.Size = UDim2.new(0, 150, 1, 0); Logo.Position = UDim2.new(0, 25, 0, 0); Logo.BackgroundTransparency = 1; Logo.TextColor3 = MainColor; Logo.TextSize = 20; Logo.Font = "GothamBold"; Logo.TextXAlignment = "Left"
local CloseBtn = Instance.new("TextButton", Header); CloseBtn.Size = UDim2.new(0, 30, 0, 30); CloseBtn.Position = UDim2.new(1, -40, 0, 17); CloseBtn.BackgroundTransparency = 1; CloseBtn.Text = "X"; CloseBtn.TextColor3 = MainColor; CloseBtn.TextSize = 18; CloseBtn.Font = "GothamBold"; CloseBtn.MouseButton1Click:Connect(ToggleUI)

-- [5] نظام التنقل (Nav)
local Nav = Instance.new("Frame", Header); Nav.Size = UDim2.new(0, 250, 1, 0); Nav.Position = UDim2.new(1, -300, 0, 0); Nav.BackgroundTransparency = 1
local Underline = Instance.new("Frame", Nav); Underline.Size = UDim2.new(0, 35, 0, 1.5); Underline.Position = UDim2.new(0, 15, 0, 45); Underline.BackgroundColor3 = MainColor

local Separator = Instance.new("Frame", Main); Separator.Size = UDim2.new(1, 0, 0, 1.5); Separator.Position = UDim2.new(0, 0, 0, 65); Separator.BackgroundColor3 = MainColor; Separator.BorderSizePixel = 0; Separator.ZIndex = 5

local PagesCont = Instance.new("Frame", Main); PagesCont.Size = UDim2.new(1, 0, 1, -65); PagesCont.Position = UDim2.new(0, 0, 0, 65); PagesCont.BackgroundTransparency = 1; PagesCont.ZIndex = 2
local Pages = { Home = Instance.new("Frame", PagesCont), Scripts = Instance.new("Frame", PagesCont), Credits = Instance.new("Frame", PagesCont) }
for name, frame in pairs(Pages) do frame.Size = UDim2.new(1, 0, 1, 0); frame.BackgroundTransparency = 1; frame.Visible = (name == "Home") end

local function CreateNavBtn(name, x, target)
    local b = Instance.new("TextButton", Nav); b.Size = UDim2.new(0, 70, 1, 0); b.Position = UDim2.new(0, x, 0, 0); b.BackgroundTransparency = 1; b.Text = name; b.TextColor3 = Color3.fromRGB(180, 180, 180); b.Font = "GothamMedium"; b.TextSize = 12
    b.MouseButton1Click:Connect(function() 
        TS:Create(Underline, TweenInfo.new(0.25), {Position = UDim2
