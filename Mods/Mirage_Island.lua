do
   local Island = game:GetService("Workspace").Map:FindFirstChild("Mirage Island")
   if Island then
       Island:Destroy()
   end
end
---------------------------
local ID = 11258427457
local Mirage = game:GetObjects("rbxassetid://"..ID)[1]
Mirage.Parent = workspace.Map
game:GetService("Workspace").Map:FindFirstChild("Mirage Island"):MoveTo(Vector3.new(0, 0, 0))
