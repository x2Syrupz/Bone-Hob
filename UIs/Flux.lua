local Flux = {RainbowColorValue = 0, HueSelectionPosition = 0}
local PresetColor = Color3.fromRGB(66, 134, 255)
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local LocalPlayer = game:GetService("Players").LocalPlayer
local Mouse = LocalPlayer:GetMouse()
local CloseBind = Enum.KeyCode.RightControl

local FluxLib = Instance.new("ScreenGui")
FluxLib.Name = "FluxLib"
FluxLib.Parent = game.CoreGui
FluxLib.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

coroutine.wrap(
	function()
		while wait() do
			Flux.RainbowColorValue = Flux.RainbowColorValue + 1 / 255
			Flux.HueSelectionPosition = Flux.HueSelectionPosition + 1

			if Flux.RainbowColorValue >= 1 then
				Flux.RainbowColorValue = 0
			end

			if Flux.HueSelectionPosition == 80 then
				Flux.HueSelectionPosition = 0
			end
		end
	end
)()

local function MakeDraggable(topbarobject, object)
	local Dragging = nil
	local DragInput = nil
	local DragStart = nil
	local StartPosition = nil

	local function Update(input)
		local Delta = input.Position - DragStart
		local pos =
			UDim2.new(
				StartPosition.X.Scale,
				StartPosition.X.Offset + Delta.X,
				StartPosition.Y.Scale,
				StartPosition.Y.Offset + Delta.Y
			)
		object.Position = pos
	end

	topbarobject.InputBegan:Connect(
		function(input)
			if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
				Dragging = true
				DragStart = input.Position
				StartPosition = object.Position

				input.Changed:Connect(
					function()
						if input.UserInputState == Enum.UserInputState.End then
							Dragging = false
						end
					end
				)
			end
		end
	)

	topbarobject.InputChanged:Connect(
		function(input)
			if
				input.UserInputType == Enum.UserInputType.MouseMovement or
					input.UserInputType == Enum.UserInputType.Touch
			then
				DragInput = input
			end
		end
	)

	UserInputService.InputChanged:Connect(
		function(input)
			if input == DragInput and Dragging then
				Update(input)
			end
		end
	)
end



