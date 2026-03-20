-- [[ NAXOR FINAL REPAIR - BACK TO BASICS ]] --

local Players = game:GetService("Players")
local LP = Players.LocalPlayer
local PlayerGui = LP:WaitForChild("PlayerGui")
local UIS = game:GetService("UserInputService")
local TS = game:GetService("TweenService")

-- إبادة أي نسخة خربانة
for _, v in pairs(PlayerGui:GetChildren()) do
    if v.Name == "Naxor_Official_V5" or v:IsA("ScreenGui") and v:FindFirstChild("Main") then
        v:Destroy()
    end
end

local MainColor = Color3.fromRGB(220, 220, 220)
local Screen = Instance.new("ScreenGui", PlayerGui)
Screen.Name = "Naxor_Official_V5"; Screen.ResetOnSpawn = false

-- [[ نظام السحب اللي ما يغلط ]] --
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

-- [[ الهيكل الرئيسي ]] --
local Main = Instance.new("Frame", Screen)
Main.Size = UDim2.new(0, 560, 0, 390); Main.Position = UDim2.new(0.5, -280, 0.5, -195)
Main.BackgroundColor3 = Color3.fromRGB(8, 8, 8); Main.Active = true
Instance.new("UICorner", Main).CornerRadius = UDim.new(0, 15)
local MainStroke = Instance.new("UIStroke", Main); MainStroke.Thickness = 2; MainStroke.Color = MainColor

-- [[ الهيدر واللوقو ]] --
local Header = Instance.new("Frame", Main); Header.Size = UDim2.new(1, 0, 0, 65); Header.BackgroundTransparency = 1; Header.ZIndex = 10
MakeDraggable(Main, Header)

local Logo = Instance.new("TextLabel", Header); Logo.RichText = true; Logo.Text = "N.X.R <font color='#888'>>>> </font> SYSTEM"; Logo.Size = UDim2.new(0, 200, 1, 0); Logo.Position = UDim2.new(0, 25, 0, 0); Logo.BackgroundTransparency = 1; Logo.TextColor3 = MainColor; Logo.TextSize = 20; Logo.Font = "GothamBold"; Logo.TextXAlignment = "Left"

local CloseBtn = Instance.new("TextButton", Header); CloseBtn.Size = UDim2.new(0, 30, 0, 30); CloseBtn.Position = UDim2.new(1, -40, 0, 17); CloseBtn.BackgroundTransparency = 1; CloseBtn.Text = "X"; CloseBtn.TextColor3 = MainColor; CloseBtn.TextSize = 18; CloseBtn.Font = "GothamBold"; CloseBtn.MouseButton1Click:Connect(function() Screen:Destroy() end)

local Sep = Instance.new("Frame", Main); Sep.Size = UDim2.new(1, 0, 0, 1); Sep.Position = UDim2.new(0, 0, 0, 65); Sep.BackgroundColor3 = MainColor; Sep.BackgroundTransparency = 0.5

-- [[ محتوى الصفحة ]] --
local Home = Instance.new("Frame", Main); Home.Size = UDim2.new(1, 0, 1, -65); Home.Position = UDim2.new(0, 0, 0, 65); Home.BackgroundTransparency = 1

-- مربع الهوية
local ID = Instance.new("Frame", Home); ID.Size = UDim2.new(0, 215, 0, 210); ID.Position = UDim2.new(0, 25, 0, 25); ID.BackgroundColor3 = Color3.fromRGB(12, 12, 12); Instance.new("UICorner", ID).CornerRadius = UDim.new(0, 10); local IDS = Instance.new("UIStroke", ID); IDS.Color = MainColor; IDS.Thickness = 1.5

-- مربع الصورة (الفارغ كما طلبت)
local PicBox = Instance.new("Frame", Home); PicBox.Size = UDim2.new(1, -285, 0, 210); PicBox.Position = UDim2.new(0, 255, 0, 25); PicBox.BackgroundColor3 = Color3.fromRGB(12, 12, 12); Instance.new("UICorner", PicBox).CornerRadius = UDim.new(0, 10); local PIS = Instance.new("UIStroke", PicBox); PIS.Color = MainColor; PIS.Thickness = 1.5

-- بيانات اللاعب
local Av = Instance.new("ImageLabel", ID); Av.Size = UDim2.new(0, 60, 0, 60); Av.Position = UDim2.new(0, 15, 0, 15); Av.Image = "rbxthumb://type=AvatarHeadShot&id="..LP.UserId.."&w=150&h=150"; Instance.new("UICorner", Av).CornerRadius = UDim.new(0, 8)
local DN = Instance.new("TextLabel", ID); DN.Text = LP.DisplayName; DN.Size = UDim2.new(0, 120, 0, 20); DN.Position = UDim2.new(0, 85, 0, 20); DN.BackgroundTransparency = 1; DN.TextColor3 = Color3.new(1,1,1); DN.Font = "GothamBold"; DN.TextSize = 12; DN.TextXAlignment = "Left"
local Rank = Instance.new("TextLabel", ID); Rank.Text = "RANK: OWNER"; Rank.Size = UDim2.new(0, 120, 0, 20); Rank.Position = UDim2.new(0, 85, 0, 40); Rank.BackgroundTransparency = 1; Rank.TextColor3 = MainColor; Rank.Font = "GothamBold"; Rank.TextSize = 10; Rank.TextXAlignment = "Left"

local Time = Instance.new("TextLabel", ID); Time.Position = UDim2.new(0, 15, 0, 140); Time.Size = UDim2.new(1, -30, 0, 20); Time.BackgroundTransparency = 1; Time.TextColor3 = MainColor; Time.Font = "GothamBold"; Time.TextSize = 10; Time.TextXAlignment = "Left"

-- [[ الأزرار السفلية ]] --
local function Btn(n, p, s)
    local b = Instance.new("TextButton", Home); b.Size = s; b.Position = p; b.BackgroundColor3 = Color3.fromRGB(15, 15, 15); b.Text = n; b.TextColor3 = Color3.new(1,1,1); b.Font = "GothamBold"; b.TextSize = 10; Instance.new("UICorner", b).CornerRadius = UDim.new(0, 8); local st = Instance.new("UIStroke", b); st.Color = MainColor; return b
end
Btn("CONFIG", UDim2.new(0, 25, 0, 255), UDim2.new(0, 100, 0, 48))
Btn("SETTINGS", UDim2.new(0, 140, 0, 255), UDim2.new(0, 100, 0, 48))
Btn("ADVERTISEMENT", UDim2.new(0, 255, 0, 255), UDim2.new(1, -280, 0, 48))

task.spawn(function()
    local start = os.time()
    while task.wait(1) do
        local diff = os.time() - start
        Time.Text = "SESSION: " .. string.format("%02d:%02d:%02d", math.floor(diff/3600), math.floor((diff%3600)/60), diff%60)
    end
end)
