-- Author: d3MBA#0001
-- Discord server: discord.gg/d3MBA

-- This code is used to give vehicle keys to player
---@param vehicle <string> - The vehicle to give keys to
---@param plate <string> - The plate of the vehicle to give keys to

RegisterNetEvent('d3MBA-lib:client:GiveVehicleKeys', function(vehicle, plate)
    local vehiclePlate = GetVehicleNumberPlateText(vehicle) or plate

    ----------------- DEFAULT QB-CORE -----------------
    if StringTrim(string.lower(Framework.VehicleKeysScript)) == 'qbcore' then 
        TriggerEvent("vehiclekeys:client:SetOwner", vehiclePlate) -- QB-CORE
    ----------------- T1GER KEYS -----------------
    elseif StringTrim(string.lower(Framework.VehicleKeysScript)) == 't1ger' then
        exports['t1ger_keys']:SetVehicleLocked(vehicle, 0) -- If you using T1GER-KEYS script just uncoment line.
    ----------------- QUASAR VEHICLE KEYS ----------------- 
    elseif StringTrim(string.lower(Framework.VehicleKeysScript)) == 'qs-vehiclekeys' then
        TriggerServerEvent('vehiclekeys:server:givekey', vehiclePlate, vehicle)
    ----------------- OTHER -----------------
    elseif StringTrim(string.lower(Framework.VehicleKeysScript)) == 'other' then
        -- Here you can put event or export to give player vehicle keys
        
    end 
end)