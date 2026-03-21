‏-- [[ NAXOR OFFICIAL V1.0 - FIXED DRAG + ACCOUNT AGE + SMALL ROUND TOGGLE ]]

‏local Players = game:GetService("Players")
‏local LP = Players.LocalPlayer
‏local PlayerGui = LP:WaitForChild("PlayerGui")
‏local UIS = game:GetService("UserInputService")
‏local TS = game:GetService("TweenService")
‏local SoundService = game:GetService("SoundService")
‏local CAS = game:GetService("ContextActionService")

-- [ الإعدادات ] --
‏local CustomImageID = "rbxassetid://111311482551281" 
‏local IsNotifyActive = false

‏if PlayerGui:FindFirstChild("Naxor_Official_V5") then PlayerGui.Naxor_Official_V5:Destroy() end

‏local Screen = Instance.new("ScreenGui", PlayerGui)
‏Screen.Name = "Naxor_Official_V5"; Screen.ResetOnSpawn = false

‏local Theme = {
‏    Main = Color3.fromRGB(8, 8, 8), Card = Color3.fromRGB(12, 12, 12),
‏    SubBox = Color3.fromRGB(18, 18, 18), Accent = Color3.fromRGB(220, 220, 220),
‏    Text = Color3.fromRGB(255, 255, 255), DarkText = Color3.fromRGB(150, 150, 150),
‏    Green = Color3.fromRGB(0, 255, 100)
}

-- [ وظيفة الصوت ] --
‏local function PlayClickSound()
‏    local s = Instance.new("Sound", SoundService)
‏    s.SoundId = "rbxassetid://6518811702"; s.Volume = 0.8; s:Play()
‏    game:GetService("Debris"):AddItem(s, 2)
‏end

‏local Utils = {}
‏function Utils:ApplyNeon(obj, color, thickness)
‏    local s = Instance.new("UIStroke", obj); s.Color = color or Color3.fromRGB(45, 45, 45); s.Thickness = thickness or 1.1; s.ApplyStrokeMode = Enum.ApplyStrokeMode.Border; return s
‏end

-- دالة السحب المعدلة (محاولة منع تحريك الكاميرا)
‏function Utils:MakeDraggable(Frame, Handle)
‏    local Dragging = false
‏    local DragStart, StartPos

‏    Handle.InputBegan:Connect(function(input)
‏        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
‏            Dragging = true
‏            DragStart = input.Position
‏            StartPos = Frame.Position

‏            CAS:BindAction("BlockDragCamera", function(actionName, inputState, inputObj)
‏                if inputState == Enum.UserInputState.Begin or inputState == Enum.UserInputState.Change then
‏                    return Enum.ContextActionResult.Sink
‏                end
‏                return Enum.ContextActionResult.Pass
‏            end, false, Enum.UserInputType.MouseMovement, Enum.UserInputType.Touch)
‏        end
‏    end)

‏    Handle.InputEnded:Connect(function(input)
‏        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
‏            Dragging = false
‏            CAS:UnbindAction("BlockDragCamera")
‏        end
‏    end)

‏    UIS.InputChanged:Connect(function(input)
‏        if Dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
‏            local Delta = input.Position - DragStart
‏            Frame.Position = UDim2.new(StartPos.X.Scale, StartPos.X.Offset + Delta.X, StartPos.Y.Scale, StartPos.Y.Offset + Delta.Y)
‏        end
‏    end)
‏end

-- [ الإطار الرئيسي ] --
‏local Main = Instance.new("Frame", Screen)
‏Main.Size = UDim2.new(0, 560, 0, 390); Main.Position = UDim2.new(0.5, -280, 0.5, -195); Main.BackgroundColor3 = Theme.Main; Main.BorderSizePixel = 0
‏Instance.new("UICorner", Main).CornerRadius = UDim.new(0, 12); Utils:ApplyNeon(Main, Theme.Accent, 1.8)

