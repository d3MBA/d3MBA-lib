-- Author: d3MBA#0001
-- Discord server: discord.gg/d3MBA

-- Open stash 
-- This function opens a stash with the given name, number of slots, and weight.
---@param stashName <string> - The name of the stash to open
---@param slots <number> - The number of slots in the stash
---@param weight <number> - The maximum weight that can be stored in the stash

CreateThread(function() 
    if StringTrim(string.lower(Framework.Target)) == "ox_target" then 
        Framework.Target = "qtarget"
    end 
end)

function Framework.OpenStash(stashName, slots, weight) 
    ----------------- QB-INVENTORY -----------------
    if StringTrim(string.lower(Framework.Inventory)) == 'qb-inventory' then
        TriggerServerEvent("inventory:server:OpenInventory", "stash", stashName, {
            maxweight = weight,
            slots = slots,
        })
        TriggerEvent ("inventory:client:SetCurrentStash", stashName)
    ----------------- OTHER -----------------
    elseif StringTrim(string.lower(Framework.Inventory)) == 'ox_inventory' then
        TriggerServerEvent('ox:loadStashes') 
        exports.ox_inventory:openInventory('stash', {id=stashName})
    ----------------- QS-INVENTORY -----------------
    elseif StringTrim(string.lower(Framework.Inventory)) == 'qs-inventory' then
        TriggerServerEvent("inventory:server:OpenInventory", "stash", stashName, {
            maxweight = weight,
            slots = slots,
        })
        TriggerEvent ("inventory:client:SetCurrentStash", stashName)
    ----------------- OTHER -----------------
    elseif StringTrim(string.lower(Framework.Inventory)) == 'other' then
        -- Here you can put event or export to open stash
    end
end 


-- Trigger server callback function
--- @param name <string> - The name of the callback 
--- @param ... <any> - The arguments to pass to the callback  

function Framework.TriggerServerCallback(name, ...)
    -- Create a promise
    local p = promise.new()

    -- QB-CORE
    if Framework.Framework == "qbcore" then 
        -- Get the QBCore object
        QBCore = exports[Framework.CoreObject]:GetCoreObject()

        -- Trigger the callback
        QBCore.Functions.TriggerCallback(name, function(result)
            p:resolve(result)
        end, ...)
        return Citizen.Await(p)

    -- ESX
    elseif Framework.Framework == "esx" then 
        -- Trigger the callback
        ESX.TriggerServerCallback(name, function(result)
            p:resolve(result)
        end, ...)
        return Citizen.Await(p)
    end
end

-- Returns the label for a given item
--- @param item <string> - The item to get the label for

function Framework.GetItemLabel(item)
    local WarningMsg = "^1---------------- WARNING ----------------\n^3Framework.GetItemLabel: Item - (%s) not found in %s\n^1---------------- WARNING ----------------"
    local ItemLabelsFile = "d3MBA-lib/item-labels/labels.lua"
    local ItemLabel = "ITEM LABEL NOT FOUND" 
    if item == nil or item == ' ' or item == '' then
        print(string.format(WarningMsg, "No item given"))
    else
        if Framework.SpecificItemLabels == true or Framework.Framework == 'esx' then
            if ItemLabels[item] ~= nil then
                ItemLabel = ItemLabels[item] 
            else
                print(string.format(WarningMsg, tostring(item), ItemLabelsFile))
            end
        elseif Framework.Framework == 'qbcore' and Framework.SpecificItemLabels == false then
            QBCore = exports[Framework.CoreObject]:GetCoreObject()
            if QBCore.Shared.Items[item] ~= nil then
                ItemLabel = QBCore.Shared.Items[item].label
            else
                ItemLabelsFile = "QBCore.Shared.Items"
                print(string.format(WarningMsg, tostring(item), ItemLabelsFile))
            end
        end
    end 
    return ItemLabel 
end

-- Delete object by net id 
---@param netId <number> - The net id of the object to delete
RegisterNetEvent('d3MBA-lib:client:DeleteObjectByNetId', function(netId)
    local entity = NetworkGetEntityFromNetworkId(netId) -- Get the entity from the net id
     
     if DoesEntityExist(entity) then
         SetEntityAsMissionEntity(entity, true, true)
         DeleteEntity(entity)
     end
end)

-- Get closest entity of prop
---@param propName <string> - The name of the prop to get the closest entity of
---@param distance <number> - The distance to check for the closest entity
function Framework.GetClosestEntityOfProp(propName, distance)
    local propHash = GetHashKey(propName) -- get the hash of the prop name
    local playerCoords = GetEntityCoords(PlayerPedId()) -- get the player's coordinates

    -- use the GetClosestObjectOfType function to find the closest entity of the specified type
    local entity = GetClosestObjectOfType(playerCoords.x, playerCoords.y, playerCoords.z, distance, propHash, false, false, false)

    return entity -- return the entity id of the closest entity
end

-- Get nearby players
---@param coords <vector3> - The coords to check for nearby players
---@param radius <number> - The radius to check for nearby players
---@param ignoreSource <boolean> - Whether or not to ignore the source player 
function Framework.GetNearbyPlayers(coords, radius, ignoreSource)
    local ignoreSource = ignoreSource or false
    local player = PlayerId()
    local nearbyPlayers = {}

    local activePlayers = GetActivePlayers()
    local activePlayersCount = #activePlayers

    for i = 1, activePlayersCount do
        local otherPlayer = activePlayers[i]
        local otherPlayerPed = GetPlayerPed(otherPlayer)
        local otherPlayerCoords = GetEntityCoords(otherPlayerPed)
        local distance = #(coords - otherPlayerCoords)

        if distance <= radius then
            if otherPlayer == player and ignoreSource == true then
                -- ignore the player who called the function
            else
                local otherPlayerServerId = GetPlayerServerId(otherPlayer)
                table.insert(nearbyPlayers, otherPlayerServerId)
            end
        end
    end

    return nearbyPlayers
end


-- Load Anim
---@param dict <string> - The name of the anim dict to load
function Framework.LoadAnim(dict)
    RequestAnimDict(dict); while not HasAnimDictLoaded(dict) do Wait(1) end
end

-- Load PTFX 
---@param dict <string> - The name of the ptfx asset to load
function Framework.LoadPtfxAsset(dict)
    RequestNamedPtfxAsset(dict); while not HasNamedPtfxAssetLoaded(dict) do Wait(1) end
end

-- Load Model
---@param model <string> - The name of the model to load
function Framework.LoadModel(model)
    if not HasModelLoaded(model) and IsModelInCdimage(model) then
        RequestModel(model)

        while not HasModelLoaded(model) do
            Wait(0)
        end
    end
end

-- TurnPlayerToFaceEntity
---@param playerCoords <vector3> - The coords of the player
---@param entityCoords <vector3> - The coords of the entity to face
function Framework.TurnPlayerToFaceEntity(playerCoords, entityCoords)
    local playerHeading = GetHeadingFromVector_2d(entityCoords.x - playerCoords.x, entityCoords.y - playerCoords.y)
    
    SetEntityCoordsNoOffset(PlayerPedId(), playerCoords.x, playerCoords.y, playerCoords.z, true, true, true)
    SetEntityHeading(PlayerPedId(), playerHeading)
end
