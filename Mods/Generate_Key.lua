getgenv().generateKey = function(let,cap,num,numamount,length,copy,prnt,speak,prefix)
   makefolder("Generate Keys")
   local plr = game.Players.LocalPlayer
   let = let or true
   cap = cap or true
   num = num or true
   numamount = numamount or 999
   length = length or 8
   copy = copy or true
   prnt = prnt or true
   speak = speak or true
   prefix = prefix or "."
   realKey = ""
   
   --Set Character Function
   local characters = {}
   function setCharacter(start,finish)
       for i = string.byte(start), string.byte(finish) do
           table.insert(characters,string.char(i))
       end
   end
   
   --Chat Function
   function talk(message)
       game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(message,"All")
   end
   
   --Generate Function
   function generate(l)
       local key = {}
       for keys = 1, l do
           key[keys] = characters[math.random(1,#characters)]
       end
       
       local keyReturn = table.concat(key)
       realKey = tostring(keyReturn)
       
       --Custom Checks
       if copy then
           --setclipboard(realKey)
       end
       if speak then
           --wait(1)
           --talk("Generating Key [" .. plr.Name .. "]")
           --wait(.6)
           --talk(realKey)
           writefile("Generate Keys/"..math.random(1,10) .. ".txt", realKey)
       end
       if prnt then
           print(realKey)
       end
       
       return table.concat(key)
   end
   
   --Custom Checks
   if let then
       setCharacter("a","z")
   end
   if cap then
       setCharacter("A","Z")
   end
   if num then
       setCharacter("0",string.rep("9",numamount))
   end
   
   --Generate
   plr.Chatted:Connect(function(chat)
       if string.find(string.lower(chat),"/generate") then
           generate(length)
       end
   end)
end

generateKey(true,true,true,50,9,true,true,true,"/")
