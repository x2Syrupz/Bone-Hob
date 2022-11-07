local LP, Players = game:GetService('Players').LocalPlayer, game:GetService('Players')

if LP then
    LP.DisplayName = 'Protected by Bone'

    local function CharacterAdded()
        local LC = LP.Character or LP.CharacterAdded:wait()
        local Hum = LC and LC.Parent and LC:WaitForChild('Humanoid', Players.RespawnTime + 1) or nil
       
        if Hum then
            Hum.DisplayName = 'Protected by Bone'
        end
    end
   
    LP.CharacterAdded:Connect(CharacterAdded()); CharacterAdded()
end
