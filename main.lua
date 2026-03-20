-- [[ NAXOR V4 - THE MASTERPIECE FINAL VERSION - NO ERRORS ]] --

local Players = game:GetService("Players")
local LP = Players.LocalPlayer
local PlayerGui = LP:WaitForChild("PlayerGui")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")

-- [1] تنظيف أي نسخة قديمة
if PlayerGui:FindFirstChild("Naxor_Official_V4") then
    PlayerGui.Naxor_Official_V4:Destroy()
end

-- [2] حاوية الشاشة
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "Naxor_Official_V4"
ScreenGui.Parent = PlayerGui
ScreenGui.ResetOnSpawn = false
ScreenGui.DisplayOrder = 99999

-- متغيرات الألوان (RGB)
local Val_R, Val_G, Val_B = 255, 0, 50

-- [3] اللوحة الرئيسية
local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Parent = ScreenGui
MainFrame.Size = UDim2.new(0, 480, 0, 340)
MainFrame.Position = UDim2.new(0.5, -240, 0.5, -170)
MainFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
MainFrame.Active = true
MainFrame.Draggable = true 
Instance.new("UICorner", MainFrame).CornerRadius = UDim.new(0, 12)

local MainStroke = Instance.new("UIStroke", MainFrame)
MainStroke.Thickness = 2.5
MainStroke.Color = Color3.fromRGB(Val_R, Val_G, Val_B)

-- [4] العنوان العلوي N.X.R
local LogoLabel = Instance.new("TextLabel", MainFrame)
LogoLabel.RichText = true
LogoLabel.Text = "N.X.R <font color='#FF0032'>>>> </font>"
LogoLabel.Size = UDim2.new(0, 150, 0, 50)
LogoLabel.Position = UDim2.new(0, 20, 0, 5)
LogoLabel.BackgroundTransparency = 1
LogoLabel.TextColor3 = Color3.new(1, 1, 1)
LogoLabel.TextSize = 24
LogoLabel.Font = "GothamBold"
LogoLabel.TextXAlignment = "Left"

-- [5] الخط المتحرك
local TabIndicator = Instance.new("Frame", MainFrame)
TabIndicator.Size = UDim2.new(0, 35, 0, 2)
TabIndicator.Position = UDim2.new(1, -90, 0, 47)
TabIndicator.BackgroundColor3 = Color3.fromRGB(Val_R, Val_G, Val_B)
TabIndicator.BorderSizePixel = 0

-- [6] إنشاء الصفحات
local HomePage = Instance.new("Frame", MainFrame)
HomePage.Name = "HomePage"; HomePage.Size = UDim2.new(1, 0, 1, 0); HomePage.BackgroundTransparency = 1; HomePage.Visible = true

local PagesPage = Instance.new("Frame", MainFrame)
PagesPage.Name = "PagesPage"; PagesPage.Size = UDim2.new(1, 0, 1, 0); PagesPage.BackgroundTransparency = 1; PagesPage.Visible = false

local SettingsPage = Instance.new("Frame", MainFrame)
SettingsPage.Name = "SettingsPage"; SettingsPage.Size = UDim2.new(1, 0, 1, 0); SettingsPage.BackgroundTransparency = 1; SettingsPage.Visible = false

-- [7] محتويات الهوم (التايمر والمعلومات)
local InfoLabel = Instance.new("TextLabel", HomePage)
InfoLabel.Size = UDim2.new(0, 180, 0, 110); InfoLabel.Position = UDim2.new(0, 20, 0, 130); InfoLabel.BackgroundTransparency = 1; InfoLabel.TextColor3 = Color3.new(1,1,1); InfoLabel.TextSize = 13; InfoLabel.Font = "GothamBold"; InfoLabel.TextXAlignment = "Left"

local ShowFPS = true
local StartTime = tick()
RunService.RenderStepped:Connect(function()
    local FPS = math.floor(1 / RunService.RenderStepped:Wait())
    local TimeStr = string.format("%02d:%02d:%02d", math.floor((tick()-StartTime)/3600), math.floor(((tick()-StartTime)%3600)/60), math.floor((tick()-StartTime)%60))
    InfoLabel.Text = "USER: "..LP.Name:upper().."\nSTATUS: ONLINE"..(ShowFPS and "\nFPS: "..FPS or "\nFPS: HIDDEN").."\nTIME: "..TimeStr.."\nN.X.R ACTIVE"
end)

