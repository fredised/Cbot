local Players = game:GetService("Players")
local UIS = game:GetService("UserInputService")
local RS = game:GetService("RunService")
local Camera = workspace.CurrentCamera
local LP = Players.LocalPlayer
local Mouse = LP:GetMouse()

local Aimlock = false
local PredictMovement = false
local BoxESP = false
local NameESP = false
local HealthESP = false
local FOVToggle = false

local FOVRadius = 150
local PredictionAmount = 0.11

local FOVCircle = Drawing.new("Circle")
FOVCircle.Visible = false
FOVCircle.Thickness = 2
FOVCircle.Color = Color3.fromRGB(0, 255, 255)
FOVCircle.Filled = false
FOVCircle.Radius = FOVRadius
FOVCircle.Transparency = 0.8

local CurrentTarget

local function GetClosestPlayer()
	local closest, shortest = nil, math.huge
	for _, player in pairs(Players:GetPlayers()) do
		if player ~= LP and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
			local pos, visible = Camera:WorldToViewportPoint(player.Character.HumanoidRootPart.Position)
			local mousePos = UIS:GetMouseLocation()
			local mouseDist = (Vector2.new(mousePos.X, mousePos.Y) - Vector2.new(pos.X, pos.Y)).Magnitude
			if visible and mouseDist < FOVRadius and mouseDist < shortest then
				closest = player
				shortest = mouseDist
			end
		end
	end
	return closest
end

RS.RenderStepped:Connect(function()
	local mousePos = UIS:GetMouseLocation()
	FOVCircle.Position = Vector2.new(mousePos.X, mousePos.Y)
	FOVCircle.Visible = FOVToggle

	if Aimlock and CurrentTarget and CurrentTarget.Character and CurrentTarget.Character:FindFirstChild("HumanoidRootPart") then
		local part = CurrentTarget.Character.HumanoidRootPart
		local pos = part.Position
		if PredictMovement and part.Velocity then
			pos += (part.Velocity * PredictionAmount)
		end
		Camera.CFrame = CFrame.new(Camera.CFrame.Position, pos)
	end
end)

local Drawings = {}

local function CreateESP(plr)
	if plr == LP then return end

	local box = Drawing.new("Square")
	box.Color = Color3.fromRGB(255, 255, 255)
	box.Thickness = 1
	box.Filled = false
	box.Visible = false

	local name = Drawing.new("Text")
	name.Size = 13
	name.Center = true
	name.Outline = true
	name.Color = Color3.fromRGB(255, 255, 255)
	name.Visible = false

	local health = Drawing.new("Text")
	health.Size = 13
	health.Center = true
	health.Outline = true
	health.Color = Color3.fromRGB(0, 255, 0)
	health.Visible = false

	Drawings[plr] = {box = box, name = name, health = health}

	RS.RenderStepped:Connect(function()
		local char = plr.Character
		if not char or not char:FindFirstChild("HumanoidRootPart") then
			box.Visible = false
			name.Visible = false
			health.Visible = false
			return
		end

		local cframe, size = char:GetBoundingBox()
		local center = cframe.Position
		local tl = Camera:WorldToViewportPoint(center - size / 2)
		local br = Camera:WorldToViewportPoint(center + size / 2)

		local screenSize = Vector2.new(math.abs(br.X - tl.X), math.abs(br.Y - tl.Y)) * 1.2
		local screenPos = Vector2.new((tl.X + br.X) / 2, (tl.Y + br.Y) / 2)

		box.Position = Vector2.new(screenPos.X - screenSize.X / 2, screenPos.Y - screenSize.Y / 2)
		box.Size = screenSize
		box.Visible = BoxESP

		name.Position = Vector2.new(screenPos.X, screenPos.Y - screenSize.Y / 2 - 14)
		name.Text = plr.Name
		name.Visible = NameESP

		local humanoid = char:FindFirstChildOfClass("Humanoid")
		if humanoid then
			health.Position = Vector2.new(screenPos.X, screenPos.Y + screenSize.Y / 2 + 2)
			health.Text = "HP: " .. math.floor(humanoid.Health)
			health.Visible = HealthESP
		end
	end)
end

for _, p in pairs(Players:GetPlayers()) do CreateESP(p) end
Players.PlayerAdded:Connect(CreateESP)

UIS.InputBegan:Connect(function(input, gpe)
	if gpe then return end
	local key = input.KeyCode
	if key == Enum.KeyCode.Q then
		Aimlock = not Aimlock
		CurrentTarget = Aimlock and GetClosestPlayer() or nil
		print("Aimlock:", Aimlock)
	elseif key == Enum.KeyCode.P then
		PredictMovement = not PredictMovement
		print("Prediction:", PredictMovement)
	elseif key == Enum.KeyCode.E then
		BoxESP = not BoxESP
	elseif key == Enum.KeyCode.N then
		NameESP = not NameESP
	elseif key == Enum.KeyCode.H then
		HealthESP = not HealthESP
	elseif key == Enum.KeyCode.F then
		FOVToggle = not FOVToggle
	end
end)

print("[Cbot] Loaded | Q=Aimlock | P=Prediction | E/N/H=ESP | F=FOV")