-- [ نظام الإشعارات ] --
‏local function ShowNotify(msg)
‏    if IsNotifyActive then return end; IsNotifyActive = true
‏    PlayClickSound()
‏    local NotifyFrame = Instance.new("Frame", Main)
‏    NotifyFrame.Size = UDim2.new(0, 250, 0, 42); NotifyFrame.Position = UDim2.new(0.5, -125, 0.4, 0); NotifyFrame.BackgroundColor3 = Theme.Card; NotifyFrame.ZIndex = 1000; NotifyFrame.BackgroundTransparency = 1
‏    Instance.new("UICorner", NotifyFrame).CornerRadius = UDim.new(0, 8)
‏    local stroke = Utils:ApplyNeon(NotifyFrame, Theme.Accent); stroke.Transparency = 1
‏    local txt = Instance.new("TextLabel", NotifyFrame); txt.Size = UDim2.new(1, 0, 1, 0); txt.BackgroundTransparency = 1; txt.Text = "🔔  " .. msg; txt.TextColor3 = Theme.Text; txt.Font = "GothamBold"; txt.TextSize = 11; txt.TextTransparency = 1; txt.ZIndex = 1001
‏    TS:Create(NotifyFrame, TweenInfo.new(0.4, Enum.EasingStyle.Back), {Position = UDim2.new(0.5, -125, 0.45, 0), BackgroundTransparency = 0}):Play()
‏    TS:Create(stroke, TweenInfo.new(0.4), {Transparency = 0}):Play(); TS:Create(txt, TweenInfo.new(0.4), {TextTransparency = 0}):Play()
‏    task.wait(2)
‏    local fade = TS:Create(NotifyFrame, TweenInfo.new(0.4), {BackgroundTransparency = 1, Position = UDim2.new(0.5, -125, 0.4, 0)}); fade:Play()
‏    TS:Create(stroke, TweenInfo.new(0.4), {Transparency = 1}):Play(); TS:Create(txt, TweenInfo.new(0.4), {TextTransparency = 1}):Play()
‏    fade.Completed:Wait(); NotifyFrame:Destroy(); IsNotifyActive = false
‏end

-- [ الزر العائم - صغير ودائري تماماً ] --
‏local ToggleBtn = Instance.new("ImageButton")
‏ToggleBtn.Name = "ToggleButton"
‏ToggleBtn.Parent = Screen
‏ToggleBtn.Size = UDim2.new(0, 52, 0, 52)               -- حجم صغير
‏ToggleBtn.Position = UDim2.new(0.02, 15, 0.4, 0)       -- يسار متوسط الارتفاع
‏ToggleBtn.BackgroundColor3 = Theme.Card
‏ToggleBtn.BackgroundTransparency = 0.05
‏ToggleBtn.Visible = false
‏ToggleBtn.ZIndex = 9999
‏ToggleBtn.Image = CustomImageID
‏ToggleBtn.ScaleType = Enum.ScaleType.Fit
‏ToggleBtn.AutoButtonColor = false

‏local corner = Instance.new("UICorner")
‏corner.CornerRadius = UDim.new(1, 0)                   -- دائري كامل
‏corner.Parent = ToggleBtn

‏Utils:ApplyNeon(ToggleBtn, Theme.Accent, 1.8)
‏Utils:MakeDraggable(ToggleBtn, ToggleBtn)

‏ToggleBtn.MouseButton1Click:Connect(function()
‏    PlayClickSound()
‏    Main.Visible = true
‏    ToggleBtn.Visible = false
‏end)

-- [ الهيدر واللوجو والفاصل ] --
‏local Header = Instance.new("Frame", Main); Header.Size = UDim2.new(1, 0, 0, 65); Header.BackgroundTransparency = 1; Header.ZIndex = 100; Utils:MakeDraggable(Main, Header)
‏local Logo = Instance.new("TextLabel", Header); Logo.RichText = true; Logo.Text = "N.X.R <font color='#DCDCDC'>>>> </font>"; Logo.Size = UDim2.new(0, 150, 1, 0); Logo.Position = UDim2.new(0, 25, 0, 0); Logo.BackgroundTransparency = 1; Logo.TextColor3 = Theme.Accent; Logo.TextSize = 22; Logo.Font = "GothamBold"; Logo.TextXAlignment = "Left"
‏local CloseBtn = Instance.new("TextButton", Header); CloseBtn.Size = UDim2.new(0, 30, 0, 30); CloseBtn.Position = UDim2.new(1, -45, 0, 17); CloseBtn.BackgroundTransparency = 1; CloseBtn.Text = "×"; CloseBtn.TextColor3 = Theme.Accent; CloseBtn.TextSize = 28; CloseBtn.Font = "GothamBold"; CloseBtn.ZIndex = 110; CloseBtn.MouseButton1Click:Connect(function() PlayClickSound(); Main.Visible = false; ToggleBtn.Visible = true end)
‏local Separator = Instance.new("Frame", Main); Separator.Size = UDim2.new(1, -40, 0, 1); Separator.Position = UDim2.new(0, 20, 0, 64); Separator.BackgroundColor3 = Theme.Accent; Separator.BorderSizePixel = 0; Utils:ApplyNeon(Separator, Theme.Accent, 0.6)