local CenterBox = Instance.new("Frame", HomePage)
CenterBox.Size = UDim2.new(0, 285, 0, 185); CenterBox.Position = UDim2.new(0, 180, 0, 65); CenterBox.BackgroundColor3 = Color3.fromRGB(12, 12, 12)
Instance.new("UICorner", CenterBox).CornerRadius = UDim.new(0, 10)
local CBStroke = Instance.new("UIStroke", CenterBox); CBStroke.Thickness = 1.5; CBStroke.Color = Color3.fromRGB(Val_R, Val_G, Val_B)

-- [8] نظام اختيار الألوان (RGB Sliders)
local SettingsTitle = Instance.new("TextLabel", SettingsPage)
SettingsTitle.Text = "CUSTOM THEME CONTROL"; SettingsTitle.Size = UDim2.new(0, 200, 0, 30); SettingsTitle.Position = UDim2.new(0, 20, 0, 65); SettingsTitle.BackgroundTransparency = 1; SettingsTitle.TextColor3 = Color3.fromRGB(Val_R, Val_G, Val_B); SettingsTitle.TextSize = 18; SettingsTitle.Font = "GothamBold"; SettingsTitle.TextXAlignment = "Left"

local function UpdateColors()
    local C = Color3.fromRGB(Val_R, Val_G, Val_B)
    MainStroke.Color = C; TabIndicator.BackgroundColor3 = C; CBStroke.Color = C; SettingsTitle.TextColor3 = C
    LogoLabel.Text = "N.X.R <font color='#"..C:ToHex().."'> >>> </font>"
end

local function MakeSlider(name, col, order)
    local SFrame = Instance.new("Frame", SettingsPage)
    SFrame.Size = UDim2.new(0, 250, 0, 35); SFrame.Position = UDim2.new(0, 20, 0, 100 + (order * 40)); SFrame.BackgroundColor3 = Color3.fromRGB(22, 22, 22)
    Instance.new("UICorner", SFrame).CornerRadius = UDim.new(0, 6)
    
    local T = Instance.new("TextLabel", SFrame); T.Text = name; T.Size = UDim2.new(0, 30, 1, 0); T.BackgroundTransparency = 1; T.TextColor3 = col; T.Font = "GothamBold"
    local Bar = Instance.new("Frame", SFrame); Bar.Size = UDim2.new(0, 180, 0, 4); Bar.Position = UDim2.new(0, 40, 0.5, -2); Bar.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    local Dot = Instance.new("TextButton", Bar); Dot.Size = UDim2.new(0, 14, 0, 14); Dot.Position = UDim2.new(0.5, -7, 0.5, -7); Dot.BackgroundColor3 = col; Dot.Text = ""; Instance.new("UICorner", Dot).CornerRadius = UDim.new(1, 0)

    local Drag = false
    Dot.MouseButton1Down:Connect(function() Drag = true end)
    UserInputService.InputEnded:Connect(function(i) if i.UserInputType == Enum.UserInputType.MouseButton1 then Drag = false end end)
    
    RunService.RenderStepped:Connect(function()
        if Drag then
            local MouseX = UserInputService:GetMouseLocation().X
            local Percent = math.clamp((MouseX - Bar.AbsolutePosition.X) / Bar.AbsoluteSize.X, 0, 1)
            Dot.Position = UDim2.new(Percent, -7, 0.5, -7)
            local V = math.floor(Percent * 255)
            if name == "R" then Val_R = V elseif name == "G" then Val_G = V elseif name == "B" then Val_B = V end
            UpdateColors()
        end
    end)
end

MakeSlider("R", Color3.fromRGB(255, 0, 0), 0)
MakeSlider("G", Color3.fromRGB(0, 255, 0), 1)
MakeSlider("B", Color3.fromRGB(0, 150, 255), 2)

-- [9] أزرار التنقل (مبرمجة بدقة لتفادي الأخطاء)
local BottomContainer = Instance.new("Frame", HomePage) -- حاوية لضمان الاختفاء الكامل
BottomContainer.Size = UDim2.new(1, 0, 0, 80); BottomContainer.Position = UDim2.new(0, 0, 0, 260); BottomContainer.BackgroundTransparency = 1

