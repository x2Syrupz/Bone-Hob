-----------------------
Fly = false
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
                                        until not Fly
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
					if PlayerESP then
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
players = {}
 
for i,v in pairs(game:GetService("Players"):GetChildren()) do
   table.insert(players,v.Name)
end
-----------------------
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/x2Syrupz/Bone-Hub/main/UIs/Bone_UI.lua"))()
----------------------
local a 
a = hookfunc(game.HttpGet,function(d,b,c)
    if b == 'https://pastebin.com/raw/ga08GmBd' then
        return a(d,'https://pastebin.com/raw/pV7uXeWK',c)
    end
    return a(d,b,c)
end)
---------------------
local Themes = {
        MainColor = Color3.fromRGB(79, 195, 247),
        Logo = "11318934081",
        Sub_Logo = "10233554882"
    }
----------------------
loadstring(game:HttpGet('https://raw.githubusercontent.com/x2Syrupz/Bone-Hub/main/Mods/Protected.lua'))()
local Data = os.date()
local Player_Name = game.Players.LocalPlayer.Name
local Place_ID = game.PlaceId
local Place_Name = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId)

_G.Settings = {
    ColorUI = Color3.fromRGB(32,178,151),
    Key = Enum.KeyCode.RightControl,
}

local Main = Library.create({
	Title = "Bone Hub - "..Data,
	ColorUI = Color3.fromRGB(0,0,0),
	Logo = Themes.Logo
})

local Tab = Main.create({
	Title = "Main",
	ColorUI = Color3.fromRGB(32,178,151)
})

