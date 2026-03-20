-- [[ NAXOR ULTIMATE RESTORE V21.0 - NO MISSING DETAILS ]] --

local Players = game:GetService("Players")
local LP = Players.LocalPlayer
local PlayerGui = LP:WaitForChild("PlayerGui")
local UIS = game:GetService("UserInputService")
local TS = game:GetService("TweenService")

if PlayerGui:FindFirstChild("Naxor_Final") then PlayerGui.Naxor_Final:Destroy() end

local Screen = Instance.new("ScreenGui", PlayerGui)
Screen.Name = "Naxor_Final"; Screen.ResetOnSpawn = false

local MainColor = Color3.fromRGB(220, 220, 220)

-- [[ نظام السحب اللي يثبت الكاميرا ]] --
local function Drag(obj)
    local dragging, dragInput, dragStart, startPos
    obj.InputBegan:Connect(function(input)
        if (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) then
            dragging = true; dragStart = input.Position; startPos = obj.Position
        end
    end)
    UIS.InputChanged:Connect(function(input)
        if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
            local delta = input.Position - dragStart
            obj.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
        end
    end)
    UIS.InputEnded:Connect(function(input) if input.UserInputType == Enum.UserInputType.MouseButton1 then dragging = false end end)
end

-- [[ 1. الزر العائم (يختفي ويظهر) ]] --
local ToggleBtn = Instance.new("ImageButton", Screen)
ToggleBtn.Size = UDim2.new(0, 55, 0, 55); ToggleBtn.Position = UDim2.new(0, 50, 0.5, -25)
ToggleBtn.BackgroundColor3 = Color3.fromRGB(15, 15, 15); ToggleBtn.Visible = false
ToggleBtn.Image = "rbxassetid://18443200213" -- أيقونة النينجا
Instance.new("UICorner", ToggleBtn).CornerRadius = UDim.new(1, 0)
local BTNStroke = Instance.new("UIStroke", ToggleBtn); BTNStroke.Color = MainColor; Drag(ToggleBtn)

-- [[ 2. الواجهة الرئيسية ]] --
local Main = Instance.new("Frame", Screen)
Main.Size = UDim2.new(0, 560, 0, 390); Main.Position = UDim2.new(0.5, -280, 0.5, -195)
Main.BackgroundColor3 = Color3.fromRGB(8, 8, 8); Main.Active = true; Main.ClipsDescendants = true
Instance.new("UICorner", Main).CornerRadius = UDim.new(0, 15)
local MainStroke = Instance.new("UIStroke", Main); MainStroke.Color = MainColor; MainStroke.Thickness = 2; Drag(Main)

-- [[ 3. الهيدر والصفحات ]] --
local Header = Instance.new("Frame", Main); Header.Size = UDim2.new(1, 0, 0, 65); Header.BackgroundTransparency = 1
local Logo = Instance.new("TextLabel", Header); Logo.Text = "N.X.R >>>"; Logo.Position = UDim2.new(0, 25, 0, 0); Logo.Size = UDim2.new(0, 100, 1, 0); Logo.TextColor3 = Color3.new(1,1,1); Logo.Font = "GothamBold"; Logo.TextSize = 20; Logo.BackgroundTransparency = 1; Logo.TextXAlignment = "Left"

-- خط النيون الفاصل
local Neon = Instance.new("Frame", Main); Neon.Size = UDim2.new(1, 0, 0, 1); Neon.Position = UDim2.new(0, 0, 0, 65); Neon.BackgroundColor3 = MainColor; Neon.BorderSizePixel = 0
local NeonGlow = Instance.new("UIStroke", Neon); NeonGlow.Color = MainColor; NeonGlow.Thickness = 1.5

-- محتويات الصفحات
local PagesCont = Instance.new("Frame", Main); PagesCont.Size = UDim2.new(1, 0, 1, -70); PagesCont.Position = UDim2.new(0, 0, 0, 70); PagesCont.BackgroundTransparency = 1
local P = { Home = Instance.new("Frame", PagesCont), Pages = Instance.new("Frame", PagesCont), Credits = Instance.new("Frame", PagesCont) }
for n, f in pairs(P) do f.Size = UDim2.new(1, 0, 1, 0); f.BackgroundTransparency = 1; f.Visible = (n == "Home") end

