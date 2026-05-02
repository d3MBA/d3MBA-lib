--- Spawn a vehicle, automatically set fuel, give keys, and optionally teleport player into it.
--- @param model string|number Vehicle model name or hash
--- @param coords vector3|vector4 Spawn coordinates
--- @param heading number|nil Heading of the vehicle (can be omitted or nil if coords is vector4)
--- @param fuel boolean|number|nil true for 100%, false/nil for game-default (random), or a number (0-100) for exact
--- @param teleportInto boolean Should the player be teleported into the driver seat?
--- @param cb function|nil Callback function that returns (networkId, vehicleEntity, plate)
function Framework.SpawnVehicle(model, coords, heading, fuel, teleportInto, cb)
    local modelHash = type(model) == 'string' and GetHashKey(model) or model

    if not IsModelInCdimage(modelHash) then
        print("[d3MBA-lib] Error: Model " .. tostring(model) .. " does not exist.")
        if cb then cb(0, 0) end
        return
    end

    RequestModel(modelHash)
    while not HasModelLoaded(modelHash) do
        Wait(10)
    end

    local spawnCoords = coords
    local spawnHeading = heading or 0.0

    -- Support for vector4
    if type(coords) == 'vector4' then
        spawnCoords = vector3(coords.x, coords.y, coords.z)
        spawnHeading = coords.w
    end

    -- Create vehicle on the server side if possible via standard natives, but doing it clientside here
    local vehicle = CreateVehicle(modelHash, spawnCoords.x, spawnCoords.y, spawnCoords.z, spawnHeading, true, false)
    local networkId = NetworkGetNetworkIdFromEntity(vehicle)

    SetNetworkIdCanMigrate(networkId, true)
    SetEntityAsMissionEntity(vehicle, true, false)
    SetVehicleHasBeenOwnedByPlayer(vehicle, true)
    SetVehicleNeedsToBeHotwired(vehicle, false)
    SetVehRadioStation(vehicle, 'OFF')
    SetModelAsNoLongerNeeded(modelHash)

    local plate = GetVehicleNumberPlateText(vehicle)
    
    -- Teleport into vehicle
    if teleportInto then
        TaskWarpPedIntoVehicle(PlayerPedId(), vehicle, -1)
    end

    -- Give keys
    TriggerEvent('d3MBA-lib:client:GiveVehicleKeys', vehicle, plate, model)

    -- Dynamic fuel - if number is provided set exact amount, if true set 100%, if false/nil leave vanilla random
    if type(fuel) == 'number' then
        TriggerEvent('d3MBA-lib:client:setFuel', vehicle, fuel + 0.0)
    elseif fuel == true then
        TriggerEvent('d3MBA-lib:client:setFuel', vehicle, 100.0)
    elseif fuel == false or fuel == nil then
        -- Do nothing, let the game or fuel script determine random amount
    end

    if cb then
        cb(networkId, vehicle, plate)
    end
end
