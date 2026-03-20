-- [[ NAXOR V4 - THE ULTIMATE INTEGRATION ]] --

local Players = game:GetService("Players")
local LP = Players.LocalPlayer
local PlayerGui = LP:WaitForChild("PlayerGui")
local UIS = game:GetService("UserInputService")
local TS = game:GetService("TweenService")

-- [1] تنظيف البيئة
for _, v in pairs(PlayerGui:GetChildren()) do
    if v.Name == "Naxor_Official_V4" then v:Destroy() end
end

local MainColor = Color3.fromRGB(255, 0, 50)
local BGColor = Color3.fromRGB(15, 15, 15)

-- [2] الواجهة الأساسية
local Screen = Instance.new("ScreenGui", PlayerGui)
Screen.Name = "Naxor_Official_V4"
Screen.ZIndexBehavior = Enum.ZIndexBehavior.Global

local Main = Instance.new("Frame", Screen)
Main.Size = UDim2.new(0, 550, 0, 380)
Main.Position = UDim2.new(0.5, -275, 0.5, -190)
Main.BackgroundColor3 = BGColor
Main.BorderSizePixel = 0
Instance.new("UICorner", Main).CornerRadius = UDim.new(0, 15)
local MainStroke = Instance.new("UIStroke", Main); MainStroke.Thickness = 2.5; MainStroke.Color = MainColor

-- [3] نظام السحب الآمن (يمنع الـ false)
local dragging, dragInput, dragStart, startPos
Main.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true; dragStart = input.Position; startPos = Main.Position
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then dragging = false end
        end)
    end
end)
UIS.InputChanged:Connect(function(input)
    if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
        local delta = input.Position - dragStart
        Main.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
end)

-- [4] الهيدر (Logo & Tabs)
local Logo = Instance.new("TextLabel", Main)
Logo.Text = "N.X.R >>>"; Logo.Size = UDim2.new(0, 150, 0, 50); Logo.Position = UDim2.new(0, 25, 0, 5)
Logo.BackgroundTransparency = 1; Logo.TextColor3 = Color3.new(1, 1, 1); Logo.TextSize = 26; Logo.Font = "GothamBold"; Logo.TextXAlignment = "Left"

local TabHolder = Instance.new("Frame", Main)
TabHolder.Size = UDim2.new(0, 250, 0, 40); TabHolder.Position = UDim2.new(1, -275, 0, 10); TabHolder.BackgroundTransparency = 1

local TabLine = Instance.new("Frame", TabHolder)
TabLine.Size = UDim2.new(0, 40, 0, 2); TabLine.Position = UDim2.new(0, 15, 1, -5); TabLine.BackgroundColor3 = MainColor; TabLine.BorderSizePixel = 0

local function CreateTab(name, x, isHome)
    local b = Instance.new("TextButton", TabHolder)
    b.Size = UDim2.new(0, 70, 1, 0); b.Position = UDim2.new(0, x, 0, 0); b.BackgroundTransparency = 1
    b.Text = name; b.TextColor3 = isHome and MainColor or Color3.fromRGB(200, 200, 200); b.TextSize = 16; b.Font = "GothamBold"
    return b
end

local HomeBtn = CreateTab("Home", 0, true)
local PagesBtn = CreateTab("Pages", 80, false)
local CreditsBtn = CreateTab("Credits", 160, false)

-- [5] حاويات الصفحات
local HomePage = Instance.new("Frame", Main); HomePage.Size = UDim2.new(1, -40, 1, -145); HomePage.Position = UDim2.new(0, 20, 0, 65); HomePage.BackgroundTransparency = 1; HomePage.Visible = true
local PagesPage = Instance.new("Frame", Main); PagesPage.Size = HomePage.Size; PagesPage.Position = HomePage.Position; PagesPage.BackgroundTransparency = 1; PagesPage.Visible = false

-- [6] تصميم الهوم (النصفين - Stats & Image)
-- النصف الأيسر (Stats)
local StatBox = Instance.new("Frame", HomePage); StatBox.Size = UDim2.new(0, 190, 1, 0); StatBox.BackgroundColor3 = Color3.fromRGB(12, 12, 12)
Instance.new("UICorner", StatBox).CornerRadius = UDim.new(0, 12); local sS = Instance.new("UIStroke", StatBox); sS.Color = MainColor; sS.Thickness = 1.5

local pImg = Instance.new("ImageLabel", StatBox); pImg.Size = UDim2.new(0, 75, 0, 75); pImg.Position = UDim2.new(0.5, -37, 0, 15); pImg.Image = "rbxthumb://type=AvatarHeadShot&id="..LP.UserId.."&w=150&h=150"; Instance.new("UICorner", pImg).CornerRadius = UDim.new(1, 0)

local function AddStat(txt, y, col)
    local l = Instance.new("TextLabel", StatBox); l.Text = txt; l.Size = UDim2.new(1, -20, 0, 20); l.Position = UDim2.new(0, 10, 0, y)
    l.BackgroundTransparency = 1; l.TextColor3 = col or Color3.new(1, 1, 1); l.TextSize = 12; l.Font = "GothamMedium"; l.TextXAlignment = "Left"
end
AddStat("USER: "..LP.Name:upper(), 105)
AddStat("STATUS: ONLINE", 130, Color3.fromRGB(0, 255, 100))
AddStat("VERSION: 4.0.0", 155)
AddStat("N.X.R HUB ACTIVE", 185, MainColor)

-- النصف الأيمن (ساحة الصورة)
local ImageBox = Instance.new("Frame", HomePage); ImageBox.Size = UDim2.new(1, -210, 1, 0); ImageBox.Position = UDim2.new(0, 210, 0, 0); ImageBox.BackgroundColor3 = Color3.fromRGB(12, 12, 12)
Instance.new("UICorner", ImageBox).CornerRadius = UDim.new(0, 12); local iS = Instance.new("UIStroke", ImageBox); iS.Color = MainColor; iS.Thickness = 1.5

local PlaceholderText = Instance.new("TextLabel", ImageBox)
PlaceholderText.Text = "IMAGE AREA\n(PLACEHOLDER)"; PlaceholderText.Size = UDim2.new(1,0,1,0); PlaceholderText.BackgroundTransparency = 1; PlaceholderText.TextColor3 = Color3.fromRGB(50,50,50); PlaceholderText.TextSize = 18; PlaceholderText.Font = "GothamBold"

-- [7] الأزرار السفلية
local function CreateBottom(name, x)
    local b = Instance.new("TextButton", Main); b.Size = UDim2.new(0, 160, 0, 70); b.Position = UDim2.new(0, x, 1, -85); b.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    b.Text = name; b.TextColor3 = Color3.new(1, 1, 1); b.Font = "GothamBold"; b.TextSize = 14; Instance.new("UICorner", b).CornerRadius = UDim.new(0, 10)
    Instance.new("UIStroke", b).Color = Color3.fromRGB(40, 40, 40)
    return b
end
CreateBottom("CONFIG", 20)
CreateBottom("SETTING", 195)
CreateBottom("AD (إعلان)", 370)

-- [8] شريط الزينة السفلي
local DecoBar = Instance.new("Frame", Main); DecoBar.Size = UDim2.new(0, 150, 0, 4); DecoBar.Position = UDim2.new(0.5, -75, 1, -10); DecoBar.BackgroundColor3 = Color3.new(1,1,1); DecoBar.BackgroundTransparency = 0.6; Instance.new("UICorner", DecoBar).CornerRadius = UDim.new(1,0)

print("Naxor V4: Integration Complete. No Errors.")
