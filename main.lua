‏-- [[ NAXOR OFFICIAL V75.5 - UPDATED WITH CREDITS ]] --
‏local Players = game:GetService("Players")
‏local LP = Players.LocalPlayer
‏local PlayerGui = LP:WaitForChild("PlayerGui")
‏local UIS = game:GetService("UserInputService")
‏local TS = game:GetService("TweenService")
‏local SoundService = game:GetService("SoundService")
‏local CAS = game:GetService("ContextActionService")

‏-- [[ SETTINGS ]] --
‏local CustomImageID = "rbxassetid://111311482551281" 
‏local IsNotifyActive = false

‏if PlayerGui:FindFirstChild("Naxor_Official_V5") then PlayerGui.Naxor_Official_V5:Destroy() end

‏local Screen = Instance.new("ScreenGui", PlayerGui)
‏Screen.Name = "Naxor_Official_V5"
‏Screen.ResetOnSpawn = false

‏local Theme = {
‏    Main = Color3.fromRGB(8, 8, 8),
‏    Card = Color3.fromRGB(12, 12, 12),
‏    SubBox = Color3.fromRGB(18, 18, 18),
‏    Accent = Color3.fromRGB(220, 220, 220),
‏    White = Color3.fromRGB(255, 255, 255),
‏    Gray = Color3.fromRGB(130, 130, 130),
‏    Green = Color3.fromRGB(0, 255, 100)
}

‏-- [[ Helper Functions ]] --
‏local function PlayClickSound()
‏    local s = Instance.new("Sound", SoundService)
‏    s.SoundId = "rbxassetid://6518811702"
‏    s.Volume = 0.8; s:Play()
‏    game:GetService("Debris"):AddItem(s, 2)
‏end

‏local function ApplyBoxStyle(obj, strokeColor)
‏    Instance.new("UICorner", obj).CornerRadius = UDim.new(0, 12)
‏    local s = Instance.new("UIStroke", obj)
‏    s.Color = strokeColor or Color3.fromRGB(45, 45, 45)
‏    s.Thickness = 1.2; s.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
‏    return s
‏end

‏local function ShowCenterNotify(msg)
‏    if IsNotifyActive then return end
‏    IsNotifyActive = true
‏    PlayClickSound()
‏    local MainFrame = Screen:FindFirstChild("MainFrame")
‏    if not MainFrame then IsNotifyActive = false; return end
    
‏    local nFrame = Instance.new("Frame", MainFrame)
‏    nFrame.Size = UDim2.new(0, 280, 0, 42)
‏    nFrame.Position = UDim2.new(0.5, -140, 0.35, 0)
‏    nFrame.BackgroundColor3 = Theme.Card
‏    nFrame.ZIndex = 2000
‏    nFrame.BackgroundTransparency = 1
‏    Instance.new("UICorner", nFrame).CornerRadius = UDim.new(0, 8)
‏    local st = Instance.new("UIStroke", nFrame)
‏    st.Color = Theme.Accent; st.Thickness = 1.5; st.Transparency = 1
    
‏    local txt = Instance.new("TextLabel", nFrame)
‏    txt.Size = UDim2.new(1, 0, 1, 0); txt.BackgroundTransparency = 1; txt.ZIndex = 2001; txt.Text = msg
‏    txt.TextColor3 = Theme.White; txt.Font = "GothamBold"; txt.TextSize = 11; txt.TextTransparency = 1

‏    TS:Create(nFrame, TweenInfo.new(0.4, Enum.EasingStyle.Back), {Position = UDim2.new(0.5, -140, 0.45, 0), BackgroundTransparency = 0}):Play()
‏    TS:Create(st, TweenInfo.new(0.4), {Transparency = 0}):Play()
‏    TS:Create(txt, TweenInfo.new(0.4), {TextTransparency = 0}):Play()
    
