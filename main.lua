-- [[ NAXOR V4 - THE MASTERPIECE ]] --
-- [[ تم الدمج بالكامل بدون أي اختصارات ]] --

local Players = game:GetService("Players")
local LP = Players.LocalPlayer
local PlayerGui = LP:WaitForChild("PlayerGui")
local UIS = game:GetService("UserInputService")
local TS = game:GetService("TweenService")

-- [1] نظام تنظيف الواجهات القديمة
local function CleanOldUI()
    local existingUI = PlayerGui:FindFirstChild("Naxor_Official_V4")
    if existingUI then
        existingUI:Destroy()
    end
end
CleanOldUI()

-- [2] إعدادات الألوان الأساسية (RGB)
local R = 255
local G = 0
local B = 50
local MainColor = Color3.fromRGB(R, G, B)

-- [3] إنشاء العناصر الهيكلية للواجهة
local Screen = Instance.new("ScreenGui")
Screen.Name = "Naxor_Official_V4"
Screen.Parent = PlayerGui
Screen.IgnoreGuiInset = true
Screen.ZIndexBehavior = Enum.ZIndexBehavior.Global

local Main = Instance.new("Frame")
Main.Name = "MainFrame"
Main.Parent = Screen
Main.Size = UDim2.new(0, 560, 0, 390)
Main.Position = UDim2.new(0.5, -280, 0.5, -195)
Main.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
Main.BorderSizePixel = 0
Main.ClipsDescendants = true

local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 20)
MainCorner.Parent = Main

local MainStroke = Instance.new("UIStroke")
MainStroke.Thickness = 3
MainStroke.Color = MainColor
MainStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
MainStroke.Parent = Main

-- [4] هيدر السحب (Drag Header) - المنطقة الوحيدة للسحب
local Header = Instance.new("Frame")
Header.Name = "Header"
Header.Parent = Main
Header.Size = UDim2.new(1, 0, 0, 65)
Header.BackgroundTransparency = 1
Header.ZIndex = 10

local dragging = false
local dragInput
local dragStart
local startPos

Header.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startPos = Main.Position
        
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)

UIS.InputChanged:Connect(function(input)
    if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
        local delta = input.Position - dragStart
        Main.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
end)

-- [5] الشعار (Logo)
local Logo = Instance.new("TextLabel")
Logo.Name = "Logo"
Logo.Parent = Header
Logo.RichText = true
Logo.Text = "N.X.R <font color='#FF0032'>>>> </font>"
Logo.Size = UDim2.new(0, 150, 1, 0)
Logo.Position = UDim2.new(0, 25, 0, 0)
Logo.BackgroundTransparency = 1
Logo.TextColor3 = Color3.new(1, 1, 1)
Logo.TextSize = 26
Logo.Font = Enum.Font.GothamBold
Logo.TextXAlignment = Enum.TextXAlignment.Left

-- [6] صفحات المحتوى (Pages)
local HomePage = Instance.new("Frame")
HomePage.Name = "HomePage"
HomePage.Parent = Main
HomePage.Size = UDim2.new(1, -50, 1, -170)
HomePage.Position = UDim2.new(0, 25, 0, 80)
HomePage.BackgroundTransparency = 1
HomePage.Visible = true

local SettingsPage = Instance.new("Frame")
SettingsPage.Name = "SettingsPage"
SettingsPage.Parent = Main
SettingsPage.Size = UDim2.new(1, -50, 1, -170)
SettingsPage.Position = UDim2.new(0, 25, 0, 80)
SettingsPage.BackgroundTransparency = 1
SettingsPage.Visible = false

-- [7] بطاقة الهوية (ID CARD) - يسار صفحة الهوم
local IDCard = Instance.new("Frame")
IDCard.Name = "IDCard"
IDCard.Parent = HomePage
IDCard.Size = UDim2.new(0, 195, 1, 0)
IDCard.BackgroundColor3 = Color3.fromRGB(12, 12, 12)

