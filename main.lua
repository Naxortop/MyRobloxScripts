-- [[ NAXOR V4 - THE SUPREME FULL SOURCE - NO SHORTCUTS ]] --

-- [1] استدعاء الخدمات (Services)
local Players = game:GetService("Players")
local LP = Players.LocalPlayer
local PlayerGui = LP:WaitForChild("PlayerGui")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")

-- [2] تنظيف أي نسخة قديمة موجودة في الشاشة
local OldGui = PlayerGui:FindFirstChild("Naxor_Official_V4")
if OldGui then
    OldGui:Destroy()
end

-- [3] إنشاء حاوية الشاشة الرئيسية (ScreenGui)
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "Naxor_Official_V4"
ScreenGui.Parent = PlayerGui
ScreenGui.ResetOnSpawn = false
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.DisplayOrder = 99999

-- [4] إنشاء اللوحة الرئيسية (Main Frame)
local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Parent = ScreenGui
MainFrame.Size = UDim2.new(0, 480, 0, 340)
MainFrame.Position = UDim2.new(0.5, -240, 0.5, -170)
MainFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
MainFrame.BorderSizePixel = 0
MainFrame.Active = true
MainFrame.Draggable = true 
MainFrame.Visible = true

local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 12)
MainCorner.Parent = MainFrame

local MainStroke = Instance.new("UIStroke")
MainStroke.Name = "MainStroke"
MainStroke.Parent = MainFrame
MainStroke.Color = Color3.fromRGB(255, 0, 50) -- اللون الافتراضي أحمر
MainStroke.Thickness = 2.5
MainStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border

-- [5] العنوان العلوي N.X.R
local LogoLabel = Instance.new("TextLabel")
LogoLabel.Name = "LogoLabel"
LogoLabel.Parent = MainFrame
LogoLabel.Text = "N.X.R <font color='#FF0032'>>>> </font>"
LogoLabel.RichText = true
LogoLabel.Size = UDim2.new(0, 150, 0, 50)
LogoLabel.Position = UDim2.new(0, 20, 0, 5)
LogoLabel.BackgroundTransparency = 1
LogoLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
LogoLabel.TextSize = 24
LogoLabel.Font = Enum.Font.GothamBold
LogoLabel.TextXAlignment = Enum.TextXAlignment.Left

-- [6] الخط الأحمر المتحرك (Tab Indicator)
local TabIndicator = Instance.new("Frame")
TabIndicator.Name = "TabIndicator"
TabIndicator.Parent = MainFrame
TabIndicator.Size = UDim2.new(0, 35, 0, 2)
TabIndicator.Position = UDim2.new(1, -90, 0, 47) -- مكانه تحت الهوم
TabIndicator.BackgroundColor3 = Color3.fromRGB(255, 0, 50)
TabIndicator.BorderSizePixel = 0
TabIndicator.ZIndex = 10

-- [7] إنشاء صفحات الواجهة (Home, Pages, Settings)
local HomePage = Instance.new("Frame")
HomePage.Name = "HomePage"
HomePage.Parent = MainFrame
HomePage.Size = UDim2.new(1, 0, 1, 0)
HomePage.BackgroundTransparency = 1
HomePage.Visible = true

local PagesPage = Instance.new("Frame")
PagesPage.Name = "PagesPage"
PagesPage.Parent = MainFrame
PagesPage.Size = UDim2.new(1, 0, 1, 0)
PagesPage.BackgroundTransparency = 1
PagesPage.Visible = false

local SettingsPage = Instance.new("Frame")
SettingsPage.Name = "SettingsPage"
SettingsPage.Parent = MainFrame
SettingsPage.Size = UDim2.new(1, 0, 1, 0)
SettingsPage.BackgroundTransparency = 1
SettingsPage.Visible = false

-- [8] محتويات صفحة الهوم (HOME CONTENT)
local AvatarImage = Instance.new("ImageLabel")
AvatarImage.Name = "AvatarImage"
AvatarImage.Parent = HomePage
AvatarImage.Size = UDim2.new(0, 60, 0, 60)
AvatarImage.Position = UDim2.new(0, 20, 0, 65)
AvatarImage.Image = "rbxthumb://type=AvatarHeadShot&id="..LP.UserId.."&w=150&h=150"
AvatarImage.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
local AvatarCorner = Instance.new("UICorner", AvatarImage)
AvatarCorner.CornerRadius = UDim.new(0, 8)

