-- ============================================
-- SCRIPT 30 FITUR ULTIMATE
-- By: Fikzxx Team
-- Version: 3.0 (Loadstring Ready)
-- ============================================

-- ==== CARA PAKE ====
-- loadstring(game:HttpGet("https://raw.githubusercontent.com/username/repo/main/script.lua"))()

-- ============================================
-- MAIN SCRIPT
-- ============================================

local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")
local rootPart = character:WaitForChild("HumanoidRootPart")

-- ========== CEK EXECUTOR ==========
local executorName = "Unknown"
if syn then executorName = "Synapse X" 
elseif krnl then executorName = "Krnl" 
elseif script_context and script_context.executor then executorName = script_context.executor 
elseif getexecutorname then executorName = getexecutorname() 
end

print("⚡ Script Loaded on: "..executorName)

-- ========== BUAT GUI ==========
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "Ultimate30Fitur"
screenGui.Parent = player.PlayerGui

-- Hapus GUI lama kalo ada
for _, gui in pairs(player.PlayerGui:GetChildren()) do
    if gui.Name == "Ultimate30Fitur" and gui ~= screenGui then
        gui:Destroy()
    end
end

local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 420, 0, 580)
mainFrame.Position = UDim2.new(0.5, -210, 0.5, -290)
mainFrame.BackgroundColor3 = Color3.fromRGB(10, 10, 30)
mainFrame.BackgroundTransparency = 0.05
mainFrame.BorderSizePixel = 2
mainFrame.BorderColor3 = Color3.fromRGB(0, 200, 255)
mainFrame.Parent = screenGui

-- Draggable (bisa digeser)
local dragging = false
local dragStart = nil
local startPos = nil

mainFrame.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        dragStart = input.Position
        startPos = mainFrame.Position
    end
end)

mainFrame.InputChanged:Connect(function(input)
    if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
        local delta = input.Position - dragStart
        mainFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
end)

mainFrame.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = false
    end
end)

-- Title
local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 50)
title.BackgroundColor3 = Color3.fromRGB(0, 150, 255)
title.Text = "⚡ 30 FITUR ULTIMATE ⚡"
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.Font = Enum.Font.GothamBold
title.TextSize = 22
title.Parent = mainFrame

-- Subtitle
local subTitle = Instance.new("TextLabel")
subTitle.Size = UDim2.new(1, 0, 0, 20)
subTitle.Position = UDim2.new(0, 0, 0, 50)
subTitle.BackgroundTransparency = 1
subTitle.Text = "👤 "..player.Name.." | 30 Fitur Siap Pakai | "..executorName
subTitle.TextColor3 = Color3.fromRGB(100, 200, 255)
subTitle.Font = Enum.Font.GothamMedium
subTitle.TextSize = 11
subTitle.Parent = mainFrame

-- Close button
local closeBtn = Instance.new("TextButton")
closeBtn.Size = UDim2.new(0, 30, 0, 30)
closeBtn.Position = UDim2.new(1, -35, 0, 10)
closeBtn.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
closeBtn.Text = "✕"
closeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
closeBtn.Font = Enum.Font.GothamBold
closeBtn.TextSize = 18
closeBtn.Parent = mainFrame

closeBtn.MouseButton1Click:Connect(function()
    screenGui:Destroy()
    print("❌ GUI Closed")
end)

-- Scrolling Frame
local scrollingFrame = Instance.new("ScrollingFrame")
scrollingFrame.Size = UDim2.new(1, 0, 0, 490)
scrollingFrame.Position = UDim2.new(0, 0, 0, 70)
scrollingFrame.BackgroundTransparency = 1
scrollingFrame.CanvasSize = UDim2.new(0, 0, 0, 950)
scrollingFrame.ScrollBarThickness = 5
scrollingFrame.Parent = mainFrame

local UIListLayout = Instance.new("UIListLayout")
UIListLayout.Padding = UDim.new(0, 4)
UIListLayout.Parent = scrollingFrame