-- [ إدارة الصفحات ] --
‏local PagesCont = Instance.new("Frame", Main); PagesCont.Size = UDim2.new(1, 0, 1, -65); PagesCont.Position = UDim2.new(0, 0, 0, 65); PagesCont.BackgroundTransparency = 1
‏local P = { Home = Instance.new("Frame", PagesCont), Scripts = Instance.new("Frame", PagesCont), Credits = Instance.new("Frame", PagesCont) }
‏for n, f in pairs(P) do f.Size = UDim2.new(1, 0, 1, 0); f.BackgroundTransparency = 1; f.Visible = (n == "Home") end

‏local Nav = Instance.new("Frame", Header); Nav.Size = UDim2.new(0, 250, 1, 0); Nav.Position = UDim2.new(1, -310, 0, 0); Nav.BackgroundTransparency = 1
‏local Underline = Instance.new("Frame", Nav); Underline.Size = UDim2.new(0, 35, 0, 2); Underline.Position = UDim2.new(0, 15, 0, 48); Underline.BackgroundColor3 = Theme.Accent
‏local function AddTab(name, x, target)
‏    local btn = Instance.new("TextButton", Nav); btn.Size = UDim2.new(0, 75, 1, 0); btn.Position = UDim2.new(0, x, 0, 0); btn.BackgroundTransparency = 1; btn.Text = name; btn.TextColor3 = (target == "Home" and Theme.Text or Theme.DarkText); btn.Font = "GothamBold"; btn.TextSize = 12; btn.ZIndex = 105
‏    btn.MouseButton1Click:Connect(function() PlayClickSound(); TS:Create(Underline, TweenInfo.new(0.3), {Position = UDim2.new(0, x + 20, 0, 48)}):Play(); for n, f in pairs(P) do f.Visible = (n == target) end; for _, v in pairs(Nav:GetChildren()) do if v:IsA("TextButton") then v.TextColor3 = Theme.DarkText end end; btn.TextColor3 = Theme.Text end)
‏end
‏AddTab("HOME", 0, "Home"); AddTab("PAGES", 80, "Scripts"); AddTab("CREDITS", 160, "Credits")

-- [ بطاقة اللاعب والرانك ] --
‏local IDCard = Instance.new("Frame", P.Home); IDCard.Size = UDim2.new(0, 220, 0, 220); IDCard.Position = UDim2.new(0, 25, 0, 20); IDCard.BackgroundColor3 = Theme.Card; Instance.new("UICorner", IDCard).CornerRadius = UDim.new(0, 12); Utils:ApplyNeon(IDCard)
‏local pImg = Instance.new("ImageLabel", IDCard); pImg.Size = UDim2.new(0, 75, 0, 75); pImg.Position = UDim2.new(0, 15, 0, 15); pImg.Image = "rbxthumb://type=AvatarHeadShot&id="..LP.UserId.."&w=150&h=150"; pImg.BackgroundTransparency = 1; Instance.new("UICorner", pImg).CornerRadius = UDim.new(0, 10); Utils:ApplyNeon(pImg, Theme.Accent, 0.5)

‏local pName = Instance.new("TextLabel", IDCard); pName.Text = LP.DisplayName; pName.Size = UDim2.new(0, 115, 0, 20); pName.Position = UDim2.new(0, 100, 0, 15); pName.BackgroundTransparency = 1; pName.TextColor3 = Theme.Text; pName.Font = "GothamBold"; pName.TextSize = 13; pName.TextXAlignment = "Left"
‏local uName = Instance.new("TextLabel", IDCard); uName.Text = "@"..LP.Name; uName.Size = UDim2.new(0, 115, 0, 15); uName.Position = UDim2.new(0, 100, 0, 30); uName.BackgroundTransparency = 1; uName.TextColor3 = Theme.DarkText; uName.Font = "GothamMedium"; uName.TextSize = 9; uName.TextXAlignment = "Left"