local InfoLabel = Instance.new("TextLabel")
InfoLabel.Name = "InfoLabel"
InfoLabel.Parent = HomePage
InfoLabel.Size = UDim2.new(0, 180, 0, 110)
InfoLabel.Position = UDim2.new(0, 20, 0, 130)
InfoLabel.BackgroundTransparency = 1
InfoLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
InfoLabel.TextSize = 13
InfoLabel.Font = Enum.Font.GothamBold
InfoLabel.TextXAlignment = Enum.TextXAlignment.Left

local ShowFPS = true
local StartTime = tick()
RunService.RenderStepped:Connect(function()
    local Elapsed = tick() - StartTime
    local FPS = math.floor(1 / RunService.RenderStepped:Wait())
    local FPSText = ""
    if ShowFPS == true then
        FPSText = "\nFPS: " .. FPS
    else
        FPSText = "\nFPS: HIDDEN"
    end
    local TimeStr = string.format("%02d:%02d:%02d", math.floor(Elapsed/3600), math.floor((Elapsed%3600)/60), math.floor(Elapsed%60))
    InfoLabel.Text = "USER: " .. LP.Name:upper() .. "\nSTATUS: ONLINE" .. FPSText .. "\nTIME: " .. TimeStr .. "\nN.X.R ACTIVE"
end)

local CenterBox = Instance.new("Frame")
CenterBox.Name = "CenterBox"
CenterBox.Parent = HomePage
CenterBox.Size = UDim2.new(0, 285, 0, 185)
CenterBox.Position = UDim2.new(0, 180, 0, 65)
CenterBox.BackgroundColor3 = Color3.fromRGB(12, 12, 12)
local CenterCorner = Instance.new("UICorner", CenterBox)
CenterCorner.CornerRadius = UDim.new(0, 10)
local CenterStroke = Instance.new("UIStroke", CenterBox)
CenterStroke.Name = "CenterStroke"
CenterStroke.Color = Color3.fromRGB(255, 0, 50)
CenterStroke.Thickness = 1.5

-- [9] محتويات صفحة الإعدادات (SETTINGS CONTENT)
local SettingsTitle = Instance.new("TextLabel")
SettingsTitle.Name = "SettingsTitle"
SettingsTitle.Parent = SettingsPage
SettingsTitle.Text = "SYSTEM SETTINGS"
SettingsTitle.Size = UDim2.new(0, 200, 0, 30)
SettingsTitle.Position = UDim2.new(0, 20, 0, 70)
SettingsTitle.BackgroundTransparency = 1
SettingsTitle.TextColor3 = Color3.fromRGB(255, 0, 50)
SettingsTitle.TextSize = 18
SettingsTitle.Font = Enum.Font.GothamBold
SettingsTitle.TextXAlignment = Enum.TextXAlignment.Left

local BlueThemeBtn = Instance.new("TextButton")
BlueThemeBtn.Name = "BlueThemeBtn"
BlueThemeBtn.Parent = SettingsPage
BlueThemeBtn.Text = "BLUE THEME"
BlueThemeBtn.Size = UDim2.new(0, 120, 0, 35)
BlueThemeBtn.Position = UDim2.new(0, 20, 0, 110)
BlueThemeBtn.BackgroundColor3 = Color3.fromRGB(0, 120, 255)
BlueThemeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
BlueThemeBtn.Font = Enum.Font.GothamBold
BlueThemeBtn.TextSize = 12
local BlueCorner = Instance.new("UICorner", BlueThemeBtn)
BlueCorner.CornerRadius = UDim.new(0, 6)

local RedThemeBtn = Instance.new("TextButton")
RedThemeBtn.Name = "RedThemeBtn"
RedThemeBtn.Parent = SettingsPage
RedThemeBtn.Text = "RED THEME (DEF)"
RedThemeBtn.Size = UDim2.new(0, 120, 0, 35)
RedThemeBtn.Position = UDim2.new(0, 150, 0, 110)
RedThemeBtn.BackgroundColor3 = Color3.fromRGB(255, 0, 50)
RedThemeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
RedThemeBtn.Font = Enum.Font.GothamBold
RedThemeBtn.TextSize = 10
local RedCorner = Instance.new("UICorner", RedThemeBtn)
RedCorner.CornerRadius = UDim.new(0, 6)