-- ========== TABEL 30 FITUR ==========
local features = {
    {"🚀 Fly", "fly", Color3.fromRGB(0, 150, 255)},
    {"💨 Speed Hack", "speed", Color3.fromRGB(255, 200, 0)},
    {"👻 Invisible", "invisible", Color3.fromRGB(150, 0, 255)},
    {"🛡️ God Mode", "god", Color3.fromRGB(0, 255, 0)},
    {"💀 Kill All", "kill", Color3.fromRGB(255, 0, 0)},
    {"🌀 Spin Player", "spin", Color3.fromRGB(255, 100, 0)},
    {"💥 Explode All", "explode", Color3.fromRGB(255, 50, 50)},
    {"🔒 Freeze Player", "freeze", Color3.fromRGB(0, 200, 255)},
    {"📦 Item Spam", "spam", Color3.fromRGB(255, 0, 255)},
    {"🎵 Ear Rape", "earrape", Color3.fromRGB(255, 50, 200)},
    {"🌀 Fling Player", "fling", Color3.fromRGB(100, 255, 100)},
    {"🎯 Aim Bot", "aimbot", Color3.fromRGB(255, 100, 100)},
    {"🪄 Teleport All", "teleport", Color3.fromRGB(200, 0, 255)},
    {"🔒 Cage Player", "cage", Color3.fromRGB(255, 0, 150)},
    {"💫 Noclip", "noclip", Color3.fromRGB(0, 255, 200)},
    {"🔥 Fire Trail", "fire", Color3.fromRGB(255, 150, 0)},
    {"⚡ Loop Kill", "loopkill", Color3.fromRGB(255, 0, 50)},
    {"🎭 Morph", "morph", Color3.fromRGB(200, 100, 255)},
    {"💣 Bomb Spam", "bomb", Color3.fromRGB(50, 50, 50)},
    {"🌪️ Tornado", "tornado", Color3.fromRGB(0, 100, 255)},
    {"🔨 Smash Player", "smash", Color3.fromRGB(255, 150, 50)},
    {"🌊 Wave Spam", "wave", Color3.fromRGB(0, 200, 200)},
    {"⚡ Super Jump", "jump", Color3.fromRGB(0, 255, 150)},
    {"🔄 Anti-Kill", "antikill", Color3.fromRGB(255, 0, 200)},
    {"📹 ESP Player", "esp", Color3.fromRGB(0, 255, 255)},
    {"🎨 Rainbow Mode", "rainbow", Color3.fromRGB(255, 0, 255)},
    {"💫 Fly All", "flyall", Color3.fromRGB(100, 100, 255)},
    {"🌀 Vortex", "vortex", Color3.fromRGB(150, 0, 255)},
    {"💀 Instant Kill", "instantkill", Color3.fromRGB(255, 0, 0)},
    {"🎆 Firework", "firework", Color3.fromRGB(255, 200, 0)},
}

-- ========== VARIABEL GLOBAL ==========
local flyActive = false
local invisibleActive = false
local godActive = false
local noclipActive = false
local loopKillActive = false
local antikillActive = false
local espActive = false
local rainbowActive = false
local bodyVelocity = Instance.new("BodyVelocity")
bodyVelocity.MaxForce = Vector3.new(1,1,1) * 10000

-- ========== FUNGSI GET TARGET ==========
function getTargetPlayer()
    local closest = nil
    local dist = math.huge
    for _, plr in pairs(game.Players:GetPlayers()) do
        if plr ~= player and plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then
            local newDist = (plr.Character.HumanoidRootPart.Position - rootPart.Position).Magnitude
            if newDist < dist then
                dist = newDist
                closest = plr
            end
        end
    end
    return closest
end

