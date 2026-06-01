-- Author: d3MBA#0001
-- Discord server: discord.gg/d3MBA

-- This code is used to give vehicle keys to player
---@param vehicle <string> - The vehicle to give keys to
---@param plate <string> - The plate of the vehicle to give keys to
---@param model <string> - The model of the vehicle to give keys to example: (sultan, rumpo etc...)

RegisterNetEvent('d3MBA-lib:client:GiveVehicleKeys', function(vehicle, plate, model)
    Wait(500) -- Wait for the vehicle to fully spawn before giving keys | DO NOT REMOVE THIS, IF YOU REMOVE THIS, KEYS MIGHT NOT BE GIVEN TO PLAYER, CAUSING ISSUES
    local vehiclePlate = GetVehicleNumberPlateText(vehicle) or plate
    local keyScript = StringTrim(string.lower(Framework.VehicleKeysScript))

    if model == nil then 
        if vehicle and DoesEntityExist(vehicle) then
            model = GetDisplayNameFromVehicleModel(GetEntityModel(vehicle))
        end
    end 

    ----------------- DEFAULT QB-CORE -----------------
    if keyScript == 'qbcore' then 
        local vehiclePlate = vehiclePlate
        TriggerEvent("vehiclekeys:client:SetOwner", vehiclePlate) -- QB-CORE
        TriggerServerEvent("qb-vehiclekeys:server:AcquireVehicleKeys", vehiclePlate) -- QB-CORE (new)
    ------------------ QBX-CORE -----------------
    elseif keyScript == 'qbx-core' then 
        local vehiclePlate = vehiclePlate
        TriggerEvent('qb-vehiclekeys:client:AddKeys', vehiclePlate)
    ----------------- T1GER KEYS -----------------
    elseif keyScript == 't1ger' then
        exports['t1ger_keys']:SetVehicleLocked(vehicle, 0) -- If you using T1GER-KEYS script just uncoment line.
    ----------------- QUASAR VEHICLE KEYS ----------------- 
    elseif keyScript == 'qs-vehiclekeys' then
        exports['qs-vehiclekeys']:GiveKeys(vehiclePlate, model)
    ----------------- JAKSAM VEHICLE KEYS -----------------
    elseif keyScript == 'jaksam' then
        TriggerServerEvent("vehicles_keys:selfGiveVehicleKeys", vehiclePlate)
    ----------------- RENEWED VEHICLE KEYS -----------------
    elseif keyScript == 'renewed' then
        exports['Renewed-Vehiclekeys']:addKey(vehiclePlate)
    ----------------- CD-GARAGE VEHICLE KEYS -----------------
    elseif keyScript == 'cd-garage' then
        TriggerEvent('cd_garage:AddKeys', vehiclePlate)
    ----------------- WASABI CARLOCK -----------------
    elseif keyScript == 'wasabi' then
        exports.wasabi_carlock:GiveKey(vehiclePlate)

    ----------------- 0R VEHICLE KEYS -----------------
    elseif keyScript == '0r-vehiclekeys' then
        exports['0r-vehiclekeys']:GiveKeys(vehiclePlate)

    ----------------- MRNEWB VEHICLE KEYS -----------------
    elseif keyScript == 'mrnewbvehiclekeys' then
        if vehicle and DoesEntityExist(vehicle) then
            exports.MrNewbVehicleKeys:GiveKeys(vehicle)
        else
            exports.MrNewbVehicleKeys:GiveKeysByPlate(vehiclePlate)
        end

    ----------------- OTHER -----------------
    elseif keyScript == 'other' then
        -- Here you can put event or export to give player vehicle keys
        
    end 
end)

-- This code is used to remove vehicle keys from player
---@param vehicle <string> - The vehicle to remove keys from
---@param plate <string> - The plate of the vehicle to remove keys from
RegisterNetEvent('d3MBA-lib:client:RemoveVehicleKeys', function(vehicle, plate)
    local vehiclePlate = GetVehicleNumberPlateText(vehicle) or plate
    local keyScript = StringTrim(string.lower(Framework.VehicleKeysScript))

    if not vehiclePlate or vehiclePlate == '' then
        return
    end

    ----------------- QBX/QB VEHICLE KEYS -----------------
    if keyScript == 'qbx-core' or keyScript == 'qbcore' then
        TriggerServerEvent('qb-vehiclekeys:server:removeKeys', vehiclePlate)
    ----------------- QUASAR VEHICLE KEYS -----------------
    elseif keyScript == 'qs-vehiclekeys' then
        exports['qs-vehiclekeys']:RemoveKeys(vehiclePlate)
    ----------------- WASABI CARLOCK -----------------
    elseif keyScript == 'wasabi' then
        exports.wasabi_carlock:RemoveKey(vehiclePlate)

    ----------------- 0R VEHICLE KEYS -----------------
    elseif keyScript == '0r-vehiclekeys' then
        exports['0r-vehiclekeys']:RemoveKeys(vehiclePlate)

    ----------------- MRNEWB VEHICLE KEYS -----------------
    elseif keyScript == 'mrnewbvehiclekeys' then
        if vehicle and DoesEntityExist(vehicle) then
            exports.MrNewbVehicleKeys:RemoveKeys(vehicle)
        else
            exports.MrNewbVehicleKeys:RemoveKeysByPlate(vehiclePlate)
        end
    ----------------- OTHER -----------------
    elseif keyScript == 'other' then
        -- Here you can put event or export to remove player vehicle keys
    end
end)