function Flux:Window(text, bottom,mainclr,toclose)
	CloseBind = toclose or Enum.KeyCode.RightControl
	PresetColor = mainclr or Color3.fromRGB(66, 134, 255)
	local fs = false
	local MainFrame = Instance.new("Frame")
	local MainCorner = Instance.new("UICorner")
	local LeftFrame = Instance.new("Frame")
	local LeftCorner = Instance.new("UICorner")
	local GlowTabHolder = Instance.new("ImageLabel")
	local Title = Instance.new("TextLabel")
	local BottomText = Instance.new("TextLabel")
	local TabHold = Instance.new("Frame")
	local TabLayout = Instance.new("UIListLayout")
	local Drag = Instance.new("Frame")
	local ContainerFolder = Instance.new("Folder")

	MainFrame.Name = "MainFrame"
	MainFrame.Parent = FluxLib
	MainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
	MainFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	MainFrame.ClipsDescendants = true
	MainFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
	MainFrame.Size = UDim2.new(0, 0, 0, 0)

	MainCorner.CornerRadius = UDim.new(0, 5)
	MainCorner.Name = "MainCorner"
	MainCorner.Parent = MainFrame

	LeftFrame.Name = "LeftFrame"
	LeftFrame.Parent = MainFrame
	LeftFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	LeftFrame.Size = UDim2.new(0, 205, 0, 484)

	LeftCorner.CornerRadius = UDim.new(0, 5)
	LeftCorner.Name = "LeftCorner"
	LeftCorner.Parent = LeftFrame

	GlowTabHolder.Name = "GlowTabHolder"
	GlowTabHolder.Parent = LeftFrame
	GlowTabHolder.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	GlowTabHolder.BackgroundTransparency = 1.000
	GlowTabHolder.BorderSizePixel = 0
	GlowTabHolder.Position = UDim2.new(0, -15, 0, -15)
	GlowTabHolder.Size = UDim2.new(1, 30, 1, 30)
	GlowTabHolder.ZIndex = 0
	GlowTabHolder.Image = "rbxassetid://4996891970"
	GlowTabHolder.ImageColor3 = Color3.fromRGB(15, 15, 15)
	GlowTabHolder.ScaleType = Enum.ScaleType.Slice
	GlowTabHolder.SliceCenter = Rect.new(20, 20, 280, 280)

	Title.Name = "Title"
	Title.Parent = LeftFrame
	Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Title.BackgroundTransparency = 1.000
	Title.Position = UDim2.new(0.097560972, 0, 0.0475206636, 0)
	Title.Size = UDim2.new(0, 111, 0, 34)
	Title.Font = Enum.Font.GothamBold
	Title.Text = text
	Title.TextColor3 = Color3.fromRGB(255, 255, 255)
	Title.TextSize = 25.000
	Title.TextXAlignment = Enum.TextXAlignment.Left

	BottomText.Name = "BottomText"
	BottomText.Parent = LeftFrame
	BottomText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	BottomText.BackgroundTransparency = 1.000
	BottomText.Position = UDim2.new(0.097560972, 0, 0.0889999792, 0)
	BottomText.Size = UDim2.new(0, 113, 0, 28)
	BottomText.Font = Enum.Font.Gotham
	BottomText.Text = bottom
	BottomText.TextColor3 = Color3.fromRGB(255, 255, 255)
	BottomText.TextSize = 14.000
	BottomText.TextTransparency = 0.300
	BottomText.TextXAlignment = Enum.TextXAlignment.Left

	TabHold.Name = "TabHold"
	TabHold.Parent = LeftFrame
	TabHold.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	TabHold.BackgroundTransparency = 1.000
	TabHold.Position = UDim2.new(0, 0, 0.167355374, 0)
	TabHold.Size = UDim2.new(0, 205, 0, 403)

	TabLayout.Name = "TabLayout"
	TabLayout.Parent = TabHold
	TabLayout.SortOrder = Enum.SortOrder.LayoutOrder
	TabLayout.Padding = UDim.new(0, 3)

	Drag.Name = "Drag"
	Drag.Parent = MainFrame
	Drag.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Drag.BackgroundTransparency = 1.000
	Drag.Position = UDim2.new(0.290368259, 0, 0, 0)
	Drag.Size = UDim2.new(0, 501, 0, 23)

	ContainerFolder.Name = "ContainerFolder"
	ContainerFolder.Parent = MainFrame

	MakeDraggable(Drag,MainFrame)
	MakeDraggable(LeftFrame,MainFrame)
	MainFrame:TweenSize(UDim2.new(0, 706, 0, 484), Enum.EasingDirection.Out, Enum.EasingStyle.Quart, .6, true)

	local uitoggled = false
	UserInputService.InputBegan:Connect(
		function(io, p)
			if io.KeyCode == CloseBind then
				if uitoggled == false then
					MainFrame:TweenSize(UDim2.new(0, 0, 0, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Quart, .6, true)
					uitoggled = true
					wait(.5)
					FluxLib.Enabled = false
				else
					MainFrame:TweenSize(UDim2.new(0, 706, 0, 484), Enum.EasingDirection.Out, Enum.EasingStyle.Quart, .6, true)
					FluxLib.Enabled = true
					uitoggled = false
				end
			end
		end
	)

	function Flux:Notification(desc,buttontitle)
		for i, v in next, MainFrame:GetChildren() do
			if v.Name == "NotificationBase" then
				v:Destroy()
			end
		end
		local NotificationBase = Instance.new("TextButton")
		local NotificationBaseCorner = Instance.new("UICorner")
		local NotificationFrame = Instance.new("Frame")
		local NotificationFrameCorner = Instance.new("UICorner")
		local NotificationFrameGlow = Instance.new("ImageLabel")
		local NotificationTitle = Instance.new("TextLabel")
		local CloseBtn = Instance.new("TextButton")
		local CloseBtnCorner = Instance.new("UICorner")
		local NotificationDesc = Instance.new("TextLabel")

		NotificationBase.Name = "NotificationBase"
		NotificationBase.Parent = MainFrame
		NotificationBase.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
		NotificationBase.BackgroundTransparency = 1
		NotificationBase.Size = UDim2.new(0, 706, 0, 484)
		NotificationBase.AutoButtonColor = false
		NotificationBase.Font = Enum.Font.SourceSans
		NotificationBase.Text = ""
		NotificationBase.TextColor3 = Color3.fromRGB(0, 0, 0)
		NotificationBase.TextSize = 14.000
		NotificationBase.Visible = true

		NotificationBaseCorner.CornerRadius = UDim.new(0, 5)
		NotificationBaseCorner.Name = "NotificationBaseCorner"
		NotificationBaseCorner.Parent = NotificationBase

		NotificationFrame.Name = "NotificationFrame"
		NotificationFrame.Parent = NotificationBase
		NotificationFrame.AnchorPoint = Vector2.new(0.5, 0.5)
		NotificationFrame.BackgroundColor3 = Color3.fromRGB(50, 53, 59)
		NotificationFrame.ClipsDescendants = true
		NotificationFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
		NotificationFrame.Size = UDim2.new(0, 0, 0, 0)

		NotificationFrameCorner.CornerRadius = UDim.new(0, 5)
		NotificationFrameCorner.Name = "NotificationFrameCorner"
		NotificationFrameCorner.Parent = NotificationFrame

		NotificationFrameGlow.Name = "NotificationFrameGlow"
		NotificationFrameGlow.Parent = NotificationFrame
		NotificationFrameGlow.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		NotificationFrameGlow.BackgroundTransparency = 1.000
		NotificationFrameGlow.BorderSizePixel = 0
		NotificationFrameGlow.Position = UDim2.new(0, -15, 0, -15)
		NotificationFrameGlow.Size = UDim2.new(1, 30, 1, 30)
		NotificationFrameGlow.ZIndex = 0
		NotificationFrameGlow.Image = "rbxassetid://4996891970"
		NotificationFrameGlow.ImageColor3 = Color3.fromRGB(15, 15, 15)
		NotificationFrameGlow.ScaleType = Enum.ScaleType.Slice
		NotificationFrameGlow.SliceCenter = Rect.new(20, 20, 280, 280)

		NotificationTitle.Name = "NotificationTitle"
		NotificationTitle.Parent = NotificationFrame
		NotificationTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		NotificationTitle.BackgroundTransparency = 1.000
		NotificationTitle.Position = UDim2.new(0.0400609747, 0, 0.0761325806, 0)
		NotificationTitle.Size = UDim2.new(0, 111, 0, 34)
		NotificationTitle.Font = Enum.Font.GothamBold
		NotificationTitle.Text = Title.Text .. " | Notification"
		NotificationTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
		NotificationTitle.TextSize = 24.000
		NotificationTitle.TextXAlignment = Enum.TextXAlignment.Left
		NotificationTitle.TextTransparency = 1

		CloseBtn.Name = "CloseBtn"
		CloseBtn.Parent = NotificationFrame
		CloseBtn.BackgroundColor3 = Color3.fromRGB(64, 68, 75)
		CloseBtn.ClipsDescendants = true
		CloseBtn.Position = UDim2.new(0.0403124988, 0, 0.720855951, 0)
		CloseBtn.Size = UDim2.new(0, 366, 0, 43)
		CloseBtn.AutoButtonColor = false
		CloseBtn.Font = Enum.Font.Gotham
		CloseBtn.Text = buttontitle
		CloseBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
		CloseBtn.TextSize = 15.000
		CloseBtn.TextTransparency = 1
		CloseBtn.BackgroundTransparency = 1

		CloseBtnCorner.CornerRadius = UDim.new(0, 4)
		CloseBtnCorner.Name = "CloseBtnCorner"
		CloseBtnCorner.Parent = CloseBtn

		NotificationDesc.Name = "NotificationDesc"
		NotificationDesc.Parent = NotificationFrame
		NotificationDesc.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		NotificationDesc.BackgroundTransparency = 1.000
		NotificationDesc.Position = UDim2.new(0.112499997, 0, 0.266355127, 0)
		NotificationDesc.Size = UDim2.new(0, 309, 0, 82)
		NotificationDesc.Font = Enum.Font.Gotham
		NotificationDesc.Text = desc
		NotificationDesc.TextColor3 = Color3.fromRGB(255, 255, 255)
		NotificationDesc.TextSize = 15.000
		NotificationDesc.TextWrapped = true
		NotificationDesc.TextTransparency = 1

		CloseBtn.MouseEnter:Connect(function()
			TweenService:Create(
				CloseBtn,
				TweenInfo.new(.3, Enum.EasingStyle.Quad
