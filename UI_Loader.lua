local Keys_List = {
    "Bone-XqIPatWjv",
    "Bone-zzrGjQXfG",
    "Bone-OxIahRcue",
    "--------------------- nil"
}
---------------------
local Notification = loadstring(game:HttpGet("https://raw.githubusercontent.com/x2Syrupz/Bone-Hub/main/Apis/Notification.lua"))()
local Place_ID = game.GameId
local Notify_Heading = "Syrup's Whitelist Service"
local Place_List = {
    [1701332290] = "loadstring(game:HttpGet('https://raw.githubusercontent.com/x2Syrupz/Bone-Hub/main/Scripts/Field_Trip_Z.lua'))()",
    [994732206] = "loadstring(game:HttpGet('https://raw.githubusercontent.com/x2Syrupz/Bone-Hub/main/Scripts/Blox_Fruit.lua'))()",
}
local Whitelist_Private_Checked = 1
local Whitelist_Checked
for i,v in pairs(Keys_List) do
    if Whitelist_Private_Checked == #Keys_List and Place_List[game.GameId] then
    Keys_List = nil
    -- warn("Not a valid key!")
    Notification.new("message", Notify_Heading, "Invalid Key ! / Place not Supported !",0)
    else
        if v == getgenv().Keys and Place_List[game.GameId] then
            -- warn("Successfully whitelisted!")
            Notification.new("message", Notify_Heading, "Correct Key ! | Place Supported !",0)
            --Notification.new("message", Notify_Heading, "Loadded Script Successfully!",0)
            loadstring(Place_List[tonumber(game.GameId)])()
            Whitelist_Checked = getgenv().Keys
            Keys_List = nil
        else
            Whitelist_Private_Checked = Whitelist_Private_Checked + 1
        end
    end
end
---------------------
