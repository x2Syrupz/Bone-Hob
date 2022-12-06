_G.Settings = {
	UI = {
		Key = Enum.KeyCode.RightControl,
	}
}
-------------------------------
GetSubPrefix = function(a)
    local a = tostring(a):gsub(" ","")
    local bX = ""
    if #a == 2 then 
        local Yp = string.sub(a,#a,#a+1)
        bX = Yp == "1" and "st" or Yp == "2" and "nd" or Yp == "3" and "rd" or "th"
    end
    return bX
end
-------------------------------
local Data = os.date("%A, %B %d"..GetSubPrefix(os.date("%d"))..os.date(", %Y.")) --os.date("%A, %B %d, %Y.")
getgenv().ESP = loadstring(game:HttpGet("https://raw.githubusercontent.com/ErenYeaker/SaveScript/main/ESP.lua"))();
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/SixZensED/Discord-Library/main/Library"))()
local Main = Library:create({Name = "Bubble Hub Scripts"})
local Tab = Main:createtab({Name = "Main"})
local Section1 = Tab:createsection({Name = "General"})
local Section2 = Tab:createsection({Name = "Settings"})
local Page1 = Section1:createpage()
local Page2 = Section2:createpage()

Page1:Label({Title = "Main",})

Page1:Line()

Page1:Toggle({
	Title = "ESP Players",
	Default = false,
	callback = function(a)
	   getgenv().ESP:Toggle(a)
	end,
})

Page1:Line()
----------------------------------------
Page2:Label({Title = tostring(Data),})
local Time_Center = Page2:Label({Title = "Waiting For Time Load",})
Page2:Line()
Page2:Toggle({
	Title = "Auto Rejoin",
	Default = true,
	callback = function()
	    
	end,
})
Page2:Line()
----------------------------------------
spawn(function()
	while task.wait() do
		pcall(function()
			local scripttime = game.Workspace.DistributedGameTime
			local seconds = scripttime%60
			local minutes = math.floor(scripttime/60%60)
			local hours = math.floor(scripttime/3600)
			local tempo = string.format("%.0f Hour(s), %.0f Minute(s), %.0f Second(s)", hours ,minutes, seconds)
			Time_Center:Update("Time : "..tostring(tempo))
		end)
	end
end)
