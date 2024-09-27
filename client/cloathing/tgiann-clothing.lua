
function Framework.SetCloathing(outfit)
    if not outfit then return end 

    local skinData = { 
        { name = "glasses_1", val =  outfit.glasses_1 }, { name = 'bags_2', val = outfit.glasses_2},
        { name = "tshirt_1", val =  outfit.tshirt_1 }, { name = "tshirt_2", val = outfit.tshirt_2},
        { name = "torso_1" , val =  outfit.torso_1}, { name = "torso_2", val = outfit.torso_2},
        { name = "arms"    , val = outfit.arms },
        { name = "pants_1" , val =  outfit.pants_1 }, { name = "pants_2", val = outfit.pants_2},
        { name = "shoes_1" , val =  outfit.shoes_1 }, { name = "shoes_2", val = outfit.shoes_2},
        { name = "chain_1" , val =  outfit.chain_1}, { name = 'chain_2', val = outfit.chain_2},
        { name = "ears_1"  , val = outfit.ears_1  }, { name = 'ears_2', val = outfit.ears_2},
    }
    
    TriggerEvent("tgiann-clothing:changeScriptClothe", skinData)  
end

function Framework.ResetCloathing()
    TriggerEvent("tgiann-clothing:changeScriptClothe")
end