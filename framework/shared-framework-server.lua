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
---@param source <number> -  The player to get the identifiers for (ID)

function Framework.GetPlayerIdentifiers(source)
    local identifier = nil

    ----------------- LICENSE -----------------
    if StringTrim(string.lower(Framework.LicenseType)) == 'license' then
        identifier = GetPlayerIdentifier(source, 1)
    ----------------- STEAM -----------------
    elseif StringTrim(string.lower(Framework.LicenseType)) == 'steam' then
        identifier = GetPlayerIdentifier(source, 0)
    ----------------- CID -----------------
    elseif StringTrim(string.lower(Framework.LicenseType)) == 'cid' then -- Only for QBCORE framework
        if Framework.Framework == 'qbcore' then 
            local Player = QBCore.Functions.GetPlayer(source)
            local cid = Player.PlayerData.citizenid
            return cid
        elseif Framework.Framework == 'esx' then 
            local PlayerInfo = GetPlayerInfo(source)
            return PlayerInfo.char_identifier
        end 
    end

    if Framework.LicenseWithoutPrefix then
        return string.gsub(identifier, Framework.LicenseType .. ':', "")
    end

    return identifier -- return player identifier 
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

function Framework.GetItemLabel(item)
    local ItemLabel = nil 
    if item == nil or item == ' ' or item == '' then
        print("^1---------------- WARNING ----------------")
        print("^3Framework.GetItemLabel: No item given")
        print("^1---------------- WARNING ----------------")
    else
        if Framework.SpecificItemLabels == true then 
            ItemLabel = ItemLabels[item] 
        elseif Framework.Framework == 'esx' then
            ItemLabel = ItemLabels[item] 
        elseif Framework.Framework == 'qbcore' then
            ItemLabel = QBCore.Shared.Items[item].label
        end
    end 
    return ItemLabel 
end