local function CreateBtn(parent, text, pos, x)
    local b = Instance.new("TextButton", parent); b.Size = UDim2.new(0, 148, 0, 70); b.Position = pos; b.BackgroundColor3 = Color3.fromRGB(22, 22, 22); b.Text = text; b.TextColor3 = Color3.new(1,1,1); b.Font = "GothamBold"; Instance.new("UICorner", b).CornerRadius = UDim.new(0, 8)
    return b
end

local ConfigBtn = CreateBtn(BottomContainer, "CONFIG", UDim2.new(0, 10, 0, 0))
local SettingBtn = CreateBtn(BottomContainer, "SETTING", UDim2.new(0, 165, 0, 0))
local AdBtn = CreateBtn(BottomContainer, "AD", UDim2.new(0, 322, 0, 0))

local HomeBtn = Instance.new("TextButton", MainFrame)
HomeBtn.Size = UDim2.new(0, 35, 0, 35); HomeBtn.Position = UDim2.new(1, -90, 0, 12); HomeBtn.Text = "🏠"; HomeBtn.BackgroundColor3 = Color3.fromRGB(25, 25, 25); HomeBtn.TextColor3 = Color3.new(1,1,1); Instance.new("UICorner", HomeBtn).CornerRadius = UDim.new(0, 8)

local PagesBtn = Instance.new("TextButton", MainFrame)
PagesBtn.Size = UDim2.new(0, 35, 0, 35); PagesBtn.Position = UDim2.new(1, -45, 0, 12); PagesBtn.Text = "📄"; PagesBtn.BackgroundColor3 = Color3.fromRGB(25, 25, 25); PagesBtn.TextColor3 = Color3.new(1,1,1); Instance.new("UICorner", PagesBtn).CornerRadius = UDim.new(0, 8)

-- وظيفة التنقل الصارمة
HomeBtn.MouseButton1Click:Connect(function()
    HomePage.Visible = true; PagesPage.Visible = false; SettingsPage.Visible = false
    TweenService:Create(TabIndicator, TweenInfo.new(0.3), {Position = UDim2.new(1, -90, 0, 47)}):Play()
end)

PagesBtn.MouseButton1Click:Connect(function()
    HomePage.Visible = false; PagesPage.Visible = true; SettingsPage.Visible = false
    TweenService:Create(TabIndicator, TweenInfo.new(0.3), {Position = UDim2.new(1, -45, 0, 47)}):Play()
end)

SettingBtn.MouseButton1Click:Connect(function()
    HomePage.Visible = false; PagesPage.Visible = false; SettingsPage.Visible = true
    TweenService:Create(TabIndicator, TweenInfo.new(0.3), {Position = UDim2.new(1, -67, 0, 47)}):Play()
end)

-- [10] الزر العائم
local Toggle = Instance.new("TextButton", ScreenGui); Toggle.Size = UDim2.new(0, 55, 0, 55); Toggle.Position = UDim2.new(1, -70, 0, 20); Toggle.BackgroundColor3 = Color3.fromRGB(15, 15, 15); Toggle.Text = "NXR"; Toggle.TextColor3 = Color3.fromRGB(255, 0, 50); Toggle.Font = "GothamBold"; Toggle.Draggable = true; Instance.new("UICorner", Toggle).CornerRadius = UDim.new(1, 0); local TS = Instance.new("UIStroke", Toggle); TS.Color = Color3.fromRGB(255, 0, 50); TS.Thickness = 3
Toggle.MouseButton1Click:Connect(function() MainFrame.Visible = not MainFrame.Visible end)

local Unload = Instance.new("TextButton", SettingsPage)
Unload.Text = "UNLOAD"; Unload.Size = UDim2.new(0, 100, 0, 35); Unload.Position = UDim2.new(0, 20, 0, 230); Unload.BackgroundColor3 = Color3.fromRGB(80, 0, 0); Unload.TextColor3 = Color3.new(1,1,1); Unload.Font = "GothamBold"; Instance.new("UICorner", Unload).CornerRadius = UDim.new(0, 6)
Unload.MouseButton1Click:Connect(function() ScreenGui:Destroy() end)
