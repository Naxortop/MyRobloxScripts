-- [[ NAXOR PRO UI V20.0 - CAMERA FIXED & SMOOTH DRAG ]] --

local Players = game:GetService("Players")
local LP = Players.LocalPlayer
local PlayerGui = LP:WaitForChild("PlayerGui")
local UIS = game:GetService("UserInputService")
local TS = game:GetService("TweenService")

if PlayerGui:FindFirstChild("Naxor_System") then PlayerGui.Naxor_System:Destroy() end

local Screen = Instance.new("ScreenGui", PlayerGui)
Screen.Name = "Naxor_System"; Screen.ResetOnSpawn = false

local MainColor = Color3.fromRGB(220, 220, 220)

-- [[ 1. وظيفة السحب الذكي (تمنع تحرك الكاميرا) ]] --
local function MakeDraggable(obj)
    local dragging, dragInput, dragStart, startPos
    
    obj.InputBegan:Connect(function(input)
        if (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) then
            dragging = true
            dragStart = input.Position
            startPos = obj.Position
            
            -- منع الكاميرا من التحرك
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragging = false
                end
            end)
        end
    end)

    obj.InputChanged:Connect(function(input)
        if (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
            dragInput = input
        end
    end)

    UIS.InputChanged:Connect(function(input)
        if input == dragInput and dragging then
            local delta = input.Position - dragStart
            obj.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
        end
    end)
end

-- [[ 2. الزر العائم ]] --
local ToggleBtn = Instance.new("ImageButton", Screen)
ToggleBtn.Size = UDim2.new(0, 50, 0, 50); ToggleBtn.Position = UDim2.new(0, 50, 0.5, -25)
ToggleBtn.BackgroundColor3 = Color3.fromRGB(15, 15, 15); ToggleBtn.Visible = false
ToggleBtn.Image = "rbxassetid://18443200213" -- أيقونة الزر
Instance.new("UICorner", ToggleBtn).CornerRadius = UDim.new(1, 0)
local BtnStroke = Instance.new("UIStroke", ToggleBtn); BtnStroke.Color = MainColor; BtnStroke.Thickness = 2
MakeDraggable(ToggleBtn)

-- [[ 3. الواجهة الرئيسية ]] --
local Main = Instance.new("Frame", Screen)
Main.Size = UDim2.new(0, 560, 0, 390); Main.Position = UDim2.new(0.5, -280, 0.5, -195)
Main.BackgroundColor3 = Color3.fromRGB(8, 8, 8); Main.ClipsDescendants = true; Main.Active = true
Instance.new("UICorner", Main).CornerRadius = UDim.new(0, 15)
local MainStroke = Instance.new("UIStroke", Main); MainStroke.Color = MainColor; MainStroke.Thickness = 2
MakeDraggable(Main)

-- [[ 4. نظام الصفحات والخط النيون ]] --
local Header = Instance.new("Frame", Main); Header.Size = UDim2.new(1, 0, 0, 65); Header.BackgroundTransparency = 1
local NeonLine = Instance.new("Frame", Main); NeonLine.Size = UDim2.new(1, 0, 0, 2); NeonLine.Position = UDim2.new(0, 0, 0, 65); NeonLine.BackgroundColor3 = MainColor; Instance.new("UIStroke", NeonLine).Color = MainColor

local PagesCont = Instance.new("Frame", Main); PagesCont.Size = UDim2.new(1, 0, 1, -70); PagesCont.Position = UDim2.new(0, 0, 0, 70); PagesCont.BackgroundTransparency = 1
local P = { Home = Instance.new("Frame", PagesCont), Pages = Instance.new("Frame", PagesCont), Credits = Instance.new("Frame", PagesCont) }
for n, f in pairs(P) do f.Size = UDim2.new(1, 0, 1, 0); f.BackgroundTransparency = 1; f.Visible = (n == "Home") end

local Nav = Instance.new("Frame", Header); Nav.Size = UDim2.new(0, 200, 1, 0); Nav.Position = UDim2.new(1, -250, 0, 0); Nav.BackgroundTransparency = 1
local Underline = Instance.new("Frame", Nav); Underline.Size = UDim2.new(0, 40, 0, 2); Underline.Position = UDim2.new(0, 10, 0, 45); Underline.BackgroundColor3 = MainColor

local function SetPage(txt, x, target)
    local b = Instance.new("TextButton", Nav)
    b.Text = txt; b.Size = UDim2.new(0, 60, 1, 0); b.Position = UDim2.new(0, x, 0, 0); b.BackgroundTransparency = 1
    b.TextColor3 = (txt == "Home" and Color3.new(1,1,1) or Color3.fromRGB(150,150,150))
    b.Font = "GothamBold"; b.TextSize = 12
    b.MouseButton1Click:Connect(function()
        for name, frame in pairs(P) do frame.Visible = (name == target) end
        TS:Create(Underline, TweenInfo.new(0.3), {Position = UDim2.new(0, x+10, 0, 45)}):Play()
        for _, btn in pairs(Nav:GetChildren()) do if btn:IsA("TextButton") then btn.TextColor3 = Color3.fromRGB(150,150,150) end end
        b.TextColor3 = Color3.new(1,1,1)
    end)
end
SetPage("Home", 0, "Home"); SetPage("Pages", 65, "Pages"); SetPage("Credits", 130, "Credits")

-- [[ 5. الفتح والإغلاق السلس ]] --
local function Toggle(open)
    if open then
        Main.Visible = true
        Main:TweenPosition(UDim2.new(0.5, -280, 0.5, -195), "Out", "Quart", 0.4, true)
        ToggleBtn.Visible = false
    else
        Main:TweenPosition(UDim2.new(0.5, -280, 1, 50), "In", "Quart", 0.4, true, function() 
            Main.Visible = false 
            ToggleBtn.Visible = true
        end)
    end
end

ToggleBtn.MouseButton1Click:Connect(function() Toggle(true) end)
local CloseBtn = Instance.new("TextButton", Header); CloseBtn.Text = "X"; CloseBtn.Size = UDim2.new(0, 30, 0, 30); CloseBtn.Position = UDim2.new(1, -40, 0, 17); CloseBtn.BackgroundTransparency = 1; CloseBtn.TextColor3 = MainColor; CloseBtn.Font = "GothamBold"; CloseBtn.MouseButton1Click:Connect(function() Toggle(false) end)

-- [[ محتوى HOME (بياناتك كاملة) ]] --
local ID = Instance.new("Frame", P.Home); ID.Size = UDim2.new(0, 215, 0, 210); ID.Position = UDim2.new(0, 25, 0, 15); ID.BackgroundColor3 = Color3.fromRGB(12, 12, 12); Instance.new("UICorner", ID); Instance.new("UIStroke", ID).Color = Color3.fromRGB(100, 100, 100)
local DN = Instance.new("TextLabel", ID); DN.Text = "Cheakingscript"; DN.Position = UDim2.new(0, 85, 0, 20); DN.Size = UDim2.new(0, 120, 0, 20); DN.TextColor3 = Color3.new(1, 1, 1); DN.Font = "GothamBold"; DN.TextSize = 12; DN.TextXAlignment = "Left"; DN.BackgroundTransparency = 1
local RT = Instance.new("TextLabel", ID); RT.Text = "OWNER"; RT.Size = UDim2.new(0, 60, 0, 18); RT.Position = UDim2.new(0, 85, 0, 45); RT.TextColor3 = MainColor; RT.Font = "GothamBold"; RT.TextSize = 10; RT.TextXAlignment = "Left"; RT.BackgroundTransparency = 1
local PicBox = Instance.new("Frame", P.Home); PicBox.Size = UDim2.new(1, -285, 0, 210); PicBox.Position = UDim2.new(0, 255, 0, 15); PicBox.BackgroundColor3 = Color3.fromRGB(12, 12, 12); Instance.new("UICorner", PicBox); Instance.new("UIStroke", PicBox).Color = Color3.fromRGB(100, 100, 100)