-- ========== BUAT TOMBOL ==========
local function createButton(text, action, color)
    local button = Instance.new("TextButton")
    button.Size = UDim2.new(0.9, 0, 0, 32)
    button.BackgroundColor3 = color
    button.Text = text
    button.TextColor3 = Color3.fromRGB(255, 255, 255)
    button.Font = Enum.Font.GothamMedium
    button.TextSize = 14
    button.Parent = scrollingFrame
    
    button.MouseEnter:Connect(function()
        button.BackgroundColor3 = color + Color3.fromRGB(40, 40, 40)
    end)
    button.MouseLeave:Connect(function()
        button.BackgroundColor3 = color
    end)
    
    button.MouseButton1Click:Connect(function()
        if action == "fly" then toggleFly() end
        if action == "speed" then speedHack() end
        if action == "invisible" then toggleInvisible() end
        if action == "god" then toggleGod() end
        if action == "kill" then killAll() end
        if action == "spin" then spinPlayer() end
        if action == "explode" then explodeAll() end
        if action == "freeze" then freezePlayer() end
        if action == "spam" then itemSpam() end
        if action == "earrape" then earRape() end
        if action == "fling" then flingPlayer() end
        if action == "aimbot" then aimBot() end
        if action == "teleport" then teleportAll() end
        if action == "cage" then cagePlayer() end
        if action == "noclip" then toggleNoclip() end
        if action == "fire" then fireTrail() end
        if action == "loopkill" then loopKill() end
        if action == "morph" then morphPlayer() end
        if action == "bomb" then bombSpam() end
        if action == "tornado" then tornado() end
        if action == "smash" then smashPlayer() end
        if action == "wave" then waveSpam() end
        if action == "jump" then superJump() end
        if action == "antikill" then toggleAntiKill() end
        if action == "esp" then toggleESP() end
        if action == "rainbow" then rainbowMode() end
        if action == "flyall" then flyAll() end
        if action == "vortex" then vortex() end
        if action == "instantkill" then instantKill() end
        if action == "firework" then firework() end
    end)
    return button
end

-- ==========================================
-- ========== 30 FUNGSI FITUR ==========
-- ==========================================

-- 1. FLY
function toggleFly()
    flyActive = not flyActive
    if flyActive then
        bodyVelocity.Parent = rootPart
        humanoid.PlatformStand = true
        -- Kontrol Fly dengan WASD + Space
        spawn(function()
            while flyActive do
                local moveDir = Vector3.new()
                if game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.W) then
                    moveDir = moveDir + workspace.CurrentCamera.CFrame.LookVector
                end
                if game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.S) then
                    moveDir = moveDir - workspace.CurrentCamera.CFrame.LookVector
                end
                if game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.A) then
                    moveDir = moveDir - workspace.CurrentCamera.CFrame.RightVector
                end
                if game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.D) then
                    moveDir = moveDir + workspace.CurrentCamera.CFrame.RightVector
                end
                if game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.Space) then
                    moveDir = moveDir + Vector3.new(0, 1, 0)
                end
                if game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.LeftShift) then
                    moveDir = moveDir - Vector3.new(0, 1, 0)
                end
                if moveDir.Magnitude > 0 then
                    bodyVelocity.Velocity = moveDir.Unit * 60
                else
                    bodyVelocity.Velocity = Vector3.new(0, 0, 0)
                end
                wait(0.05)
            end
        end)
        print("✅ Fly ON")
    else
        bodyVelocity.Parent = nil
        humanoid.PlatformStand = false
        bodyVelocity.Velocity = Vector3.new(0,0,0)
        print("❌ Fly OFF")
    end
end

-- 2. SPEED HACK
function speedHack()
    local oldSpeed = humanoid.WalkSpeed
    local oldJump = humanoid.JumpPower
    humanoid.WalkSpeed = 100
    humanoid.JumpPower = 80
    print("⚡ Speed ON")
    wait(10)
    humanoid.WalkSpeed = oldSpeed
    humanoid.JumpPower = oldJump
    print("⏹️ Speed OFF")
end

-- 3. INVISIBLE
function toggleInvisible()
    invisibleActive = not invisibleActive
    if invisibleActive then
        for _, part in pairs(character:GetDescendants()) do
            if part:IsA("BasePart") then
                part.Transparency = 1
            end
        end
        print("👻 Invisible ON")
    else
        for _, part in pairs(character:GetDescendants()) do
            if part:IsA("BasePart") then
                part.Transparency = 0
            end
        end
        print("👀 Invisible OFF")
    end
