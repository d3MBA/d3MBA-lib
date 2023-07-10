-- Author: d3MBA#0001
-- Discord server: discord.gg/d3MBA

CreateThread(function() 
    if StringTrim(string.lower(Framework.Target)) == "ox_target" then 
        Framework.Target = "qtarget"
    end 
end)


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


