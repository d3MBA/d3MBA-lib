-- Author: d3MBA#0001
-- Discord server: discord.gg/d3MBA

-- Error print
---@param type <string> -  Type of error 
---@param ... <string> -  Error arguments (any)

function ErrorPrint(type, ...)
    print("^1---------------- WARNING ----------------")
    if type == "database" then
        print("^3Choose your ^5database^3 in the config!")
    elseif type == "framework" then
        print("^3Choose your ^5framework^3 in the config!")
    elseif type == "invalid_framework" then 
        print("^3Invalid framework: ^0" .. ... .. "^3! Choose your ^5framework^3 in the config!")
    elseif type == "menu" then
        print("^3Choose your ^menu^3 in the config!")
    elseif type == "empty_config_value" then 
        print("^3Empty config value: ^0" .. ... .. "^3! Please fill in the config!")
    end
    print("^1---------------- WARNING ----------------")
end

 
-- Gets the identifiers for a given player
---@param src <number> -  The player to get the identifiers for (ID)

function Framework.GetPlayerIdentifiers(source)
    local src = tonumber(source)
    if src == 0 or src == nil then print("Framework.GetPlayerIdentifiers: No source specified: ("..src..")") return end

    local identifier = nil

    ----------------- LICENSE -----------------
    if StringTrim(string.lower(Framework.LicenseType)) == 'license' then
        identifier = GetPlayerIdentifier(src, 1)
    ----------------- STEAM -----------------
    elseif StringTrim(string.lower(Framework.LicenseType)) == 'steam' then
        identifier = GetPlayerIdentifier(src, 0)
    ----------------- CID -----------------
    elseif StringTrim(string.lower(Framework.LicenseType)) == 'cid' then -- Only for QBCORE framework
        if Framework.Framework == 'qbcore' then 
            local Player = QBCore.Functions.GetPlayer(src)
            local cid = Player.PlayerData.citizenid
            return cid
        elseif Framework.Framework == 'esx' then 
            local PlayerInfo = GetPlayerInfo(src)
            return PlayerInfo.char_identifier
        end 
    end

    if Framework.LicenseWithoutPrefix then
        return string.gsub(identifier, Framework.LicenseType .. ':', "")
    end

    return identifier -- return player identifier 
end


-- Returns the player server id from the identifier
---@param identifier <string> - The identifier to get the player server id for
function Framework.GetPlayerIdFromIdentifier(identifier)
    for _, playerId in ipairs(GetPlayers()) do
        if Framework.GetPlayerIdentifiers(playerId) == identifier then 
            return playerId
        end 
    end
end


-- Check if player is admin 
---@param source <number> -  The player to check (ID)
function Framework.IsPlayerAdmin(source)
    if source == 0 or source == nil then print("Framework.IsPlayerAdmin: No source specified: ("..source..")") return end

    for k, v in pairs(Framework.AcePermissions) do
        if IsPlayerAceAllowed(source, v) then
            return true
        end
    end
    return false
end


-- Register stash
---@param id <number> - The ID of the stash
---@param label <string> - The name of the stash
---@param slots <number> - The number of slots in the stash
---@param weight <number> - The weight of the stash
---@param owner <string> - The owner of the stash
---@param groups <string> - The groups that have access to the stash
---@param coords <number> - The coordinates of the stash

function Framework.RegisterStash(id, label, slots, weight, owner, groups, coords)
    ----------------- OX_INVENTORY -----------------
    if StringTrim(string.lower(Framework.Inventory == 'ox_inventory')) then
        exports.ox_inventory:RegisterStash(id, label, slots, weight, owner, groups, coords)
    ----------------- QB-INVENTORY -----------------
    elseif StringTrim(string.lower(Framework.Inventory == 'qb-inventory')) then

    ----------------- LJ-INVENTORY -----------------
    elseif StringTrim(string.lower(Framework.Inventory == 'lj-inventory')) then

    ----------------- QS-INVENTORY -----------------
    elseif StringTrim(string.lower(Framework.Inventory == 'qs-inventory')) then

    ----------------- OTHER -----------------
    elseif StringTrim(string.lower(Framework.Inventory == 'other')) then
        
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
RegisterNetEvent('d3MBA-lib:server:DeleteObjectByNetId', function(netId)
    if netId == 0 or netId == nil then print("d3MBA-lib:server:DeleteObjectByNetId: No netId specified: ("..netId..")") return end 
    -- Trigger the client event for all connected clients
    TriggerClientEvent('d3MBA-lib:client:DeleteObjectByNetId', -1, netId)
end)