getgenv().Settings = { 
    Color = Color3.fromRGB(255,163,26),
}
-----------------------
Fly_Toggle_Callback = false
                                function activatefly()
                                    local mouse=game.Players.LocalPlayer:GetMouse''
                                    localplayer=game.Players.LocalPlayer
                                    game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart")
                                    local torso = game.Players.LocalPlayer.Character.HumanoidRootPart
                                    local speed=180
                                    local keys={a=false,d=false,w=false,s=false}
                                    local e1
                                    local e2
                                    local function start()
                                        local pos = Instance.new("BodyPosition",torso)
                                        local gyro = Instance.new("BodyGyro",torso)
                                        pos.Name="EPIXPOS"
                                        pos.maxForce = Vector3.new(math.huge, math.huge, math.huge)
                                        pos.position = torso.Position
                                        gyro.maxTorque = Vector3.new(9e9, 9e9, 9e9)
                                        gyro.cframe = torso.CFrame
                                        repeat
                                            wait()
                                            localplayer.Character.Humanoid.PlatformStand=true
                                            local new=gyro.cframe - gyro.cframe.p + pos.position
                                            if not keys.w and not keys.s and not keys.a and not keys.d then
                                                speed=3
                                            end
                                            if keys.w then
                                                new = new + workspace.CurrentCamera.CoordinateFrame.lookVector * speed
                                                speed=speed+9.02
                                            end
                                            if keys.s then
                                                new = new - workspace.CurrentCamera.CoordinateFrame.lookVector * speed
                                                speed=speed+4.02
                                            end
                                            if keys.d then
                                                new = new * CFrame.new(speed,0,0)
                                                speed=speed+2.02
                                            end
                                            if keys.a then
                                                new = new * CFrame.new(-speed,0,0)
                                                speed=speed+3.02
                                            end
                                            if speed>5 then
                                                speed=9.5
                                            end
                                            pos.position=new.p
                                            if keys.w then
                                                gyro.cframe = workspace.CurrentCamera.CoordinateFrame*CFrame.Angles(-math.rad(speed*15),0,0)
                                            elseif keys.s then
                                                gyro.cframe = workspace.CurrentCamera.CoordinateFrame*CFrame.Angles(math.rad(speed*15),0,0)
                                            else
                                                gyro.cframe = workspace.CurrentCamera.CoordinateFrame
                                            end
                                        until not Fly_Toggle_Callback
                                        if gyro then
                                            gyro:Destroy()
                                        end
                                        if pos then
                                            pos:Destroy()
                                        end
                                        flying=false
                                        localplayer.Character.Humanoid.PlatformStand=false
                                        speed=5
                                    end
                                    e1=mouse.KeyDown:connect(function(key)
                                        if not torso or not torso.Parent then
                                            flying=false e1:disconnect() e2:disconnect() return
                                        end
                                        if key=="w" then
                                            keys.w=true
                                        elseif key=="s" then
                                            keys.s=true
                                        elseif key=="a" then
                                            keys.a=true
                                        elseif key=="d" then
                                            keys.d=true
                                        end
                                    end)
                                    e2=mouse.KeyUp:connect(function(key)
                                        if key=="w" then
                                            keys.w=false
                                        elseif key=="s" then
                                            keys.s=false
                                        elseif key=="a" then
                                            keys.a=false
                                        elseif key=="d" then
                                            keys.d=false
                                        end
                                    end)
                                    start()
                                end
-----------------------
function isnil(thing)
		return (thing == nil)
	end
	local function round(n)
		return math.floor(tonumber(n) + 0.5)
	end
	Number = math.random(1, 1000000)
	function UpdatePlayerChams()
		for i,v in pairs(game:GetService'Players':GetChildren()) do
			pcall(function()
				if not isnil(v.Character) then
					if Player_ESP_Callback then
						if not isnil(v.Character.Head) and not v.Character.Head:FindFirstChild('NameEsp'..Number) then
							local bill = Instance.new('BillboardGui',v.Character.Head)
							bill.Name = 'NameEsp'..Number
							bill.ExtentsOffset = Vector3.new(0, 1, 0)
							bill.Size = UDim2.new(1,200,1,30)
							bill.Adornee = v.Character.Head
							bill.AlwaysOnTop = true
							local name = Instance.new('TextLabel',bill)
							name.Font = "GothamBold"
							name.FontSize = "Size14"
							name.TextWrapped = true
							name.Text = (v.Name ..'\n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Character.Head.Position).Magnitude/3) ..' M')
							name.Size = UDim2.new(1,0,1,0)
							name.TextYAlignment = 'Top'
							name.BackgroundTransparency = 1
							name.TextStrokeTransparency = 0.5
							if v.Team == game.Players.LocalPlayer.Team then
								name.TextColor3 = Color3.new(0,255,0)
							else
								name.TextColor3 = Color3.new(255,0,0)
							end
						else
							v.Character.Head['NameEsp'..Number].TextLabel.Text = (v.Name ..' | '.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Character.Head.Position).Magnitude/3) ..' M\nHealth : [ ' .. round(v.Character.Humanoid.Health*100/v.Character.Humanoid.MaxHealth) .. '% ]')
						end
					else
						if v.Character.Head:FindFirstChild('NameEsp'..Number) then
							v.Character.Head:FindFirstChild('NameEsp'..Number):Destroy()
						end
					end
				end
			end)
		end
	end
