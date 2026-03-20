-- [[ NAXOR V4 - FULL DETAILED MERGED SOURCE - NO SHORTCUTS ]] --

local Players = game:GetService("Players")
local LP = Players.LocalPlayer
local PlayerGui = LP:WaitForChild("PlayerGui")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")

-- [1] تنظيف النسخ القديمة
local OldGui = PlayerGui:FindFirstChild("Naxor_Official_V4")
if OldGui then
    OldGui:Destroy()
end

-- [2] حاوية الشاشة (ScreenGui)
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "Naxor_Official_V4"
ScreenGui.Parent = PlayerGui
ScreenGui.ResetOnSpawn = false
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.DisplayOrder = 99999

-- [3] اللوحة الرئيسية (Main Frame)
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
MainStroke.Parent = MainFrame
MainStroke.Color = Color3.fromRGB(255, 0, 50)
MainStroke.Thickness = 2.5

-- [4] العنوان العلوي N.X.R
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

-- [5] الخط الأحمر المتحرك (Indicator)
local TabIndicator = Instance.new("Frame")
TabIndicator.Name = "TabIndicator"
TabIndicator.Parent = MainFrame
TabIndicator.Size = UDim2.new(0, 35, 0, 2)
TabIndicator.Position = UDim2.new(1, -90, 0, 47) -- يبدأ تحت الهوم
TabIndicator.BackgroundColor3 = Color3.fromRGB(255, 0, 50)
TabIndicator.BorderSizePixel = 0
TabIndicator.ZIndex = 10

-- [6] إنشاء حاويات الصفحات (Frames)
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

-- [7] محتويات صفحة الهوم (HOME CONTENT)
local AvatarImage = Instance.new("ImageLabel")
AvatarImage.Parent = HomePage
AvatarImage.Size = UDim2.new(0, 60, 0, 60)
AvatarImage.Position = UDim2.new(0, 20, 0, 65)
AvatarImage.Image = "rbxthumb://type=AvatarHeadShot&id="..LP.UserId.."&w=150&h=150"
AvatarImage.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
local AvatarCorner = Instance.new("UICorner", AvatarImage)
AvatarCorner.CornerRadius = UDim.new(0, 8)

local StateFrame = Instance.new("Frame")
StateFrame.Parent = HomePage
StateFrame.Size = UDim2.new(0, 80, 0, 30)
StateFrame.Position = UDim2.new(0, 85, 0, 65)
StateFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
local StateCorner = Instance.new("UICorner", StateFrame)
StateCorner.CornerRadius = UDim.new(0, 5)

local StateTitle = Instance.new("TextLabel")
StateTitle.Parent = StateFrame
StateTitle.Text = "STATE"
StateTitle.Size = UDim2.new(1, 0, 1, 0)
StateTitle.BackgroundTransparency = 1
StateTitle.TextColor3 = Color3.fromRGB(255, 0, 50)
StateTitle.TextSize = 12
StateTitle.Font = Enum.Font.GothamBold

local InfoLabel = Instance.new("TextLabel")
InfoLabel.Parent = HomePage
InfoLabel.Size = UDim2.new(0, 180, 0, 110)
InfoLabel.Position = UDim2.new(0, 20, 0, 130)
InfoLabel.BackgroundTransparency = 1
InfoLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
InfoLabel.TextSize = 13
InfoLabel.Font = Enum.Font.GothamBold
InfoLabel.TextXAlignment = Enum.TextXAlignment.Left

local StartTime = tick()
RunService.RenderStepped:Connect(function()
    local Elapsed = tick() - StartTime
    local Hours = math.floor(Elapsed / 3600)
    local Minutes = math.floor((Elapsed % 3600) / 60)
    local Seconds = math.floor(Elapsed % 60)
    local FPS = math.floor(1 / RunService.RenderStepped:Wait())
    InfoLabel.Text = "USER: "..LP.Name:upper().."\nSTATUS: ONLINE\nFPS: "..FPS.."\nTIME: "..string.format("%02d:%02d:%02d", Hours, Minutes, Seconds).."\nN.X.R ACTIVE"
end)

local CenterBox = Instance.new("Frame")
CenterBox.Parent = HomePage
CenterBox.Size = UDim2.new(0, 285, 0, 185)
CenterBox.Position = UDim2.new(0, 180, 0, 65)
CenterBox.BackgroundColor3 = Color3.fromRGB(12, 12, 12)
local CBCorner = Instance.new("UICorner", CenterBox); CBCorner.CornerRadius = UDim.new(0, 10)
local CBStroke = Instance.new("UIStroke", CenterBox); CBStroke.Color = Color3.fromRGB(255, 0, 50); CBStroke.Thickness = 1.5

