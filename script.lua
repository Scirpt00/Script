--// ==================================================
--// SCRIPT SIMPLES | Fling + Speed + Jump
--// por Dark | Delta Mobile
--// ==================================================
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local LocalPlayer = Players.LocalPlayer

--// ==================================================
--// GUI
--// ==================================================
local parentGui = gethui and gethui() or game:GetService("CoreGui")
local old = parentGui:FindFirstChild("SimpleGui_Dark")
if old then old:Destroy() end

local gui = Instance.new("ScreenGui")
gui.Name = "SimpleGui_Dark"
gui.ResetOnSpawn = false
gui.Parent = parentGui

-- ============ BOTÃO FLING ============
local btnFling = Instance.new("TextButton")
btnFling.Size = UDim2.new(0, 120, 0, 50)
btnFling.Position = UDim2.new(0.05, 0, 0.3, 0)
btnFling.BackgroundColor3 = Color3.fromRGB(120, 0, 0)
btnFling.Text = "FLING: OFF"
btnFling.TextColor3 = Color3.fromRGB(255, 255, 255)
btnFling.TextScaled = true
btnFling.Font = Enum.Font.GothamBold
btnFling.Parent = gui

-- ============ SLIDER VELOCIDADE ============
local lblSpeed = Instance.new("TextLabel")
lblSpeed.Size = UDim2.new(0, 120, 0, 25)
lblSpeed.Position = UDim2.new(0.05, 0, 0.42, 0)
lblSpeed.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
lblSpeed.Text = "Speed: 16"
lblSpeed.TextColor3 = Color3.fromRGB(255, 255, 255)
lblSpeed.TextScaled = true
lblSpeed.Font = Enum.Font.Gotham
lblSpeed.Parent = gui

local btnSpeedUp = Instance.new("TextButton")
btnSpeedUp.Size = UDim2.new(0, 55, 0, 40)
btnSpeedUp.Position = UDim2.new(0.05, 0, 0.47, 0)
btnSpeedUp.BackgroundColor3 = Color3.fromRGB(0, 100, 0)
btnSpeedUp.Text = "+10"
btnSpeedUp.TextColor3 = Color3.fromRGB(255, 255, 255)
btnSpeedUp.TextScaled = true
btnSpeedUp.Font = Enum.Font.GothamBold
btnSpeedUp.Parent = gui

local btnSpeedDown = Instance.new("TextButton")
btnSpeedDown.Size = UDim2.new(0, 55, 0, 40)
btnSpeedDown.Position = UDim2.new(0.11, 0, 0.47, 0)
btnSpeedDown.BackgroundColor3 = Color3.fromRGB(100, 0, 0)
btnSpeedDown.Text = "-10"
btnSpeedDown.TextColor3 = Color3.fromRGB(255, 255, 255)
btnSpeedDown.TextScaled = true
btnSpeedDown.Font = Enum.Font.GothamBold
btnSpeedDown.Parent = gui

-- ============ SLIDER PULO ============
local lblJump = Instance.new("TextLabel")
lblJump.Size = UDim2.new(0, 120, 0, 25)
lblJump.Position = UDim2.new(0.05, 0, 0.55, 0)
lblJump.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
lblJump.Text = "Jump: 50"
lblJump.TextColor3 = Color3.fromRGB(255, 255, 255)
lblJump.TextScaled = true
lblJump.Font = Enum.Font.Gotham
lblJump.Parent = gui

local btnJumpUp = Instance.new("TextButton")
btnJumpUp.Size = UDim2.new(0, 55, 0, 40)
btnJumpUp.Position = UDim2.new(0.05, 0, 0.6, 0)
btnJumpUp.BackgroundColor3 = Color3.fromRGB(0, 100, 0)
btnJumpUp.Text = "+50"
btnJumpUp.TextColor3 = Color3.fromRGB(255, 255, 255)
btnJumpUp.TextScaled = true
btnJumpUp.Font = Enum.Font.GothamBold
btnJumpUp.Parent = gui