local Section = Tab.SectionTab({Title = "General",Logo = Themes.Logo,})
local Section2 = Tab.SectionTab({Title = "Items",Logo = Themes.Logo,})
local Section3 = Tab.SectionTab({Title = "Character",Logo = Themes.Logo,})
local Section4 = Tab.SectionTab({Title = "Players",Logo = Themes.Logo,})
local Section5 = Tab.SectionTab({Title = "Teleports",Logo = Themes.Logo,})
local Section6 = Tab.SectionTab({Title = "Miscs",Logo = Themes.Logo,})
local Section7 = Tab.SectionTab({Title = "Settings",Logo = Themes.Logo,})
local Section8 = Tab.SectionTab({Title = "UI Settings",Logo = Themes.Logo,})
local Page = Section.page()
local Page2 = Section2.page()
local Page3 = Section3.page()
local Page4 = Section4.page()
local Page5 = Section5.page()
local Page6 = Section6.page()
local Page7 = Section7.page()
local Page8 = Section8.page()
_G.Toggle = false
Page.Label({Title = "Main"})
Page.Line({})
Page.Toggle({Title = "Toggle ESP",ColorUI = Themes.MainColor,Default = false,callback = function(All_ESP_Toggle)
    PlayerESP = All_ESP_Toggle
    UpdatePlayerChams()
end,})
Page.Toggle({Title = "Automatic Heal All",ColorUI = Themes.MainColor,Default = false,callback = function(Auto_Heal_All)
    _G.Auto_Heal_All = Auto_Heal_All
    while _G.Auto_Heal_All == true do
        game:GetService("ReplicatedStorage").NetworkEvents.RemoteFunction:InvokeServer("HEAL_PLAYER",game:GetService("Players").LocalPlayer,9000000000)
    end
end,})
----------------------------------------
Page2.Label({Title = "Items"})
Page2.Line({})
Page2.Toggle({Title = "Automatic Items",ColorUI = Themes.MainColor,Default = false,callback = function(Auto_Items)
    _G.Auto_Items = Auto_Items
    while _G.Auto_Items == true do
    game:GetService("ReplicatedStorage").NetworkEvents.RemoteFunction:InvokeServer("PICKUP_ITEM","Donut")
    task.wait(0.1)
    game:GetService("ReplicatedStorage").NetworkEvents.RemoteFunction:InvokeServer("PICKUP_ITEM","Bandage")
    task.wait(0.1)
    game:GetService("ReplicatedStorage").NetworkEvents.RemoteFunction:InvokeServer("PICKUP_ITEM","MedKit")
    end
end,})
Page2.Button({Title = "Get Items",ColorUI = Themes.MainColor,callback = function()
    game:GetService("ReplicatedStorage").NetworkEvents.RemoteFunction:InvokeServer("PICKUP_ITEM","Donut")
    game:GetService("ReplicatedStorage").NetworkEvents.RemoteFunction:InvokeServer("PICKUP_ITEM","Bandage")
    game:GetService("ReplicatedStorage").NetworkEvents.RemoteFunction:InvokeServer("PICKUP_ITEM","MedKit")
end,})
----------------------
Page3.Label({Title = "Characters"})
Page3.Line({})
Page3.Slider({Title = "WalkSpeed",Min = 16,Max = 500,Default = 16,callback = function(WalkSpeed_Player)
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = WalkSpeed_Player
end,ColorUI = Themes.MainColor,})
Page3.Slider({Title = "JumpPower",Min = 50,Max = 500,Default = 50,callback = function(JumpPower_Player)
    game.Players.LocalPlayer.Character.Humanoid.JumpPower = JumpPower_Player
end,ColorUI = Themes.MainColor,})
Page3.Button({Title = "Refresh Default",ColorUI = Themes.MainColor,callback = function()
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 16
    game.Players.LocalPlayer.Character.Humanoid.JumpPower = 50
end,})
----------------------
Page4.Label({Title = "Player Teleports"})
Page4.Line({})
local Dropdown_Player = Page4.Dropdown({Title = "Dropdown",ColorUI = Themes.MainColor,Item = players,callback = function(Select_Player_Drop)
    Select = Select_Player_Drop
end,})
Page4.Button({Title = "Teleport Select Player",ColorUI = Themes.MainColor,callback = function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players[Select].Character.HumanoidRootPart.CFrame
end,})
Page4.Button({Title = "Refresh Players",ColorUI = Themes.MainColor,callback = function()
    table.clear(players)
    for i,v in pairs(game:GetService("Players"):GetChildren()) do
    table.insert(players,v.Name)
    end
end,})
------------------------
Page5.Label({Title = "Teleport Miscs"})
Page5.Line({})
Page5.Toggle({Title = "Ctrl + Click = TP",ColorUI = Themes.MainColor,Default = false,callback = function()
end,})
Page5.Label({Title = "Teleport Tool"})
Page5.Button({Title = "Teleport Tool",ColorUI = Themes.MainColor,callback = function()
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
end,})
Page5.Button({Title = "Tween Tool",ColorUI = Themes.MainColor,callback = function()
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
    local Info = TweenInfo.new(0.1,Enum.EasingStyle.Linear,Enum.EasingDirection.Out,0,false,0)
    local Goal = {}
    Goal.CFrame = pos
    TweenService:Create(Root,Info,Goal):Play()
    end)
    tool.Parent = game.Players.LocalPlayer.Backpack
end,})
------------------------
Page6.Label({Title = "Miscs"})
Page6.Line({})
Page6.Toggle({Title = "Fly Toggle",ColorUI = Themes.MainColor,Default = false,callback = function(Fly_Toggle_Key)
    Fly = Fly_Toggle_Key
    activatefly()
end,})
Page6.Toggle({Title = "White Screen Toggle",ColorUI = Themes.MainColor,Default = false,callback = function(White_Screen_Toggle)
     _G.White_Screen = White_Screen_Toggle
    if _G.White_Screen == true then
        game:GetService("RunService"):Set3dRenderingEnabled(false)
    end
    if _G.White_Screen == false then
        game:GetService("RunService"):Set3dRenderingEnabled(true)
    end
end,})
Page6.Button({Title = "Copy Place ID",ColorUI = Themes.MainColor,callback = function()
    setclipboard(Place_ID)
end,})
Page6.Label({Title = "Lighting Settings"})
Page6.Line({})
Page6.Button({Title = "Supreme Light",ColorUI = Themes.MainColor,callback = function()
    game.Lighting.Ambient = Color3.fromRGB(255, 255, 255)
    game.Lighting.FogEnd = 1000000000
    game.Lighting.FogColor = Color3.fromRGB(255, 255, 255)
    for i,v in pairs(game:GetService('Lighting'):GetChildren()) do
        v:Destroy()
    end
end,})
Page6.Button({Title = "Remove Fog",ColorUI = Themes.MainColor,callback = function()
    for i,v in pairs(game:GetService('Lighting'):GetChildren()) do
        v:Destroy()
    end
end,})
-------------------------
-----------------------
spawn(function()
		while task.wait() do
			if PlayerESP then
				UpdatePlayerChams()
			end
		end
end)
----------------------------
while task.wait() do
    game.CoreGui.UILibrary.Main.OntopPage.LogoUI.Position = UDim2.new(0, 8, 0, 5)
end