‏local RankBox = Instance.new("Frame", IDCard); RankBox.Size = UDim2.new(0, 65, 0, 16); RankBox.Position = UDim2.new(0, 100, 0, 48); RankBox.BackgroundColor3 = Theme.SubBox; Instance.new("UICorner", RankBox).CornerRadius = UDim.new(0, 4); Utils:ApplyNeon(RankBox, Theme.Accent, 0.6)
‏local RT = Instance.new("TextLabel", RankBox); RT.Size = UDim2.new(1, 0, 1, 0); RT.Text = "★ OWNER"; RT.TextColor3 = Theme.Accent; RT.Font = "GothamBold"; RT.TextSize = 8; RT.BackgroundTransparency = 1

‏local function InfoRow(icon, text, y)
‏    local row = Instance.new("Frame", IDCard); row.Size = UDim2.new(1, -30, 0, 25); row.Position = UDim2.new(0, 15, 0, y); row.BackgroundColor3 = Theme.SubBox; row.BackgroundTransparency = 0.5; Instance.new("UICorner", row).CornerRadius = UDim.new(0, 6)
‏    local t = Instance.new("TextLabel", row); t.Size = UDim2.new(1, -10, 1, 0); t.Position = UDim2.new(0, 8, 0, 0); t.Text = icon.."  "..text; t.TextColor3 = Theme.DarkText; t.Font = "GothamMedium"; t.TextSize = 9; t.BackgroundTransparency = 1; t.TextXAlignment = "Left"; return t
‏end

‏InfoRow("📱", "Device: " .. (UIS.TouchEnabled and "Mobile" or "PC"), 100)
‏InfoRow("🗓️", "Account Age: " .. LP.AccountAge .. " Days", 130)
‏local SessionLabel = InfoRow("🕒", "Session: 00:00:00", 160); SessionLabel.TextColor3 = Theme.Accent

-- [ المربع اليمين + عداد واقعي ] --
‏local BigBox = Instance.new("Frame", P.Home); BigBox.Size = UDim2.new(1, -285, 0, 220); BigBox.Position = UDim2.new(0, 260, 0, 20); BigBox.BackgroundColor3 = Theme.Card; Instance.new("UICorner", BigBox).CornerRadius = UDim.new(0, 12); Utils:ApplyNeon(BigBox)

‏local OnlineLabel = Instance.new("TextLabel", BigBox)
‏OnlineLabel.Size = UDim2.new(0, 150, 0, 20)
‏OnlineLabel.Position = UDim2.new(0, 15, 0, 10)
‏OnlineLabel.BackgroundTransparency = 1
‏OnlineLabel.TextColor3 = Theme.Green
‏OnlineLabel.Font = Enum.Font.GothamBold
‏OnlineLabel.TextSize = 10
‏OnlineLabel.TextXAlignment = Enum.TextXAlignment.Left

‏task.spawn(function()
‏    while true do
‏        local count = #Players:GetPlayers()
‏        OnlineLabel.Text = "🟢 Online Users: " .. count
‏        task.wait(4)
‏    end
‏end)

-- [ أزرار التحكم السفلية ] --
‏local function CreateActionBtn(name, pos, size, msg)
‏    local btn = Instance.new("TextButton", P.Home); btn.Size = size; btn.Position = pos; btn.BackgroundColor3 = Theme.SubBox; btn.Text = name; btn.TextColor3 = Theme.Text; btn.Font = "GothamBold"; btn.TextSize = 10; Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 8); Utils:ApplyNeon(btn)
‏    btn.MouseButton1Click:Connect(function() ShowNotify(msg) end)
‏end
‏CreateActionBtn("CONFIG SYSTEM", UDim2.new(0, 25, 0, 255), UDim2.new(0, 105, 0, 50), "Configs Locked")
‏CreateActionBtn("UI SETTINGS", UDim2.new(0, 140, 0, 255), UDim2.new(0, 105, 0, 50), "UI Ready")
‏CreateActionBtn("NEWS & UPDATES", UDim2.new(0, 260, 0, 255), UDim2.new(1, -285, 0, 50), "Naxor V48.0 Loaded")

-- [ عداد الوقت ] --
‏local StartT = os.time()
‏task.spawn(function()
‏    while task.wait(1) do
‏        local e = os.time() - StartT
‏        SessionLabel.Text = string.format("🕒  Session: %02d:%02d:%02d", math.floor(e/3600), math.floor((e%3600)/60), e%60)
‏    end
‏end)

‏print("Naxor V48.0 Loaded - Small round toggle button added")