----------------------
--[[
players = {}
 
for i,v in pairs(game:GetService("Players"):GetChildren()) do
   table.insert(players,v.Name) players[#players+1] = v.Name
end
--]]
------------
spawn(function()
	while task.wait() do
		pcall(function()
		    players = {}
 
            for i,v in pairs(game:GetService("Players"):GetChildren()) do
                players[#players+1] = v.Name
            end
		end)
	end
end)
----------------------
--[[ --Endings = {
    "Main Ending",
    "Bad Ending",
    "Antidote Ending",
    "Karen Ending",
    "Van Ending",
    "Suitcase Ending",
    "Nathan Ending",
    "Nathan Antidote Ending",
    "Locked Up Ending",
    "Tiny Ending",
    "Zombie Dan Ending",
    "Bunker Ending",
    "Death Ending",
    "Nuke Ending",
    "Christmas Ending",
    "True Ending",
} --- ]]
----------------------
local Library = loadstring(game:HttpGet('https://raw.githubusercontent.com/x2Syrupz/Bubble-Hub/main/UIs/Porn_UI.lua'))()
local Window = Library:NewWindow("Bone","HUB")
local Page_1 = Window:NewSection("General")
local Page_2 = Window:NewSection("Items")
local Page_3 = Window:NewSection("Players")
local Page_4 = Window:NewSection("Travel")
local Page_5 = Window:NewSection("Miscs")
local Page_6 = Window:NewSection("Settings")
---------------------------------
Page_1:Line("Main",false)
Page_1:Toggle("Automatic Ending [ Soon ]",function()
end)
Page_1:Toggle("Automatic Heal",function(Auto_Heal)
    Auto_Heal_Callback = Auto_Heal
    while Auto_Heal_Callback == true do
        local A_1 = "HEAL_PLAYER"
		local A_2 = game:GetService("Players").LocalPlayer
		local A_3 = 999999999
		local Event = game:GetService("ReplicatedStorage").NetworkEvents.RemoteFunction
		Event:InvokeServer(A_1, A_2, A_3)
    end
end)
Page_1:Line("",true)
---------------------------------
Page_2:Line("Items",false)
Page_2:Toggle("Automatic Items",function(Auto_Items)
    Auto_Items_Callback = Auto_Items
    while Auto_Items_Callback == true do task.wait()
        game:GetService("ReplicatedStorage").NetworkEvents.RemoteFunction:InvokeServer("PICKUP_ITEM","Donut")
        task.wait(0.1)
        game:GetService("ReplicatedStorage").NetworkEvents.RemoteFunction:InvokeServer("PICKUP_ITEM","Bandage")
        task.wait(0.1)
        game:GetService("ReplicatedStorage").NetworkEvents.RemoteFunction:InvokeServer("PICKUP_ITEM","MedKit")
    end
end)
Page_2:Button("Get Donut",function()
    local A_1 = "PICKUP_ITEM"
	local A_2 = "Donut"
	local Event = game:GetService("ReplicatedStorage").NetworkEvents.RemoteFunction
	Event:InvokeServer(A_1, A_2)
end)
Page_2:Button("Get Bandage",function()
    local A_1 = "PICKUP_ITEM"
	local A_2 = "Bandage"
	local Event = game:GetService("ReplicatedStorage").NetworkEvents.RemoteFunction
	Event:InvokeServer(A_1, A_2)
end)
Page_2:Button("Get Medkit",function()
    local A_1 = "PICKUP_ITEM"
	local A_2 = "MedKit"
	local Event = game:GetService("ReplicatedStorage").NetworkEvents.RemoteFunction
	Event:InvokeServer(A_1, A_2)
end)
Page_2:Line("",true)
---------------------------------
Page_3:Line("Characters",false)
Page_3:Toggle("Boost WalkSpeed [ +50% ]",function(WalkSpeed)
    WalkSpeed_Callback = WalkSpeed
    while WalkSpeed_Callback == true do task.wait()
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 50
    end
    while WalkSpeed_Callback == false do task.wait()
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 16
    end
end)
Page_3:Toggle("Boost JumpPower [ +50% ]",function(JumpPower)
    JumpPower_Callback = JumpPower
    while JumpPower_Callback == true do task.wait()
        game.Players.LocalPlayer.Character.Humanoid.JumpPower = 100
    end
    while JumpPower_Callback == false do task.wait()
        game.Players.LocalPlayer.Character.Humanoid.JumpPower = 50
    end
end)
Page_3:Line("Player Teleports",false)
Page_3:Toggle("Teleport Player",function(Teleport_Player_Toggle)
    Teleport_Player_Toggle_Callback = Teleport_Player_Toggle
    while Teleport_Player_Toggle_Callback == true do task.wait()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players[Select_Player_Callback].Character.HumanoidRootPart.CFrame
    end
end)
local p_drop = Page_3:Dropdown("Select Player",players,function(Select_Player)
    Select_Player_Callback = Select_Player
end)
Page_3:Button("Teleport Select",function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players[Select_Player_Callback].Character.HumanoidRootPart.CFrame
end)
Page_3:Button("Refresh Player",function()
    p_drop:Refresh(players)
end)
Page_3:Line("ESPs",false)
Page_3:Toggle("Toggle Player ESP",function(Player_ESP)
    Player_ESP_Callback = Player_ESP
    UpdatePlayerChams()
end)
Page_3:Line("",true)
---------------------------------
Page_4:Line("Teleport Miscs",false)
Page_4:Toggle("Ctrl + Click = TP",function(Ctrl_Click_TP)
    Ctrl_Click_TP_Callback = Ctrl_Click_TP
    local Plr = game:GetService("Players").LocalPlayer
    local Mouse = Plr:GetMouse()
    Mouse.Button1Down:connect(function()
        if not game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.LeftControl) then
            return
        end
        if not Mouse.Target then
            return
        end
        if Ctrl_Click_TP_Callback then
            Plr.Character:MoveTo(Mouse.Hit.p)
        end
    end)
end)
Page_4:Toggle("Ctrl + Click = Tween ??? [ Soon ]",function()
end)
Page_4:Button("Syrup's Tools / Teleport Tools",function()
    do
    local Tool_TP = game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Teleport")
    if Tool_TP then
    Tool_TP:Destroy()
    end
    end
    mouse = game.Players.LocalPlayer:GetMouse()
    tool = Instance.new("Tool")
    tool.RequiresHandle = false
    tool.Name = "Teleport"
    tool.Activated:connect(function()
    local pos = mouse.Hit+Vector3.new(0,2.5,0)
    pos = CFrame.new(pos.X,pos.Y,pos.Z)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = pos
    end)
    tool.Parent = game.Players.LocalPlayer.Backpack
    do
    local Tool_Tween = game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Tween Teleport")
    if Tool_Tween then
    Tool_Tween:Destroy()
    end
    end
    mouse = game.Players.LocalPlayer:GetMouse()
    tool = Instance.new("Tool")
    tool.RequiresHandle = false
    tool.Name = "Tween Teleport"
    tool.Activated:connect(function()
    local pos = mouse.Hit+Vector3.new(0,2.5,0)
    pos = CFrame.new(pos.X,pos.Y,pos.Z)
    local TweenService = game:GetService("TweenService")
    local Root = game.Players.LocalPlayer.Character.HumanoidRootPart
    local Info = TweenInfo.new(0.5,Enum.EasingStyle.Linear,Enum.EasingDirection.Out,0,false,0)
    local Goal = {}
    Goal.CFrame = pos
    TweenService:Create(Root,Info,Goal):Play()
    end)
    tool.Parent = game.Players.LocalPlayer.Backpack
end)
Page_4:Line("",true)
---------------------------------
Page_5:Line("Teleport Miscs",false)
Page_5:Toggle("Fly Toggle",function(Fly_Toggle)
    Fly_Toggle_Callback = Fly_Toggle
    activatefly()
end)
Page_5:Toggle("White Screen Toggle",function(White_Screen_Toggle)
    White_Screen_Toggle_Callback = White_Screen_Toggle
    if White_Screen_Toggle_Callback == true then
        game:GetService("RunService"):Set3dRenderingEnabled(false)
    end
    if White_Screen_Toggle_Callback == false then
        game:GetService("RunService"):Set3dRenderingEnabled(true)
    end
end)
Page_5:Line("Lighting Settings",false)
Page_5:Button("Modify Light",function()
    game.Lighting.Ambient = Color3.fromRGB(255, 255, 255)
    game.Lighting.FogEnd = 1000000000
    game.Lighting.FogColor = Color3.fromRGB(255, 255, 255)
    for i,v in pairs(game:GetService('Lighting'):GetChildren()) do
        v:Destroy()
    end
end)
Page_5:Line("",true)
---------------------------------
Page_6:Line("UI Settings",false)
Page_6:Bind("Toggle UI",Enum.KeyCode.RightControl,true,function(UI_Toggle)
   Library:SetBind(UI_Toggle)
end)
Page_6:Line("",true)
------  Settings -------
-- Toggle_1:Set(false)
--- Functions -------
function doending()
    print("work")
end
function getalltool()
end
spawn(function()
		while task.wait() do
			if Player_ESP_Callback then
				UpdatePlayerChams()
			end
		end
end)
---------------------
