-- Author: d3MBA#0001
-- Discord server: discord.gg/d3MBA

-- Open stash 
-- This function opens a stash with the given name, number of slots, and weight.
---@param stashName <string> - The name of the stash to open
---@param slots <number> - The number of slots in the stash
---@param weight <number> - The maximum weight that can be stored in the stash

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
    if name == nil or name == '' or name == ' ' then print("Framework.TriggerServerCallback: No callback name specified: ("..name..")") return end -- no callback name specified

    -- Create a promise
    local p = promise.new()

    -- QB-CORE
    if Framework.Framework == "qbcore" then 
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

local oxItemLabels = {}

CreateThread(function() 
    if StringTrim(string.lower(Framework.Inventory)) == "ox_inventory" then 
        for item, data in pairs(exports.ox_inventory:Items()) do
            oxItemLabels[item] = data.label
        end
    end
end)

function Framework.GetItemLabel(item)
    local WarningMsg = "^1---------------- WARNING ----------------\n^3Framework.GetItemLabel: Item - (%s) not found in %s\n^1---------------- WARNING ----------------"
    local ItemLabelsFile = "d3MBA-lib/item-labels/labels.lua"
    local ItemLabel = "ITEM LABEL NOT FOUND" 
    if item == nil or item == ' ' or item == '' then
        print(string.format(WarningMsg, "No item given"))
    else
        if Framework.SpecificItemLabels == true or StringTrim(string.lower(Framework.Framework)) == 'esx' and StringTrim(string.lower(Framework.Inventory)) ~= 'ox_inventory' then
            ItemLabel = ItemLabels[item] or ItemLabel
            if ItemLabel == "ITEM LABEL NOT FOUND" then
                print(string.format(WarningMsg, tostring(item), ItemLabelsFile))
            end
        elseif StringTrim(string.lower(Framework.Framework)) == 'qbcore' and StringTrim(string.lower(Framework.Inventory)) ~= 'ox_inventory' then
            ItemLabel = QBCore.Shared.Items[item] and QBCore.Shared.Items[item].label or ItemLabel
            if ItemLabel == "ITEM LABEL NOT FOUND" then
                ItemLabelsFile = "QBCore.Shared.Items"
                print(string.format(WarningMsg, tostring(item), ItemLabelsFile))
            end
        elseif StringTrim(string.lower(Framework.Inventory)) == "ox_inventory" then
            ItemLabel = oxItemLabels[item] or ItemLabel
            if ItemLabel == "ITEM LABEL NOT FOUND" then
                ItemLabelsFile = "ox_inventory/data/items.lua"
                print(string.format(WarningMsg, tostring(item), ItemLabelsFile))
            end
        end
    end 
    return ItemLabel 
end
 
-- Delete object by net id 
---@param netId <number> - The net id of the object to delete
RegisterNetEvent('d3MBA-lib:client:DeleteObjectByNetId', function(netId)
    if netId == 0 or netId == nil then print("Framework.DeleteObjectByNetId: No net id specified: ("..netId..")") return end -- no net id specified

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
    if propName == nil or propName == '' or propName == ' ' then print("Framework.GetClosestEntityOfProp: No prop name specified: ("..propName..")") return end -- no prop name specified
    if distance == nil or distance <= 0 then print("Framework.GetClosestEntityOfProp: No distance specified: ("..distance..")") return end -- no distance specified

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
    if coords == nil then print("Framework.GetNearbyPlayers: No coords specified: ("..coords..")") return end -- no coords specified
    if radius == nil or radius <= 0 then print("Framework.GetNearbyPlayers: No radius specified: ("..radius..")") return end -- no radius specified

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

-- Check if any player is nearby
---@param coords <vector3> - The coordinates to check for nearby players
---@param radius <number> - The radius to check for nearby players
function Framework.IsAnyPlayerNearby(coords, radius)
    if coords == nil then print("Framework.IsAnyPlayerNearby: No coords specified: ("..coords..")") return end -- no coords specified  
    if radius == nil or radius <= 0 then print("Framework.IsAnyPlayerNearby: No radius specified: ("..radius..")") return end -- no radius specified

    local playerPed = PlayerPedId()
    local playerCoords = GetEntityCoords(playerPed)
    local isAnyPlayerNearby = false

    for _, otherPlayer in ipairs(GetActivePlayers()) do
        if otherPlayer ~= PlayerId() then
            local otherPlayerPed = GetPlayerPed(otherPlayer)
            local otherPlayerCoords = GetEntityCoords(otherPlayerPed)
            local distance = #(coords - otherPlayerCoords)

            if distance <= radius then
                isAnyPlayerNearby = true
                break
            end
        end
    end

    return isAnyPlayerNearby
end

-- Load Anim
---@param dict <string> - The name of the anim dict to load
function Framework.LoadAnim(dict)
    if dict == "" or dict == nil then print("Framework.LoadAnim: No anim dict specified: ("..dict..")") return end -- no anim dict specified

    RequestAnimDict(dict); while not HasAnimDictLoaded(dict) do Wait(1) end
end

-- Load PTFX 
---@param dict <string> - The name of the ptfx asset to load
function Framework.LoadPtfxAsset(dict)
    if dict == "" or dict == nil then print("Framework.LoadPtfxAsset: No ptfx asset specified: ("..dict..")") return end -- no ptfx asset specified

    RequestNamedPtfxAsset(dict); while not HasNamedPtfxAssetLoaded(dict) do Wait(1) end
end

-- Load Model
---@param model <string> - The name of the model to load
function Framework.LoadModel(model)
    if model == "" or model == nil then print("Framework.LoadModel: No model specified: ("..model..")") return end -- no model specified

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
    if playerCoords == nil then print("Framework.TurnPlayerToFaceEntity: No player coords specified: ("..playerCoords..")") return end -- no player coords specified
    if entityCoords == nil then print("Framework.TurnPlayerToFaceEntity: No entity coords specified: ("..entityCoords..")") return end -- no entity coords specified

    local playerHeading = GetHeadingFromVector_2d(entityCoords.x - playerCoords.x, entityCoords.y - playerCoords.y)
    
    SetEntityCoordsNoOffset(PlayerPedId(), playerCoords.x, playerCoords.y, playerCoords.z, true, true, true)
    SetEntityHeading(PlayerPedId(), playerHeading)
end

-- Get item inventory img 
-- @param item <string> - The name of the item to get the inventory image for 
function Framework.GetItemImg(item)
    if item == nil or item == '' or item == ' ' then print("Framework.GetItemImg: No item specified: ("..item..")") return end -- no item specified
    if Framework.InventoryImgPath == nil then print("Framework.GetItemImg: No inventory image path specified: ("..Framework.InventoryImgPath..")") return end -- no inventory image path specified

    return 'nui://' ..Framework.InventoryImgPath[Framework.Inventory] ..item.. '.png'
end 