‏    task.wait(2.2)
‏    local fade = TS:Create(nFrame, TweenInfo.new(0.4), {BackgroundTransparency = 1, Position = UDim2.new(0.5, -140, 0.4, 0)})
‏    TS:Create(st, TweenInfo.new(0.4), {Transparency = 1}):Play()
‏    TS:Create(txt, TweenInfo.new(0.4), {TextTransparency = 1}):Play()
‏    fade:Play()
‏    fade.Completed:Wait()
‏    nFrame:Destroy()
‏    IsNotifyActive = false
‏end

‏local function MakeDrag(Frame, Handle)
‏    local d, ds, sp
‏    Handle.InputBegan:Connect(function(i)
‏        if i.UserInputType == Enum.UserInputType.MouseButton1 or i.UserInputType == Enum.UserInputType.Touch then
‏            d = true ds = i.Position sp = Frame.Position
‏            CAS:BindAction("DragLock", function() return Enum.ContextActionResult.Sink end, false, Enum.UserInputType.MouseMovement, Enum.UserInputType.Touch)
‏        end
‏    end)
‏    Handle.InputEnded:Connect(function(i)
‏        if i.UserInputType == Enum.UserInputType.MouseButton1 or i.UserInputType == Enum.UserInputType.Touch then
‏            d = false CAS:UnbindAction("DragLock")
‏        end
‏    end)
‏    UIS.InputChanged:Connect(function(i)
‏        if d and (i.UserInputType == Enum.UserInputType.MouseMovement or i.UserInputType == Enum.UserInputType.Touch) then
‏            local delta = i.Position - ds
‏            Frame.Position = UDim2.new(sp.X.Scale, sp.X.Offset + delta.X, sp.Y.Scale, sp.Y.Offset + delta.Y)
‏        end
‏    end)
‏end

‏-- [[ UI Main Framework ]] --
‏local Main = Instance.new("Frame", Screen)
‏Main.Name = "MainFrame"; Main.Size = UDim2.new(0, 560, 0, 390); Main.Position = UDim2.new(0.5, -280, 0.5, -195); Main.BackgroundColor3 = Theme.Main
‏ApplyBoxStyle(Main, Theme.Accent).Thickness = 1.8

‏local Header = Instance.new("Frame", Main); Header.Size = UDim2.new(1, 0, 0, 65); Header.BackgroundTransparency = 1; MakeDrag(Main, Header)

‏local Logo = Instance.new("TextLabel", Header)
‏Logo.Text = "-FUCK HOHOHUB-"; Logo.Size = UDim2.new(0, 300, 1, 0); Logo.Position = UDim2.new(0, 35, 0, 0); Logo.BackgroundTransparency = 1; Logo.TextColor3 = Theme.Accent; Logo.TextSize = 24; Logo.Font = "GothamBold"; Logo.TextXAlignment = "Left"

‏local Close = Instance.new("TextButton", Header)
‏Close.Text = "×"; Close.Size = UDim2.new(0, 30, 0, 30); Close.Position = UDim2.new(1, -45, 0, 17); Close.BackgroundTransparency = 1; Close.TextColor3 = Theme.Accent; Close.TextSize = 30; Close.Font = "GothamBold"; Close.ZIndex = 10

‏local Nav = Instance.new("Frame", Header); Nav.Size = UDim2.new(0, 260, 1, 0); Nav.Position = UDim2.new(1, -300, 0, 0); Nav.BackgroundTransparency = 1
‏local Line = Instance.new("Frame", Nav); Line.Size = UDim2.new(0, 35, 0, 2); Line.Position = UDim2.new(0, 22, 0, 48); Line.BackgroundColor3 = Theme.Accent; Line.BorderSizePixel = 0