local FPSToggleBtn = Instance.new("TextButton")
FPSToggleBtn.Name = "FPSToggleBtn"
FPSToggleBtn.Parent = SettingsPage
FPSToggleBtn.Text = "TOGGLE FPS DISPLAY"
FPSToggleBtn.Size = UDim2.new(0, 250, 0, 35)
FPSToggleBtn.Position = UDim2.new(0, 20, 0, 155)
FPSToggleBtn.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
FPSToggleBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
FPSToggleBtn.Font = Enum.Font.GothamBold
local FPSCorner = Instance.new("UICorner", FPSToggleBtn)
FPSCorner.CornerRadius = UDim.new(0, 6)

local DestroyBtn = Instance.new("TextButton")
DestroyBtn.Name = "DestroyBtn"
DestroyBtn.Parent = SettingsPage
DestroyBtn.Text = "DESTROY SCRIPT (UNLOAD)"
DestroyBtn.Size = UDim2.new(0, 250, 0, 35)
DestroyBtn.Position = UDim2.new(0, 20, 0, 200)
DestroyBtn.BackgroundColor3 = Color3.fromRGB(80, 0, 0)
DestroyBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
DestroyBtn.Font = Enum.Font.GothamBold
local DestroyCorner = Instance.new("UICorner", DestroyBtn)
DestroyCorner.CornerRadius = UDim.new(0, 6)

-- برمجة منطق أزرار الإعدادات
BlueThemeBtn.MouseButton1Click:Connect(function()
    MainStroke.Color = Color3.fromRGB(0, 120, 255)
    TabIndicator.BackgroundColor3 = Color3.fromRGB(0, 120, 255)
    CenterStroke.Color = Color3.fromRGB(0, 120, 255)
    LogoLabel.Text = "N.X.R <font color='#0078FF'>>>> </font>"
    SettingsTitle.TextColor3 = Color3.fromRGB(0, 120, 255)
end)

RedThemeBtn.MouseButton1Click:Connect(function()
    MainStroke.Color = Color3.fromRGB(255, 0, 50)
    TabIndicator.BackgroundColor3 = Color3.fromRGB(255, 0, 50)
    CenterStroke.Color = Color3.fromRGB(255, 0, 50)
    LogoLabel.Text = "N.X.R <font color='#FF0032'>>>> </font>"
    SettingsTitle.TextColor3 = Color3.fromRGB(255, 0, 50)
end)

FPSToggleBtn.MouseButton1Click:Connect(function()
    ShowFPS = not ShowFPS
end)

DestroyBtn.MouseButton1Click:Connect(function()
    ScreenGui:Destroy()
end)

-- [10] أزرار التنقل والتحكم (Navigation Buttons)
local HomeBtn = Instance.new("TextButton")
HomeBtn.Name = "HomeBtn"
HomeBtn.Parent = MainFrame
HomeBtn.Size = UDim2.new(0, 35, 0, 35)
HomeBtn.Position = UDim2.new(1, -90, 0, 12)
HomeBtn.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
HomeBtn.Text = "🏠"
HomeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
HomeBtn.TextSize = 18
local HBC = Instance.new("UICorner", HomeBtn)
HBC.CornerRadius = UDim.new(0, 8)

local PagesBtn = Instance.new("TextButton")
PagesBtn.Name = "PagesBtn"
PagesBtn.Parent = MainFrame
PagesBtn.Size = UDim2.new(0, 35, 0, 35)
PagesBtn.Position = UDim2.new(1, -45, 0, 12)
PagesBtn.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
PagesBtn.Text = "📄"
PagesBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
PagesBtn.TextSize = 18
local PBC = Instance.new("UICorner", PagesBtn)
PBC.CornerRadius = UDim.new(0, 8)