end

-- 4. GOD MODE
function toggleGod()
    godActive = not godActive
    if godActive then
        humanoid.MaxHealth = math.huge
        humanoid.Health = math.huge
        print("🛡️ God Mode ON")
    else
        humanoid.MaxHealth = 100
        humanoid.Health = 100
        print("🛡️ God Mode OFF")
    end
end

-- 5. KILL ALL
function killAll()
    for _, plr in pairs(game.Players:GetPlayers()) do
        if plr ~= player and plr.Character and plr.Character:FindFirstChild("Humanoid") then
            plr.Character.Humanoid.Health = 0
        end
    end
    print("💀 Kill All!")
end

-- 6. SPIN PLAYER
function spinPlayer()
    for _, plr in pairs(game.Players:GetPlayers()) do
        if plr ~= player and plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then
            local spin = Instance.new("BodyAngularVelocity")
            spin.Parent = plr.Character.HumanoidRootPart
            spin.AngularVelocity = Vector3.new(0, 100, 0)
            spin.MaxTorque = Vector3.new(0, 4000, 0)
            game:GetService("Debris"):AddItem(spin, 5)
        end
    end
    print("🌀 Spin!")
end

-- 7. EXPLODE ALL
function explodeAll()
    for _, plr in pairs(game.Players:GetPlayers()) do
        if plr ~= player and plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then
            local explosion = Instance.new("Explosion")
            explosion.Position = plr.Character.HumanoidRootPart.Position
            explosion.BlastRadius = 10
            explosion.BlastPressure = 100000
            explosion.Parent = workspace
        end
    end
    print("💥 Explode!")
end

-- 8. FREEZE PLAYER
function freezePlayer()
    for _, plr in pairs(game.Players:GetPlayers()) do
        if plr ~= player and plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then
            local freezePart = Instance.new("Part")
            freezePart.Size = Vector3.new(5, 1, 5)
            freezePart.Position = plr.Character.HumanoidRootPart.Position
            freezePart.Anchored = true
            freezePart.Transparency = 0.5
            freezePart.BrickColor = BrickColor.new("Bright blue")
            freezePart.Parent = workspace
            game:GetService("Debris"):AddItem(freezePart, 5)
        end
    end
    print("❄️ Freeze!")
end

-- 9. ITEM SPAM
function itemSpam()
    for i = 1, 50 do
        local part = Instance.new("Part")
        part.Size = Vector3.new(1,1,1)
        part.Position = character.HumanoidRootPart.Position + Vector3.new(math.random(-20,20), math.random(0,10), math.random(-20,20))
        part.BrickColor = BrickColor.random()
        part.Anchored = false
        part.Parent = workspace
        game:GetService("Debris"):AddItem(part, 10)
    end
    print("📦 Spam!")
end

-- 10. EAR RAPE
function earRape()
    for i = 1, 10 do
        local sound = Instance.new("Sound")
        sound.SoundId = "rbxassetid://9120259456"
        sound.Volume = 10
        sound.PlayOnRemove = true
        sound.Parent = character
        sound:Play()
        game:GetService("Debris"):AddItem(sound, 0.5)
        wait(0.1)
    end
    print("🔊 Ear Rape!")
end

-- 11. FLING PLAYER
function flingPlayer()
    local target = getTargetPlayer()
    if target and target.Character and target.Character:FindFirstChild("HumanoidRootPart") then
        local flingPart = target.Character.HumanoidRootPart
        local flingForce = Instance.new("BodyVelocity")
        flingForce.Velocity = Vector3.new(math.random(-500, 500), 500, math.random(-500, 500))
        flingForce.MaxForce = Vector3.new(10000, 10000, 10000)
        flingForce.Parent = flingPart
        game:GetService("Debris"):AddItem(flingForce, 1)
        print("🌀 Fling "..target.Name)
    end
end

