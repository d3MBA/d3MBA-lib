-- Author: d3MBA#0001
-- Discord server: discord.gg/d3MBA

RegisterNetEvent('d3MBA-lib:client:UseGasMask', function()
    local ped = PlayerPedId()
    local model = GetEntityModel(ped) 
    
    Framework.WearingGasMask = not Framework.WearingGasMask
    if model == `mp_m_freemode_01` then -- Male
        if Framework.WearingGasMask then
            Framework.LoadAnim("mp_masks@standard_car@ds@")
            TaskPlayAnim(ped, "mp_masks@standard_car@ds@", "put_on_mask", 3.0, 3.0, 600, 51, 0, false, false, false)
            Wait(500)
            SetPedComponentVariation(ped, 1, Framework.GasMask["male"], 0, true)  
        else
            Framework.LoadAnim("missheist_agency2ahelmet")
            TaskPlayAnim(ped, "missheist_agency2ahelmet", "take_off_helmet_stand", 3.0, 3.0, 1200, 51, 0, false, false, false)
            Wait(700)
            SetPedComponentVariation(ped, 1, 0, 0, true)
        end
    else -- Female
        if Framework.WearingGasMask then
            Framework.LoadAnim("mp_masks@standard_car@ds@")
            TaskPlayAnim(ped, "mp_masks@standard_car@ds@", "put_on_mask", 3.0, 3.0, 600, 51, 0, false, false, false)
            Wait(500)
            SetPedComponentVariation(ped, 1, Framework.GasMask["female"], 0, true) 
        else
            Framework.LoadAnim("missheist_agency2ahelmet")
            TaskPlayAnim(ped, "missheist_agency2ahelmet", "take_off_helmet_stand", 3.0, 3.0, 1200, 51, 0, false, false, false)
            Wait(700)
            SetPedComponentVariation(ped, 1, 0, 0, true)
        end
    end
end)

function Framework.IsPlayerWearingGasMask()
    return Framework.WearingGasMask
end


AddEventHandler('onResourceStop', function(resource)
    if resource == GetCurrentResourceName() then        

        if Framework.WearingGasMask == true then 
            SetPedComponentVariation(PlayerPedId(), 1, 0, 0, true)
        end

    end
end)