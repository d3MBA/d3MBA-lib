-- Author: d3MBA#0001
-- Discord server: discord.gg/d3MBA

-- This code is used to give vehicle keys to player
---@param vehicle <string> - The vehicle to give keys to
---@param plate <string> - The plate of the vehicle to give keys to
---@param model <string> - The model of the vehicle to give keys to example: (sultan, rumpo etc...)

RegisterNetEvent('d3MBA-lib:client:GiveVehicleKeys', function(vehicle, plate, model)
    local vehiclePlate = GetVehicleNumberPlateText(vehicle) or plate

    if model == nil then 
        model = GetDisplayNameFromVehicleModel(GetEntityModel(vehicle))
    end 

    ----------------- DEFAULT QB-CORE -----------------
    if StringTrim(string.lower(Framework.VehicleKeysScript)) == 'qbcore' then 
        TriggerEvent("vehiclekeys:client:SetOwner", vehiclePlate) -- QB-CORE
    ----------------- T1GER KEYS -----------------
    elseif StringTrim(string.lower(Framework.VehicleKeysScript)) == 't1ger' then
        exports['t1ger_keys']:SetVehicleLocked(vehicle, 0) -- If you using T1GER-KEYS script just uncoment line.
    ----------------- QUASAR VEHICLE KEYS ----------------- 
    elseif StringTrim(string.lower(Framework.VehicleKeysScript)) == 'qs-vehiclekeys' then
        exports['qs-vehiclekeys']:GiveKeys(vehiclePlate, model)
    ----------------- JAKSAM VEHICLE KEYS -----------------
    elseif StringTrim(string.lower(Framework.VehicleKeysScript)) == 'jaksam' then
        TriggerServerEvent("vehicles_keys:selfGiveVehicleKeys", vehiclePlate)
    ----------------- RENEWED VEHICLE KEYS -----------------
    elseif StringTrim(string.lower(Framework.VehicleKeysScript)) == 'renewed' then
        exports['Renewed-Vehiclekeys']:addKey(vehiclePlate)
    ----------------- CD-GARAGE VEHICLE KEYS -----------------
    elseif StringTrim(string.lower(Framework.VehicleKeysScript)) == 'cd-garage' then
        TriggerEvent('cd_garage:AddKeys', vehiclePlate)

    ----------------- OTHER -----------------
    elseif StringTrim(string.lower(Framework.VehicleKeysScript)) == 'other' then
        -- Here you can put event or export to give player vehicle keys
        
    end 
end)