-- الأزرار العلوية والخط المتحرك
local Nav = Instance.new("Frame", Header); Nav.Size = UDim2.new(0, 200, 1, 0); Nav.Position = UDim2.new(1, -250, 0, 0); Nav.BackgroundTransparency = 1
local Underline = Instance.new("Frame", Nav); Underline.Size = UDim2.new(0, 35, 0, 2); Underline.Position = UDim2.new(0, 12, 0, 42); Underline.BackgroundColor3 = MainColor

local function NavLogic(txt, x, target)
    local b = Instance.new("TextButton", Nav); b.Text = txt; b.Size = UDim2.new(0, 60, 1, 0); b.Position = UDim2.new(0, x, 0, 0); b.BackgroundTransparency = 1
    b.TextColor3 = (txt == "Home" and Color3.new(1,1,1) or Color3.fromRGB(150,150,150)); b.Font = "GothamBold"; b.TextSize = 12
    b.MouseButton1Click:Connect(function()
        for name, frame in pairs(P) do frame.Visible = (name == target) end
        TS:Create(Underline, TweenInfo.new(0.3), {Position = UDim2.new(0, x+12, 0, 42)}):Play()
        for _, btn in pairs(Nav:GetChildren()) do if btn:IsA("TextButton") then btn.TextColor3 = Color3.fromRGB(150,150,150) end end
        b.TextColor3 = Color3.new(1,1,1)
    end)
end
NavLogic("Home", 0, "Home"); NavLogic("Pages", 65, "Pages"); NavLogic("Credits", 130, "Credits")

-- [[ 4. تفاصيل صفحة HOME المفقودة ]] --
local ID = Instance.new("Frame", P.Home); ID.Size = UDim2.new(0, 215, 0, 210); ID.Position = UDim2.new(0, 25, 0, 15); ID.BackgroundColor3 = Color3.fromRGB(12, 12, 12)
Instance.new("UICorner", ID); Instance.new("UIStroke", ID).Color = Color3.fromRGB(100, 100, 100)

local Av = Instance.new("ImageLabel", ID); Av.Size = UDim2.new(0, 60, 0, 60); Av.Position = UDim2.new(0, 15, 0, 15); Av.Image = "rbxthumb://type=AvatarHeadShot&id="..LP.UserId.."&w=150&h=150"; Instance.new("UICorner", Av)
local DN = Instance.new("TextLabel", ID); DN.Text = LP.DisplayName; DN.Position = UDim2.new(0, 85, 0, 22); DN.Size = UDim2.new(0, 120, 0, 20); DN.TextColor3 = Color3.new(1, 1, 1); DN.Font = "GothamBold"; DN.TextSize = 12; DN.TextXAlignment = "Left"; DN.BackgroundTransparency = 1
local UN = Instance.new("TextLabel", ID); UN.Text = "@"..LP.Name; UN.Position = UDim2.new(0, 85, 0, 38); UN.Size = UDim2.new(0, 120, 0, 15); UN.TextColor3 = Color3.fromRGB(150, 150, 150); UN.Font = "GothamBold"; UN.TextSize = 9; UN.TextXAlignment = "Left"; UN.BackgroundTransparency = 1

-- رتبة OWNER بالمربع
local RB = Instance.new("Frame", ID); RB.Size = UDim2.new(0, 50, 0, 18); RB.Position = UDim2.new(0, 85, 0, 58); RB.BackgroundColor3 = Color3.fromRGB(20, 20, 20); Instance.new("UICorner", RB).CornerRadius = UDim.new(0, 4)
local RS = Instance.new("UIStroke", RB); RS.Color = Color3.new(1, 1, 1); RS.Thickness = 0.8
local RT = Instance.new("TextLabel", RB); RT.Size = UDim2.new(1, 0, 1, 0); RT.Text = "OWNER"; RT.TextColor3 = Color3.new(1, 1, 1); RT.TextSize = 8; RT.Font = "GothamBold"; RT.BackgroundTransparency = 1