‏local PagesCont = Instance.new("Frame", Main); PagesCont.Size = UDim2.new(1, 0, 1, -65); PagesCont.Position = UDim2.new(0, 0, 0, 65); PagesCont.BackgroundTransparency = 1
‏local P = { Home = Instance.new("Frame", PagesCont), Scripts = Instance.new("Frame", PagesCont), Credits = Instance.new("Frame", PagesCont), TestPage = Instance.new("Frame", PagesCont) }
‏for n, f in pairs(P) do f.Size = UDim2.new(1, 0, 1, 0); f.BackgroundTransparency = 1; f.Visible = (n == "Home") end

‏local backBtn = Instance.new("TextButton", Header)
‏backBtn.Size = UDim2.new(0, 80, 0, 30); backBtn.Position = UDim2.new(0, 15, 0, 17); backBtn.BackgroundColor3 = Theme.Card; backBtn.Text = "← BACK"; backBtn.TextColor3 = Theme.White; backBtn.Font = "GothamBold"; backBtn.TextSize = 11; backBtn.Visible = false; ApplyBoxStyle(backBtn, Theme.Accent)
‏backBtn.MouseButton1Click:Connect(function() PlayClickSound(); ShowPage(P.Scripts) end)

‏function ShowPage(page)
‏    for _, f in pairs(P) do f.Visible = false end; page.Visible = true
‏    if page == P.TestPage then Logo.Visible = false; Nav.Visible = false; backBtn.Visible = true else Logo.Visible = true; Nav.Visible = true; backBtn.Visible = false end
‏end

‏local function CreateTab(name, x, target)
‏    local btn = Instance.new("TextButton", Nav)
‏    btn.Size = UDim2.new(0, 80, 1, 0); btn.Position = UDim2.new(0, x, 0, 0); btn.BackgroundTransparency = 1; btn.Text = name; btn.TextColor3 = (target == "Home" and Theme.White or Theme.Gray); btn.Font = "GothamBold"; btn.TextSize = 12
‏    btn.MouseButton1Click:Connect(function() PlayClickSound(); TS:Create(Line, TweenInfo.new(0.3), {Position = UDim2.new(0, x + 22, 0, 48)}):Play(); ShowPage(P[target]); for _, obj in pairs(Nav:GetChildren()) do if obj:IsA("TextButton") then obj.TextColor3 = Theme.Gray end end; btn.TextColor3 = Theme.White end)
‏end
‏CreateTab("HOME", 0, "Home"); CreateTab("PAGES", 85, "Scripts"); CreateTab("CREDITS", 170, "Credits")

‏-- [[ HOME PAGE CONTENT ]] --
‏local IDCard = Instance.new("Frame", P.Home); IDCard.Size = UDim2.new(0, 220, 0, 220); IDCard.Position = UDim2.new(0, 25, 0, 20); IDCard.BackgroundColor3 = Theme.Card; ApplyBoxStyle(IDCard)
‏local pImg = Instance.new("ImageLabel", IDCard); pImg.Size = UDim2.new(0, 75, 0, 75); pImg.Position = UDim2.new(0, 15, 0, 15); pImg.Image = "rbxthumb://type=AvatarHeadShot&id=" .. LP.UserId .. "&w=150&h=150"; pImg.BackgroundTransparency = 1; Instance.new("UICorner", pImg).CornerRadius = UDim.new(0, 10); ApplyBoxStyle(pImg, Theme.Accent).Thickness = 0.5
‏local pNameLabel = Instance.new("TextLabel", IDCard); pNameLabel.Text = LP.DisplayName; pNameLabel.Size = UDim2.new(0, 115, 0, 15); pNameLabel.Position = UDim2.new(0, 100, 0, 15); pNameLabel.TextColor3 = Theme.White; pNameLabel.Font = "GothamBold"; pNameLabel.TextSize = 13; pNameLabel.BackgroundTransparency = 1; pNameLabel.TextXAlignment = "Left"
‏local pUserLabel = Instance.new("TextLabel", IDCard); pUserLabel.Text = "@" .. LP.Name; pUserLabel.Size = UDim2.new(0, 115, 0, 15); pUserLabel.Position = UDim2.new(0, 100, 0, 32); pUserLabel.TextColor3 = Theme.Gray; pUserLabel.Font = "GothamMedium"; pUserLabel.TextSize = 10; pUserLabel.BackgroundTransparency = 1; pUserLabel.TextXAlignment = "Left"
‏local RankBox = Instance.new("Frame", IDCard); RankBox.Size = UDim2.new(0, 70, 0, 18); RankBox.Position = UDim2.new(0, 100, 0, 55); RankBox.BackgroundColor3 = Theme.SubBox; ApplyBoxStyle(RankBox, Theme.Accent).Thickness = 0.8
‏local RT = Instance.new("TextLabel", RankBox); RT.Size = UDim2.new(1, 0, 1, 0); RT.Text = "★ OWNER"; RT.TextColor3 = Theme.Accent; RT.Font = "GothamBold"; RT.TextSize = 8; RT.BackgroundTransparency = 1

