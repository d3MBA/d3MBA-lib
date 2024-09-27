
function Framework.SetCloathing(outfit)
    if not outfit then return end 

    local ped = PlayerPedId()
    local chain = GetEntityModel(ped) == `mp_m_freemode_01` and "accessory" or "chain"

    local Data = {
        outfitData = {
            ["pants"]       = { item = outfit.pants_1, texture = outfit.pants_2},
            ["arms"]        = { item = outfit.arms or nil, texture = 0 or nil},  
            ["t-shirt"]     = { item = outfit.tshirt_1 or nil, texture = outfit.tshirt_2 or nil},  
            ["torso2"]      = { item = outfit.torso_1 or nil, texture = outfit.torso_2 or nil}, 
            ["shoes"]       = { item = outfit.shoes_1 or nil, texture = outfit.shoes_2 or nil},  
            ["glass"]       = { item = outfit.glasses_1 or nil, texture = outfit.glasses_2 or nil},  
            ["ear"]         = { item = outfit.ears_1 or nil, texture = outfit.ears_2 or nil},  
            ["mask"]         = { item = outfit.mask_1 or nil, texture = outfit.mask_2 or nil}, 
            ["hat"]         = { item = outfit.hat_1 or nil, texture = outfit.hat_2 or nil},  
        },
    }

    TriggerEvent('qb-clothing:client:loadOutfit', Data)
end

function Framework.ResetCloathing()
    TriggerServerEvent('qb-clothes:loadPlayerSkin')
end