local PT = Instance.new("TextLabel", ID); PT.Position = UDim2.new(0, 15, 0, 140); PT.Size = UDim2.new(1, -20, 0, 20); PT.TextColor3 = Color3.fromRGB(200, 200, 200); PT.Font = "GothamBold"; PT.TextSize = 10; PT.TextXAlignment = "Left"; PT.BackgroundTransparency = 1
local OL = Instance.new("TextLabel", ID); OL.Position = UDim2.new(0, 28, 1, -30); OL.Size = UDim2.new(1, -40, 0, 20); OL.TextColor3 = Color3.fromRGB(0, 255, 150); OL.Font = "GothamBold"; OL.TextSize = 9; OL.TextXAlignment = "Left"; OL.BackgroundTransparency = 1
local Dot = Instance.new("Frame", ID); Dot.Size = UDim2.new(0, 6, 0, 6); Dot.Position = UDim2.new(0, 15, 1, -23); Dot.BackgroundColor3 = Color3.fromRGB(0, 255, 150); Instance.new("UICorner", Dot).CornerRadius = UDim.new(1, 0)

-- المربع اليمين
local PicBox = Instance.new("Frame", P.Home); PicBox.Size = UDim2.new(1, -285, 0, 210); PicBox.Position = UDim2.new(0, 255, 0, 15); PicBox.BackgroundColor3 = Color3.fromRGB(12, 12, 12); Instance.new("UICorner", PicBox); Instance.new("UIStroke", PicBox).Color = Color3.fromRGB(100, 100, 100)

-- [[ 5. الأزرار السفلية ]] --
local function ActionBtn(txt, x, w)
    local b = Instance.new("TextButton", P.Home); b.Text = txt; b.Size = UDim2.new(0, w, 0, 48); b.Position = UDim2.new(0, x, 0, 240); b.BackgroundColor3 = Color3.fromRGB(15, 15, 15); b.TextColor3 = Color3.new(1, 1, 1); b.Font = "GothamBold"; b.TextSize = 10; Instance.new("UICorner", b); Instance.new("UIStroke", b).Color = Color3.fromRGB(120, 120, 120)
end
ActionBtn("CONFIG", 25, 100); ActionBtn("SETTINGS", 140, 100); ActionBtn("ADVERTISEMENT", 255, 280)

-- [[ التحكم بالفتح والإغلاق ]] --
local function Toggle(s)
    if s then Main.Visible = true; Main:TweenPosition(UDim2.new(0.5, -280, 0.5, -195), "Out", "Quart", 0.4, true); ToggleBtn.Visible = false
    else Main:TweenPosition(UDim2.new(0.5, -280, 1, 50), "In", "Quart", 0.4, true, function() Main.Visible = false; ToggleBtn.Visible = true end) end
end
ToggleBtn.MouseButton1Click:Connect(function() Toggle(true) end)
local Close = Instance.new("TextButton", Header); Close.Text = "X"; Close.Size = UDim2.new(0, 30, 0, 30); Close.Position = UDim2.new(1, -40, 0, 17); Close.BackgroundTransparency = 1; Close.TextColor3 = MainColor; Close.Font = "GothamBold"; Close.MouseButton1Click:Connect(function() Toggle(false) end)

-- [[ المحرك التحديثي ]] --
task.spawn(function()
    local start = os.time()
    while task.wait(1) do
        local diff = os.time() - start
        PT.Text = "PlayTime: " .. string.format("%02d:%02d:%02d", math.floor(diff/3600), math.floor((diff%3600)/60), diff%60)
        OL.Text = math.random(3400, 3600) .. " USERS ONLINE"
        Dot.Visible = not Dot.Visible; task.wait(0.5); Dot.Visible = not Dot.Visible
    end
end)
