function Framework.SetCloathing(outfit)
    if not outfit then return end 

    local ped = PlayerPedId()
    TriggerEvent('skinchanger:loadSkin', {
        sex       = GetEntityModel(ped) == `mp_m_freemode_01` and 0 or 1,
        tshirt_1  = outfit.tshirt_1,
        tshirt_2  = outfit.tshirt_2,
        arms      = outfit.arms,
        arms_2    = 0,
        torso_1   = outfit.torso_1,
        torso_2   = outfit.torso_2,
        pants_1   = outfit.pants_1,
        pants_2   = outfit.pants_2,
        shoes_1   = outfit.shoes_1,
        glasses_1 = outfit.glasses_1,
    })
end

function Framework.ResetCloathing()
    TriggerEvent("codem-appearance:reloadSkin")
end