‏function CreateRow(icon, text, y)
‏    local r = Instance.new("Frame", IDCard); r.Size = UDim2.new(1, -30, 0, 26); r.Position = UDim2.new(0, 15, 0, y); r.BackgroundColor3 = Theme.SubBox; Instance.new("UICorner", r).CornerRadius = UDim.new(0, 6)
‏    local l = Instance.new("TextLabel", r); l.Size = UDim2.new(1, -10, 1, 0); l.Position = UDim2.new(0, 10, 0, 0); l.Text = icon .. "  " .. text; l.TextColor3 = Theme.Gray; l.Font = "GothamMedium"; l.TextSize = 9; l.BackgroundTransparency = 1; l.TextXAlignment = "Left"; return l
‏end
‏CreateRow("👤", "ID: " .. LP.UserId, 100); CreateRow("📱", "Device: " .. (UIS.TouchEnabled and "Mobile" or "PC"), 130); CreateRow("🗓️", "Age: " .. LP.AccountAge .. " Days", 160)
‏local SL = CreateRow("🕒", "Session: 00:00:00", 190); SL.TextColor3 = Theme.Accent

‏local BB = Instance.new("Frame", P.Home); BB.Size = UDim2.new(1, -285, 0, 220); BB.Position = UDim2.new(0, 260, 0, 20); BB.BackgroundColor3 = Theme.Card; ApplyBoxStyle(BB)
‏local OL = Instance.new("TextLabel", BB); OL.Size = UDim2.new(0, 150, 0, 20); OL.Position = UDim2.new(0, 15, 0, 12); OL.Text = "🟢 Online Users: --"; OL.TextColor3 = Theme.Green; OL.Font = "GothamBold"; OL.TextSize = 10; OL.BackgroundTransparency = 1; OL.TextXAlignment = "Left"

-- [[ نَص الحقوق الجديد ]] --
‏local CreditsLabel = Instance.new("TextLabel", BB)
‏CreditsLabel.Size = UDim2.new(1, -20, 0, 20); CreditsLabel.Position = UDim2.new(0, 15, 1, -25); CreditsLabel.BackgroundTransparency = 1
‏CreditsLabel.Text = "@made by Berserk&Naxor"; CreditsLabel.TextColor3 = Theme.Gray; CreditsLabel.Font = "GothamMedium"; CreditsLabel.TextSize = 9; CreditsLabel.TextXAlignment = "Left"

‏function CreateFooterBox(name, x, w)
‏    local b = Instance.new("TextButton", P.Home); b.Size = UDim2.new(0, w, 0, 50); b.Position = UDim2.new(0, x, 0, 255); b.BackgroundColor3 = Theme.Card; b.Text = name; b.TextColor3 = Theme.White; b.Font = "GothamBold"; b.TextSize = 10; ApplyBoxStyle(b)
‏    b.MouseButton1Click:Connect(function() ShowCenterNotify(name .. " Is Under Maintenance") end)
‏end
‏CreateFooterBox("CONFIG SYSTEM", 25, 105); CreateFooterBox("UI SETTINGS", 140, 105); CreateFooterBox("NEWS & UPDATES", 260, 275)