local BottomSettingBtn = Instance.new("TextButton")
BottomSettingBtn.Name = "BottomSettingBtn"
BottomSettingBtn.Parent = MainFrame
BottomSettingBtn.Size = UDim2.new(0, 148, 0, 70)
BottomSettingBtn.Position = UDim2.new(0, 165, 0, 260)
BottomSettingBtn.BackgroundColor3 = Color3.fromRGB(22, 22, 22)
BottomSettingBtn.Text = "SETTING"
BottomSettingBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
BottomSettingBtn.Font = Enum.Font.GothamBold
local BSBC = Instance.new("UICorner", BottomSettingBtn)
BSBC.CornerRadius = UDim.new(0, 8)

local BottomConfigBtn = Instance.new("TextButton")
BottomConfigBtn.Name = "BottomConfigBtn"
BottomConfigBtn.Parent = HomePage
BottomConfigBtn.Size = UDim2.new(0, 148, 0, 70)
BottomConfigBtn.Position = UDim2.new(0, 10, 0, 260)
BottomConfigBtn.BackgroundColor3 = Color3.fromRGB(22, 22, 22)
BottomConfigBtn.Text = "CONFIG"
BottomConfigBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
BottomConfigBtn.Font = Enum.Font.GothamBold
local BCBC = Instance.new("UICorner", BottomConfigBtn)
BCBC.CornerRadius = UDim.new(0, 8)

local BottomAdBtn = Instance.new("TextButton")
BottomAdBtn.Name = "BottomAdBtn"
BottomAdBtn.Parent = HomePage
BottomAdBtn.Size = UDim2.new(0, 148, 0, 70)
BottomAdBtn.Position = UDim2.new(0, 322, 0, 260)
BottomAdBtn.BackgroundColor3 = Color3.fromRGB(22, 22, 22)
BottomAdBtn.Text = "AD"
BottomAdBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
BottomAdBtn.Font = Enum.Font.GothamBold
local BABC = Instance.new("UICorner", BottomAdBtn)
BABC.CornerRadius = UDim.new(0, 8)

-- برمجة تبديل الصفحات مع تأثيرات الخط
HomeBtn.MouseButton1Click:Connect(function()
    HomePage.Visible = true
    PagesPage.Visible = false
    SettingsPage.Visible = false
    TweenService:Create(TabIndicator, TweenInfo.new(0.3, Enum.EasingStyle.Quart), {Position = UDim2.new(1, -90, 0, 47)}):Play()
end)

PagesBtn.MouseButton1Click:Connect(function()
    HomePage.Visible = false
    PagesPage.Visible = true
    SettingsPage.Visible = false
    TweenService:Create(TabIndicator, TweenInfo.new(0.3, Enum.EasingStyle.Quart), {Position = UDim2.new(1, -45, 0, 47)}):Play()
end)

BottomSettingBtn.MouseButton1Click:Connect(function()
    HomePage.Visible = false
    PagesPage.Visible = false
    SettingsPage.Visible = true
    TweenService:Create(TabIndicator, TweenInfo.new(0.3, Enum.EasingStyle.Quart), {Position = UDim2.new(1, -67, 0, 47)}):Play()
end)

-- [11] الزر العائم NXR لإخفاء وإظهار الواجهة
local ToggleBtn = Instance.new("TextButton")
ToggleBtn.Name = "ToggleBtn"
ToggleBtn.Parent = ScreenGui
ToggleBtn.Size = UDim2.new(0, 55, 0, 55)
ToggleBtn.Position = UDim2.new(1, -70, 0, 20)
ToggleBtn.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
ToggleBtn.Text = "NXR"
ToggleBtn.TextColor3 = Color3.fromRGB(255, 0, 50)
ToggleBtn.Font = Enum.Font.GothamBold
ToggleBtn.TextSize = 15
ToggleBtn.Draggable = true
local ToggleCorner = Instance.new("UICorner", ToggleBtn)
ToggleCorner.CornerRadius = UDim.new(1, 0)
local ToggleStroke = Instance.new("UIStroke", ToggleBtn)
ToggleStroke.Color = Color3.fromRGB(255, 0, 50)
ToggleStroke.Thickness = 3

ToggleBtn.MouseButton1Click:Connect(function()
    if MainFrame.Visible == true then
        MainFrame.Visible = false
    else
        MainFrame.Visible = true
    end
end)