local IDCorner = Instance.new("UICorner")
IDCorner.CornerRadius = UDim.new(0, 15)
IDCorner.Parent = IDCard

local IDStroke = Instance.new("UIStroke")
IDStroke.Thickness = 1.5
IDStroke.Color = MainColor
IDStroke.Parent = IDCard

-- صورة اللاعب في البطاقة
local PlayerImage = Instance.new("ImageLabel")
PlayerImage.Name = "PlayerImage"
PlayerImage.Parent = IDCard
PlayerImage.Size = UDim2.new(0, 70, 0, 70)
PlayerImage.Position = UDim2.new(0, 15, 0, 15)
PlayerImage.Image = "rbxthumb://type=AvatarHeadShot&id="..LP.UserId.."&w=150&h=150"
PlayerImage.BackgroundColor3 = Color3.fromRGB(20, 20, 20)

local ImgCorner = Instance.new("UICorner")
ImgCorner.CornerRadius = UDim.new(0, 12)
ImgCorner.Parent = PlayerImage

-- نصوص البطاقة
local function CreateIDLabel(text, y, color, font, size)
    local label = Instance.new("TextLabel")
    label.Parent = IDCard
    label.Text = text
    label.Size = UDim2.new(1, -30, 0, 20)
    label.Position = UDim2.new(0, 15, 0, y)
    label.BackgroundTransparency = 1
    label.TextColor3 = color
    label.TextSize = size
    label.Font = font
    label.TextXAlignment = Enum.TextXAlignment.Left
    return label
end

local LabelID = CreateIDLabel("IDENTIFICATION:", 95, Color3.fromRGB(110, 110, 110), Enum.Font.GothamBold, 8)
local LabelName = CreateIDLabel("NAME: "..LP.Name:upper(), 115, Color3.new(1, 1, 1), Enum.Font.GothamMedium, 10)
local LabelStatus = CreateIDLabel("STATUS: ONLINE", 135, Color3.fromRGB(0, 255, 130), Enum.Font.GothamMedium, 10)
local LabelVer = CreateIDLabel("VERSION: 4.0.0", 155, Color3.new(1, 1, 1), Enum.Font.GothamMedium, 10)
local LabelAccess = CreateIDLabel("N.X.R HUB ACCESS", 185, MainColor, Enum.Font.GothamBold, 10)

-- مربع الصورة اليمين (Image Box)
local ImageBox = Instance.new("Frame")
ImageBox.Name = "ImageBox"
ImageBox.Parent = HomePage
ImageBox.Size = UDim2.new(1, -220, 1, 0)
ImageBox.Position = UDim2.new(0, 220, 0, 0)
ImageBox.BackgroundColor3 = Color3.fromRGB(12, 12, 12)

local ImgBoxCorner = Instance.new("UICorner")
ImgBoxCorner.CornerRadius = UDim.new(0, 15)
ImgBoxCorner.Parent = ImageBox

local ImgBoxStroke = Instance.new("UIStroke")
ImgBoxStroke.Thickness = 1.5
ImgBoxStroke.Color = MainColor
ImgBoxStroke.Parent = ImageBox

-- [8] نظام التحكم بالألوان (RGB Sliders) في صفحة الإعدادات
local function UpdateOverallColors()
    local NewColor = Color3.fromRGB(R, G, B)
    MainStroke.Color = NewColor
    IDStroke.Color = NewColor
    ImgBoxStroke.Color = NewColor
    LabelAccess.TextColor3 = NewColor
    Logo.Text = "N.X.R <font color='#" .. NewColor:ToHex() .. "'> >>> </font>"
end