local btnJumpDown = Instance.new("TextButton")
btnJumpDown.Size = UDim2.new(0, 55, 0, 40)
btnJumpDown.Position = UDim2.new(0.11, 0, 0.6, 0)
btnJumpDown.BackgroundColor3 = Color3.fromRGB(100, 0, 0)
btnJumpDown.Text = "-50"
btnJumpDown.TextColor3 = Color3.fromRGB(255, 255, 255)
btnJumpDown.TextScaled = true
btnJumpDown.Font = Enum.Font.GothamBold
btnJumpDown.Parent = gui

-- ============ BOTÃO RESETAR ============
local btnReset = Instance.new("TextButton")
btnReset.Size = UDim2.new(0, 120, 0, 40)
btnReset.Position = UDim2.new(0.05, 0, 0.68, 0)
btnReset.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
btnReset.Text = "RESETAR"
btnReset.TextColor3 = Color3.fromRGB(255, 255, 255)
btnReset.TextScaled = true
btnReset.Font = Enum.Font.GothamBold
btnReset.Parent = gui

--// ==================================================
--// VARIÁVEIS
--// ==================================================
local FlingEnabled = false
local SpeedVal = 16
local JumpVal = 50

--// ==================================================
--// FUNÇÕES - VELOCIDADE E PULO
--// ==================================================
local function aplicarSpeed()
    local char = LocalPlayer.Character
    if char then
        local hum = char:FindFirstChildOfClass("Humanoid")
        if hum then
            hum.WalkSpeed = SpeedVal
        end
    end
    lblSpeed.Text = "Speed: " .. SpeedVal
end

local function aplicarJump()
    local char = LocalPlayer.Character
    if char then
        local hum = char:FindFirstChildOfClass("Humanoid")
        if hum then
            hum.UseJumpPower = true
            hum.JumpPower = JumpVal
        end
    end
    lblJump.Text = "Jump: " .. JumpVal
end

--// ==================================================
--// BOTÕES
--// ==================================================
btnFling.Activated:Connect(function()
    FlingEnabled = not FlingEnabled
    btnFling.BackgroundColor3 = FlingEnabled and Color3.fromRGB(255, 0, 0) or Color3.fromRGB(120, 0, 0)
    btnFling.Text = FlingEnabled and "FLING: ON" or "FLING: OFF"
end)

btnSpeedUp.Activated:Connect(function()
    SpeedVal = SpeedVal + 10
    aplicarSpeed()
end)

btnSpeedDown.Activated:Connect(function()
    SpeedVal = math.max(16, SpeedVal - 10)
    aplicarSpeed()
end)

btnJumpUp.Activated:Connect(function()
    JumpVal = JumpVal + 50
    aplicarJump()
end)

btnJumpDown.Activated:Connect(function()
    JumpVal = math.max(50, JumpVal - 50)
    aplicarJump()
end)

btnReset.Activated:Connect(function()
    SpeedVal = 16
    JumpVal = 50
    aplicarSpeed()
    aplicarJump()
end)

--// ==================================================
--// LOOP DO FLING
--// ==================================================
RunService.Heartbeat:Connect(function()
    if not FlingEnabled then return end
    
    local myChar = LocalPlayer.Character
    if not myChar then return end
    local myHRP = myChar:FindFirstChild("HumanoidRootPart")
    if not myHRP then return end
    
    for _, p in pairs(Players:GetPlayers()) do
        if p ~= LocalPlayer and p.Character then
            local hrp = p.Character:FindFirstChild("HumanoidRootPart")
            if hrp then
                local dist = (hrp.Position - myHRP.Position).Magnitude
                if dist < 5 then
                    hrp.CFrame = hrp.CFrame * CFrame.Angles(math.rad(90), math.rad(90), math.rad(90))
                    hrp.AssemblyLinearVelocity = Vector3.new(0, 50000, 0)
                end
            end
        end
    end
end)

--// ==================================================
--// RESPAWN - reaplica velocidade e pulo
--// ==================================================
LocalPlayer.CharacterAdded:Connect(function()
    task.wait(1)
    aplicarSpeed()
    aplicarJump()
end)

print("=====================================")
print("✅ SCRIPT SIMPLES CARREGADO")
print("• FLING: joga quem chegar perto")
print("• Speed: +/- velocidade")
print("• Jump: +/- pulo")
print("por Dark")
print("=====================================")