‏-- [[ PAGES (SCRIPTS) ]] --
‏local SearchBar = Instance.new("TextBox", P.Scripts); SearchBar.Size = UDim2.new(1, -50, 0, 35); SearchBar.Position = UDim2.new(0, 25, 0, 10); SearchBar.BackgroundColor3 = Theme.Card; SearchBar.PlaceholderText = "🔍 Search scripts..."; SearchBar.Text = ""; SearchBar.TextColor3 = Theme.White; SearchBar.Font = "GothamBold"; SearchBar.TextSize = 12; ApplyBoxStyle(SearchBar, Theme.Accent).Thickness = 0.8
‏local Sc = Instance.new("ScrollingFrame", P.Scripts); Sc.Size = UDim2.new(1, -30, 1, -70); Sc.Position = UDim2.new(0, 15, 0, 55); Sc.BackgroundTransparency = 1; Sc.CanvasSize = UDim2.new(0, 0, 0, 0); Sc.AutomaticCanvasSize = Enum.AutomaticSize.Y; Sc.ScrollBarThickness = 2; Sc.ScrollBarImageColor3 = Theme.Accent; Sc.ScrollBarImageTransparency = 0.8; Sc.MouseEnter:Connect(function() TS:Create(Sc, TweenInfo.new(0.3), {ScrollBarImageTransparency = 0.3}):Play() end); Sc.MouseLeave:Connect(function() TS:Create(Sc, TweenInfo.new(0.3), {ScrollBarImageTransparency = 0.8}):Play() end)
‏local GL = Instance.new("UIGridLayout", Sc); GL.CellSize = UDim2.new(0, 160, 0, 50); GL.CellPadding = UDim2.new(0, 12, 0, 12); GL.HorizontalAlignment = "Center"
‏function AddScriptButton(n, isTest)
‏    local b = Instance.new("TextButton", Sc); b.Name = n; b.Text = n; b.BackgroundColor3 = Theme.Card; b.TextColor3 = Theme.White; b.Font = "GothamBold"; b.TextSize = 10; ApplyBoxStyle(b); b.MouseButton1Click:Connect(function() PlayClickSound(); if isTest then ShowPage(P.TestPage) else ShowCenterNotify("Script Executed: " .. n) end end)
‏end
‏SearchBar.GetPropertyChangedSignal(SearchBar, "Text"):Connect(function() local text = SearchBar.Text:lower(); for _, child in pairs(Sc:GetChildren()) do if child:IsA("TextButton") then child.Visible = child.Name:lower():find(text) and true or false end end end)
‏AddScriptButton("تجربة 1", true); for i = 1, 20 do AddScriptButton("Script " .. i, false) end

‏-- [[ TOGGLE ]] --
‏local Tog = Instance.new("ImageButton", Screen); Tog.Size = UDim2.new(0, 52, 0, 52); Tog.Position = UDim2.new(0.02, 15, 0.4, 0); Tog.BackgroundColor3 = Theme.Card; Tog.Image = CustomImageID; Tog.Visible = false; ApplyBoxStyle(Tog, Theme.Accent).Thickness = 1.8; MakeDrag(Tog, Tog)
‏Tog.MouseButton1Click:Connect(function() PlayClickSound(); Main.Visible = true; Tog.Visible = false end)
‏Close.MouseButton1Click:Connect(function() PlayClickSound(); Main.Visible = false; Tog.Visible = true end)

‏task.spawn(function()
‏    local st = os.time()
‏    while task.wait(1) do
‏        local e = os.time() - st; local h, m, s = math.floor(e/3600), math.floor((e%3600)/60), e%60
‏        SL.Text = string.format("🕒  Session: %02d:%02d:%02d", h, m, s); OL.Text = "🟢 Online Users: " .. #Players:GetPlayers()
‏    end
‏end)