-- 12. AIM BOT
function aimBot()
    local target = getTargetPlayer()
    if target and target.Character and target.Character:FindFirstChild("HumanoidRootPart") then
        spawn(function()
            while true do
                if target and target.Character then
                    local hrp = target.Character.HumanoidRootPart
                    if hrp then
                        rootPart.CFrame = CFrame.new(rootPart.Position, hrp.Position)
                    end
                end
                wait(0.1)
            end
        end)
        print("🎯 AimBot ON "..target.Name)
    end
end

-- 13. TELEPORT ALL
function teleportAll()
    for _, plr in pairs(game.Players:GetPlayers()) do
        if plr ~= player and plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then
            plr.Character.HumanoidRootPart.CFrame = character.HumanoidRootPart.CFrame + Vector3.new(math.random(-20,20), 0, math.random(-20,20))
        end
    end
    print("🪄 Teleport!")
end

-- 14. CAGE PLAYER
function cagePlayer()
    local target = getTargetPlayer()
    if target and target.Character and target.Character:FindFirstChild("HumanoidRootPart") then
        local pos = target.Character.HumanoidRootPart.Position
        for i = 1, 8 do
            local angle = (i/8) * math.pi * 2
            local cagePart = Instance.new("Part")
            cagePart.Size = Vector3.new(0.5, 8, 0.5)
            cagePart.Position = pos + Vector3.new(math.sin(angle) * 4, 0, math.cos(angle) * 4)
            cagePart.Anchored = true
            cagePart.BrickColor = BrickColor.new("Bright red")
            cagePart.Parent = workspace
            game:GetService("Debris"):AddItem(cagePart, 10)
        end
        local topPart = Instance.new("Part")
        topPart.Size = Vector3.new(8, 0.5, 8)
        topPart.Position = pos + Vector3.new(0, 4, 0)
        topPart.Anchored = true
        topPart.BrickColor = BrickColor.new("Bright red")
        topPart.Transparency = 0.5
        topPart.Parent = workspace
        game:GetService("Debris"):AddItem(topPart, 10)
        print("🔒 Cage "..target.Name)
    end
end

-- 15. NOCLIP
function toggleNoclip()
    noclipActive = not noclipActive
    if noclipActive then
        spawn(function()
            while noclipActive do
                for _, part in pairs(character:GetDescendants()) do
                    if part:IsA("BasePart") then
                        part.CanCollide = false
                    end
                end
                wait(0.1)
            end
        end)
        print("💫 Noclip ON")
    else
        for _, part in pairs(character:GetDescendants()) do
            if part:IsA("BasePart") then
                part.CanCollide = true
            end
        end
        print("💫 Noclip OFF")
    end
end

-- 16. FIRE TRAIL
function fireTrail()
    spawn(function()
        while true do
            local fire = Instance.new("Fire")
            fire.Parent = rootPart
            fire.Size = 10
            fire.Heat = 10
            wait(0.5)
            fire:Destroy()
        end
    end)
    print("🔥 Fire Trail!")
end

-- 17. LOOP KILL
function loopKill()
    loopKillActive = not loopKillActive
    if loopKillActive then
        spawn(function()
            while loopKillActive do
                for _, plr in pairs(game.Players:GetPlayers()) do
                    if plr ~= player and plr.Character and plr.Character:FindFirstChild("Humanoid") then
                        plr.Character.Humanoid.Health = 0
                    end
                end
                wait(1)
            end
        end)
        print("⚡ Loop Kill ON")
    else
        print("⚡ Loop Kill OFF")
    end
end

-- 18. MORPH
function morphPlayer()
    local target = getTargetPlayer()
    if target and target.Character then
        for _, part in pairs(character:GetChildren()) do
            if part:IsA("BasePart") then
                part:Destroy()
            end
        end
        for _, part in pairs(target.Character:GetChildren()) do
            if part:IsA("BasePart") then
                local newPart = part:Clone()
                newPart.Parent = character
            end
        end
        print("🎭 Morph to "..target.Name)
    end
end

-- 19. BOMB SPAM
function bombSpam()
    for i = 1, 20 do
        local bomb = Instance
