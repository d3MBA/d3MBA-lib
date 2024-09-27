QBCore = exports[Framework.CoreObject]:GetCoreObject()


function Framework.GetPlayerJob()
    local playerData = QBCore.Functions.GetPlayerData()
    if playerData and playerData.job then
        return playerData.job.name, playerData.job.grade, playerData.job.label
    else
        return nil, nil, nil
    end
end

-- Check player job  
function Framework.CheckJob(source, job)
    if job == nil then return false end 

    if QBCore.Functions.GetPlayerData().job.name == job then 
        return true 
    else
        return false 
    end 
end 

-- Check player job duty 
function Framework.CheckJobDuty(source)            
    if QBCore.Functions.GetPlayerData().job.onduty == true then 
        return true 
    else
        return false 
    end 
end

function Framework.GetVehicleProperties(vehicle) 
    return QBCore.Functions.GetVehicleProperties(vehicle) 
end 

function Framework.ChangeClothes(clothes, onduty)
    if onduty == false then -- Change player clothes to job clothes 
        local gender = QBCore.Functions.GetPlayerData().charinfo.gender
        
        local outfitData = {}
        if gender == 0 then
            outfitData = {
                ["pants"] = {item = clothes.Male["pants_1"], texture = clothes.Male["pants_2"]},
                ["arms"] = {item = clothes.Male["arms"], texture = 0},
                ["t-shirt"] = {item = clothes.Male["tshirt_1"], texture = clothes.Male["tshirt_2"]},
                ["torso2"] = {item = clothes.Male["torso_1"], texture = clothes.Male["torso_2"]},
                ["shoes"] = {item = clothes.Male["shoes_1"], texture = clothes.Male["shoes_2"]},
                ["decals"] = {item = clothes.Male["decals_1"], texture = clothes.Male["decals_2"]},
                ["vest"] = {item = clothes.Male["vest_1"], texture = clothes.Male["vest_2"]},
                ["bag"] = {item = clothes.Male["bag_1"], texture = clothes.Male["bag_2"]},
                ["mask"] = {item = clothes.Male["mask_1"], texture = clothes.Male["mask_2"]},
                ["hat"] = {item = clothes.Male["helmet_1"], texture = clothes.Male["helmet_2"]},
                ["glass"] = {item = clothes.Male["glass_1"], texture = clothes.Male["glass_2"]},
                ["ear"] = {item = clothes.Male["ears_1"], texture = clothes.Male["ears_2"]},
                ["accessory"] = {item = clothes.Male["accessory_1"], texture = clothes.Male["accessory_2"]},
                -- Add other mappings for male clothes here
            }
        elseif gender == 1 then
            outfitData = {
                ["pants"] = {item = clothes.Female["pants_1"], texture = clothes.Female["pants_2"]},
                ["arms"] = {item = clothes.Female["arms"], texture = 0},
                ["t-shirt"] = {item = clothes.Female["tshirt_1"], texture = clothes.Female["tshirt_2"]},
                ["torso2"] = {item = clothes.Female["torso_1"], texture = clothes.Female["torso_2"]},
                ["shoes"] = {item = clothes.Female["shoes_1"], texture = clothes.Female["shoes_2"]},
                ["decals"] = {item = clothes.Female["decals_1"], texture = clothes.Female["decals_2"]},
                ["vest"] = {item = clothes.Female["vest_1"], texture = clothes.Female["vest_2"]},
                ["bag"] = {item = clothes.Female["bag_1"], texture = clothes.Female["bag_2"]},
                ["mask"] = {item = clothes.Female["mask_1"], texture = clothes.Female["mask_2"]},
                ["hat"] = {item = clothes.Female["helmet_1"], texture = clothes.Female["helmet_2"]},
                ["glass"] = {item = clothes.Female["glass_1"], texture = clothes.Female["glass_2"]},
                ["ear"] = {item = clothes.Female["ears_1"], texture = clothes.Female["ears_2"]},
                ["accessory"] = {item = clothes.Female["accessory_1"], texture = clothes.Female["accessory_2"]},
                -- Add other mappings for female clothes here
            }
        else
            print("Gender not found!")
            return 
        end

        TriggerEvent('qb-clothing:client:loadOutfit', {outfitData = outfitData}) -- Load outfit 
    else
        TriggerServerEvent("qb-clothes:loadPlayerSkin")
    end
end

-- On player loaded event 
RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
    TriggerEvent('d3MBA-lib:client:OnPlayerLoaded')
end)

RegisterNetEvent('d3MBA-lib:client:OnPlayerLoaded', function()
    -- AddEventHandler('d3MBA-lib:client:OnPlayerLoaded', function()
        -- When the player loads, this is the code you want to execute
    -- end)
end)

-- On player logout event 
RegisterNetEvent('QBCore:Client:OnPlayerUnload', function()
    TriggerEvent('d3MBA-lib:client:OnPlayerLogout')
end)

RegisterNetEvent('d3MBA-lib:client:OnPlayerLogout', function()
    -- AddEventHandler('d3MBA-lib:client:OnPlayerUnload', function()
        -- When the player exit, this is the code you want to execute
    -- end)
end)
