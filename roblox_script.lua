local discordLink = "https://discord.gg/Gs2XpaRb24"
    local url = "https://raw.githubusercontent.com/SilentIsPrivate/SilentHubKeys/main/daily_key.txt"
    local response = game:HttpGet(url)
    return response
end


local correctKey = fetchDailyKey()

-- Create a ScreenGui
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = game.CoreGui

-- Create a Frame
local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 400, 0, 300)
frame.Position = UDim2.new(0.5, -200, 0.5, -150)
frame.BackgroundColor3 = Color3.new(0.1, 0.1, 0.1)
frame.BorderSizePixel = 0
frame.Parent = screenGui

-- Make the frame draggable
local dragging, dragInput, dragStart, startPos

local function update(input)
    local delta = input.Position - dragStart
    frame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
end

frame.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startPos = frame.Position

        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)

frame.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
        dragInput = input
    end
end)

game:GetService("UserInputService").InputChanged:Connect(function(input)
    if input == dragInput and dragging then
        update(input)
    end
end)

-- Create a UICorner for rounded corners
local uiCorner = Instance.new("UICorner")
uiCorner.CornerRadius = UDim.new(0, 15)
uiCorner.Parent = frame

-- Create a title label
local titleLabel = Instance.new("TextLabel")
titleLabel.Size = UDim2.new(1, 0, 0, 50)
titleLabel.Position = UDim2.new(0, 0, 0, 0)
titleLabel.Text = "Silent Hub Key System"
titleLabel.Font = Enum.Font.SourceSansBold
titleLabel.TextSize = 24
titleLabel.BackgroundColor3 = Color3.new(0.15, 0.15, 0.15)
titleLabel.TextColor3 = Color3.new(1, 1, 1)
titleLabel.BorderSizePixel = 0
titleLabel.Parent = frame

-- Create a UICorner for rounded corners on title label
local titleCorner = Instance.new("UICorner")
titleCorner.CornerRadius = UDim.new(0, 15)
titleCorner.Parent = titleLabel

-- Create a TextBox for key input
local textBox = Instance.new("TextBox")
textBox.Size = UDim2.new(0, 360, 0, 50)
textBox.Position = UDim2.new(0.5, -180, 0.5, -40)
textBox.PlaceholderText = "Enter the key"
textBox.Text = ""
textBox.Font = Enum.Font.SourceSans
textBox.TextSize = 20
textBox.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
textBox.TextColor3 = Color3.new(1, 1, 1)
textBox.BorderSizePixel = 0
textBox.Parent = frame

-- Create a UICorner for rounded corners on TextBox
local textBoxCorner = Instance.new("UICorner")
textBoxCorner.CornerRadius = UDim.new(0, 10)
textBoxCorner.Parent = textBox

-- Create a TextButton for submission
local submitButton = Instance.new("TextButton")
submitButton.Size = UDim2.new(0, 360, 0, 50)
submitButton.Position = UDim2.new(0.5, -180, 0.5, 20)
submitButton.Text = "Submit"
submitButton.Font = Enum.Font.SourceSans
submitButton.TextSize = 20
submitButton.BackgroundColor3 = Color3.new(0.3, 0.3, 0.3)
submitButton.TextColor3 = Color3.new(1, 1, 1)
submitButton.BorderSizePixel = 0
submitButton.Parent = frame

-- Create a UICorner for rounded corners on Submit Button
local submitButtonCorner = Instance.new("UICorner")
submitButtonCorner.CornerRadius = UDim.new(0, 10)
submitButtonCorner.Parent = submitButton

-- Create a TextButton for copying Discord link
local copyButton = Instance.new("TextButton")
copyButton.Size = UDim2.new(0, 360, 0, 50)
copyButton.Position = UDim2.new(0.5, -180, 0.5, 80)
copyButton.Text = "Get Key"
copyButton.Font = Enum.Font.SourceSans
copyButton.TextSize = 20
copyButton.BackgroundColor3 = Color3.new(0.3, 0.3, 0.3)
copyButton.TextColor3 = Color3.new(1, 1, 1)
copyButton.BorderSizePixel = 0
copyButton.Parent = frame

-- Create a UICorner for rounded corners on Copy Button
local copyButtonCorner = Instance.new("UICorner")
copyButtonCorner.CornerRadius = UDim.new(0, 10)
copyButtonCorner.Parent = copyButton

-- Function to check the key and execute the script
local function checkKeyAndExecute()
    if textBox.Text == correctKey then
        print("Key accepted! Here is the Discord server link:")
        print(discordLink)
        -- Execute the script
        loadstring(game:HttpGet("https://raw.githubusercontent.com/SilentIsPrivate/idk/main/unknown"))()
        frame:Destroy() -- Remove the GUI after successful entry
    else
        textBox.Text = ""
        textBox.PlaceholderText = "Incorrect key, try again"
    end
end

-- Function to copy the Discord link to the clipboard
local function copyToClipboard()
    setclipboard(discordLink)
    copyButton.Text = "Link Copied!"
    wait(2)
    copyButton.Text = "Get Key"
end

-- Animation for TextBox on focus
textBox.Focused:Connect(function()
    textBox:TweenSize(UDim2.new(0, 360, 0, 60), Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.2, true)
end)

-- Animation for TextBox on focus loss
textBox.FocusLost:Connect(function()
    textBox:TweenSize(UDim2.new(0, 360, 0, 50), Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.2, true)
end)

-- Connect the button click to the checkKeyAndExecute function
submitButton.MouseButton1Click:Connect(checkKeyAndExecute)

-- Connect the button click to the copyToClipboard function
copyButton.MouseButton1Click:Connect(copyToClipboard)

-- Initial animation for frame appearance
frame.Position = UDim2.new(0.5, -200, 1, 0)
frame:TweenPosition(UDim2.new(0.5, -200, 0.5, -150), Enum.EasingDirection.Out, Enum.EasingStyle.Bounce, 1, true)