-- [8] محتويات صفحة الصفحات (PAGES CONTENT)
local PagesTitle = Instance.new("TextLabel")
PagesTitle.Parent = PagesPage
PagesTitle.Text = "SCRIPTS CENTER"
PagesTitle.Size = UDim2.new(0, 200, 0, 30)
PagesTitle.Position = UDim2.new(0, 20, 0, 70)
PagesTitle.BackgroundTransparency = 1
PagesTitle.TextColor3 = Color3.fromRGB(255, 0, 50)
PagesTitle.TextSize = 18
PagesTitle.Font = Enum.Font.GothamBold
PagesTitle.TextXAlignment = Enum.TextXAlignment.Left

-- [9] أزرار التنقل (Home & Pages Buttons)
local HomeBtn = Instance.new("TextButton")
HomeBtn.Parent = MainFrame
HomeBtn.Size = UDim2.new(0, 35, 0, 35)
HomeBtn.Position = UDim2.new(1, -90, 0, 12)
HomeBtn.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
HomeBtn.Text = "🏠"
HomeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
HomeBtn.TextSize = 18
local HBC = Instance.new("UICorner", HomeBtn); HBC.CornerRadius = UDim.new(0, 8)

local PagesBtn = Instance.new("TextButton")
PagesBtn.Parent = MainFrame
PagesBtn.Size = UDim2.new(0, 35, 0, 35)
PagesBtn.Position = UDim2.new(1, -45, 0, 12)
PagesBtn.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
PagesBtn.Text = "📄"
PagesBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
PagesBtn.TextSize = 18
local PBC = Instance.new("UICorner", PagesBtn); PBC.CornerRadius = UDim.new(0, 8)

-- برمجة التنقل
HomeBtn.MouseButton1Click:Connect(function()
    HomePage.Visible = true
    PagesPage.Visible = false
    TweenService:Create(TabIndicator, TweenInfo.new(0.3, Enum.EasingStyle.Quart), {Position = UDim2.new(1, -90, 0, 47)}):Play()
end)

PagesBtn.MouseButton1Click:Connect(function()
    HomePage.Visible = false
    PagesPage.Visible = true
    TweenService:Create(TabIndicator, TweenInfo.new(0.3, Enum.EasingStyle.Quart), {Position = UDim2.new(1, -45, 0, 47)}):Play()
end)

-- [10] الأزرار السفلية (مفصلة بالكامل)
local ConfigBtn = Instance.new("TextButton", HomePage)
ConfigBtn.Size = UDim2.new(0, 148, 0, 70); ConfigBtn.Position = UDim2.new(0, 10, 0, 260); ConfigBtn.BackgroundColor3 = Color3.fromRGB(22, 22, 22); ConfigBtn.Text = "CONFIG"; ConfigBtn.TextColor3 = Color3.new(1,1,1); ConfigBtn.Font = "GothamBold"; ConfigBtn.TextSize = 15; Instance.new("UICorner", ConfigBtn).CornerRadius = UDim.new(0, 8); Instance.new("UIStroke", ConfigBtn).Color = Color3.fromRGB(40, 40, 40)

local SettingBtn = Instance.new("TextButton", HomePage)
SettingBtn.Size = UDim2.new(0, 148, 0, 70); SettingBtn.Position = UDim2.new(0, 165, 0, 260); SettingBtn.BackgroundColor3 = Color3.fromRGB(22, 22, 22); SettingBtn.Text = "SETTING"; SettingBtn.TextColor3 = Color3.new(1,1,1); SettingBtn.Font = "GothamBold"; SettingBtn.TextSize = 15; Instance.new("UICorner", SettingBtn).CornerRadius = UDim.new(0, 8); Instance.new("UIStroke", SettingBtn).Color = Color3.fromRGB(40, 40, 40)

local AdBtn = Instance.new("TextButton", HomePage)
AdBtn.Size = UDim2.new(0, 148, 0, 70); AdBtn.Position = UDim2.new(0, 322, 0, 260); AdBtn.BackgroundColor3 = Color3.fromRGB(22, 22, 22); AdBtn.Text = "AD (إعلان)"; AdBtn.TextColor3 = Color3.new(1,1,1); AdBtn.Font = "GothamBold"; AdBtn.TextSize = 15; Instance.new("UICorner", AdBtn).CornerRadius = UDim.new(0, 8); Instance.new("UIStroke", AdBtn).Color = Color3.fromRGB(40, 40, 40)

-- [11] الزر العائم (Toggle)
local Toggle = Instance.new("TextButton", ScreenGui)
Toggle.Size = UDim2.new(0, 55, 0, 55); Toggle.Position = UDim2.new(1, -70, 0, 20); Toggle.BackgroundColor3 = Color3.fromRGB(15, 15, 15); Toggle.Text = "NXR"; Toggle.TextColor3 = Color3.fromRGB(255, 0, 50); Toggle.Font = "GothamBold"; Toggle.TextSize = 15; Toggle.Draggable = true; Instance.new("UICorner", Toggle).CornerRadius = UDim.new(1, 0); local TS = Instance.new("UIStroke", Toggle); TS.Color = Color3.fromRGB(255, 0, 50); TS.Thickness = 3
Toggle.MouseButton1Click:Connect(function() MainFrame.Visible = not MainFrame.Visible end)
