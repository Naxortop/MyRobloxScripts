-- [[ NAXOR OFFICIAL SAVED SCRIPT - V12.1 ]] --
-- [ الميزات: مربع الصورة، الهوية الكاملة، المسافات Y=255، منع حركة الكاميرا ] --

local Players = game:GetService("Players")
local LP = Players.LocalPlayer
local PlayerGui = LP:WaitForChild("PlayerGui")
local UIS = game:GetService("UserInputService")
local TS = game:GetService("TweenService")

-- تنظيف النسخ السابقة
if PlayerGui:FindFirstChild("Naxor_Official_System") then 
    PlayerGui:FindFirstChild("Naxor_Official_System"):Destroy() 
end

local MainColor = Color3.fromRGB(220, 220, 220)
local Screen = Instance.new("ScreenGui", PlayerGui)
Screen.Name = "Naxor_Official_System"; Screen.ResetOnSpawn = false

-- [[ وظيفة السحب الاحترافية ]] --
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

-- [[ الإطار الرئيسي ]] --
local Main = Instance.new("Frame", Screen)
Main.Size = UDim2.new(0, 560, 0, 390); Main.Position = UDim2.new(0.5, -280, 0.5, -195)
Main.BackgroundColor3 = Color3.fromRGB(8, 8, 8); Main.Active = true -- يمنع تحرك الكاميرا
Instance.new("UICorner", Main).CornerRadius = UDim.new(0, 15)
local MainStroke = Instance.new("UIStroke", Main); MainStroke.Thickness = 2; MainStroke.Color = MainColor

-- [[ الهيدر والخط الفاصل ]] --
local Header = Instance.new("Frame", Main); Header.Size = UDim2.new(1, 0, 0, 65); Header.BackgroundTransparency = 1; Header.ZIndex = 10
MakeDraggable(Main, Header)

local Logo = Instance.new("TextLabel", Header);
