local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local Reach = Instance.new("TextButton")
local Title = Instance.new("TextLabel")

ScreenGui.Name = "VALHALLA⚡"
ScreenGui.Parent = game.CoreGui
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

Frame.Parent = ScreenGui
Frame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
Frame.BorderSizePixel = 0
Frame.Position = UDim2.new(0.08, 0, 0.2, 0)
Frame.Size = UDim2.new(0, 170, 0, 100)
Frame.Active = true
Frame.Draggable = true

Title.Name = "Title"
Title.Parent = Frame
Title.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
Title.BorderSizePixel = 0
Title.Size = UDim2.new(1, 0, 0.3, 0)
Title.Font = Enum.Font.FredokaOne
Title.Text = "Bảo Minh Dev | VALHALLA⚡"
Title.TextColor3 = Color3.fromRGB(255, 255, 0)
Title.TextSize = 16

Reach.Name = "Reach"
Reach.Parent = Frame
Reach.BackgroundColor3 = Color3.fromRGB(71, 71, 71)
Reach.BorderSizePixel = 0
Reach.Position = UDim2.new(0.04, 0, 0.45, 0)
Reach.Size = UDim2.new(0, 155, 0, 40)
Reach.Font = Enum.Font.GothamBlack
Reach.Text = "BẬT VALHALLA⚡"
Reach.TextColor3 = Color3.fromRGB(255, 255, 255)
Reach.TextSize = 14

local isOn = false
Reach.MouseButton1Down:Connect(function()
    local sound = Instance.new("Sound")
    sound.SoundId = "rbxassetid://413861777"
    sound.Parent = game:GetService("SoundService")
    sound:Play()

    wait()
    game.StarterGui:SetCore("SendNotification", {
        Title = "VALHALLA⚡";
        Text = "Tính năng Reach đã " .. (isOn and "TẮT" or "BẬT");
        Duration = 4;
    })

    if not isOn then
        for i, v in pairs(game:GetService("Players").LocalPlayer.Character:GetChildren()) do
            if v:IsA("Tool") then
                local a = Instance.new("SelectionBox", v.Handle)
                v.Handle.Massless = true
                v.Handle.Transparency = 1
                a.Adornee = v.Handle
                v.Handle.Size = Vector3.new(30, 30, 30)
                local selectionBox = Instance.new("SelectionBox", v.Handle)
                selectionBox.Adornee = v.Handle
                selectionBox.Color3 = Color3.new(0, 0.5, 1)
            end
        end
        Reach.Text = "TẮT | VALHALLA⚡"
    else
        for i, v in pairs(game:GetService("Players").LocalPlayer.Character:GetDescendants()) do
            if v:IsA("SelectionBox") then
                v:Destroy()
            end
            if v:IsA("Tool") and v:FindFirstChild("Handle") then
                v.Handle.Size = Vector3.new(1,1,1)
                v.Handle.Transparency = 0
            end
        end
        Reach.Text = "BẬT | VALHALL⚡A"
    end
    isOn = not isOn
end)