local function CreateRGBUISlider(SliderName, SliderColor, OrderY)
    local SliderFrame = Instance.new("Frame")
    SliderFrame.Name = SliderName.."_Slider"
    SliderFrame.Parent = SettingsPage
    SliderFrame.Size = UDim2.new(0, 280, 0, 45)
    SliderFrame.Position = UDim2.new(0, 10, 0, OrderY * 55)
    SliderFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    Instance.new("UICorner", SliderFrame).CornerRadius = UDim.new(0, 10)
    
    local SliderBar = Instance.new("Frame")
    SliderBar.Parent = SliderFrame
    SliderBar.Size = UDim2.new(0, 180, 0, 4)
    SliderBar.Position = UDim2.new(0, 85, 0.5, -2)
    SliderBar.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    
    local SliderDot = Instance.new("TextButton")
    SliderDot.Parent = SliderBar
    SliderDot.Size = UDim2.new(0, 16, 0, 16)
    SliderDot.Position = UDim2.new(0, 0, 0.5, -8)
    SliderDot.BackgroundColor3 = SliderColor
    SliderDot.Text = ""
    Instance.new("UICorner", SliderDot).CornerRadius = UDim.new(1, 0)
    
    local isSliding = false
    
    SliderDot.MouseButton1Down:Connect(function()
        isSliding = true
    end)
    
    UIS.InputChanged:Connect(function(input)
        if isSliding and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
            local relativePos = math.clamp((input.Position.X - SliderBar.AbsolutePosition.X) / SliderBar.AbsoluteSize.X, 0, 1)
            SliderDot.Position = UDim2.new(relativePos, -8, 0.5, -8)
            local value = math.floor(relativePos * 255)
            
            if SliderName == "Red" then R = value
            elseif SliderName == "Green" then G = value
            elseif SliderName == "Blue" then B = value end
            
            UpdateOverallColors()
        end
    end)
    
    UIS.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            isSliding = false
        end
    end)
end

CreateRGBUISlider("Red", Color3.new(1, 0, 0), 0)
CreateRGBUISlider("Green", Color3.new(0, 1, 0), 1)
CreateRGBUISlider("Blue", Color3.new(0, 0.6, 1), 2)

-- [9] الأزرار السفلية (Bottom Buttons)
local function CreateMainBottomButton(btnText, xOffset, clickCallback)
    local button = Instance.new("TextButton")
    button.Parent = Main
    button.Size = UDim2.new(0, 160, 0, 85)
    button.Position = UDim2.new(0, xOffset, 1, -105)
    button.BackgroundColor3 = Color3.fromRGB(18, 18, 18)
    button.Text = btnText
    button.TextColor3 = Color3.new(1, 1, 1)
    button.Font = Enum.Font.GothamBold
    button.TextSize = 13
    
    Instance.new("UICorner", button).CornerRadius = UDim.new(0, 15)
    
    local btnStroke = Instance.new("UIStroke")
    btnStroke.Thickness = 1.2
    btnStroke.Color = Color3.fromRGB(35, 35, 35)
    btnStroke.Parent = button
    
    button.MouseButton1Click:Connect(clickCallback)
end

CreateMainBottomButton("CONFIG", 25, function()
    print("Config Panel Opened")
end)

CreateMainBottomButton("SETTING", 200, function()
    HomePage.Visible = false
    SettingsPage.Visible = true
end)

CreateMainBottomButton("AD (إعلان)", 375, function()
    print("Advertisement Clicked")
end)

-- شريط الزينة السفلي
local FooterLine = Instance.new("Frame")
FooterLine.Parent = Main
FooterLine.Size = UDim2.new(0, 130, 0, 4)
FooterLine.Position = UDim2.new(0.5, -65, 1, -12)
FooterLine.BackgroundColor3 = Color3.new(1, 1, 1)
FooterLine.BackgroundTransparency = 0.6
Instance.new("UICorner", FooterLine).CornerRadius = UDim.new(1, 0)

-- زر العودة للهوم من الإعدادات (اختياري)
Logo.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        SettingsPage.Visible = false
        HomePage.Visible = true
    end
end)

print("Naxor V4 System: Fully Loaded Without Shortcuts.")
