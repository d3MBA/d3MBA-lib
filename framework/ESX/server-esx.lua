-- Author: d3MBA#0001
-- Discord server: discord.gg/d3MBA

AddEventHandler('onResourceStart', function(resource)
    if resource == GetCurrentResourceName() then 
        if CheckFramework() == 'esx' then 
            ESX = exports["es_extended"]:getSharedObject()

            -- Get player's inventory function 
            function Framework.GetInventory(source)
                local Player = ESX.GetPlayerFromId(source)
                local items, inventory = {}, {}

                items = Player.getInventory()
            
                for k, v in pairs(items) do 
                    if (v.amount and v.amount > 0) or (v.count and v.count > 0) then 
                        table.insert(inventory, {
                            name  = v.name, 
                            label = v.label,
                            amount = (v.amount or v.count),
                            info  = (v.info or v.metadata or false),
                        })
                    end
                end
            
                return inventory
            end

            -- Remove item function
            function Framework.RemoveItem(source, item, amount)
                local Player = ESX.GetPlayerFromId(source)
                local amount = amount or 1

                Player.removeInventoryItem(item, amount)
            end 

            -- Add item function
            function Framework.AddItem(source, item, amount, metadata)
                local Player = ESX.GetPlayerFromId(source)
                local amount = amount or 1

                if Player.canCarryItem(item, amount) then -- Weight check 
                    Player.addInventoryItem(item, amount, metadata)
                    return true 
                else
                    return false 
                end
            end 

            -- Has item function
            function Framework.HasItem(source, item, amount)
                local Player = ESX.GetPlayerFromId(source)
                local item = Player.getInventoryItem(item)
                local amount = amount or 1
            
                if item ~= nil then
                    if item.count >= amount then 
                        return true 
                    else
                        return false 
                    end 
                else
                    return false
                end  
            end 

            -- Get money 
            function Framework.GetMoney(source, account, amount)
                if account == "cash" then account = "money" end 

                local Player = ESX.GetPlayerFromId(source)
                local amount = amount or 1

                if Player.getAccount(account).money >= tonumber(amount) then
                    return true
                else 
                    return false 
                end
            end

            -- Add money 
            function Framework.AddMoney(source, account, amount)
                if account == "cash" then account = "money" end

                local Player = ESX.GetPlayerFromId(source)
                local amount = amount or 1

                Player.addAccountMoney(account, tonumber(amount))
            end

            -- Remove money 
            function Framework.RemoveMoney(source, account, amount)
                if account == "cash" then account = "money" end

                local Player = ESX.GetPlayerFromId(source)
                local amount = amount or 1

                Player.removeAccountMoney(account, tonumber(amount))
            end
            
            -- Create callback
            function Framework.CreateCallback(name, cb)
                ESX.RegisterServerCallback(name, cb)
            end

            -- Create useable item 
            function Framework.CreateUseableItem(item, cb)
                ESX.RegisterUsableItem(item, cb)
            end 

            function GetPlayerInfo(source)
                local PlayerInfo = {}
            
                local xPlayer = ESX.GetPlayerFromId(source)
                local identifier = xPlayer.identifier
                PlayerInfo.char_identifier = identifier
                local result = Framework.fetchAll('SELECT firstname, lastname, dateofbirth, phone_number FROM users WHERE identifier = @identifier', { ['@identifier'] = identifier })
                if result[1] then
                    PlayerInfo.firstname = result[1].firstname
                    PlayerInfo.lastname = result[1].lastname
                    PlayerInfo.dateofbirth = result[1].dateofbirth
                    PlayerInfo.phone_number = result[1].phone_number
                end
                return PlayerInfo
            end
            
            
            -- Get player data
            function Framework.GetPlayerData(source)
                local src = source 
                local PlayerInfo = GetPlayerInfo(source)
                local Player = ESX.GetPlayerFromId(src) 
                Wait(100)

                local PlayerDataTable = {
                    -- Player data
                    Identifier = Framework.GetPlayerIdentifiers(source), -- Get player identifier
                    Cid = PlayerInfo.char_identifier, -- Get player citizenid
                    FirstName = PlayerInfo.firstname, -- Get player firstname
                    LastName = PlayerInfo.lastname, -- Get player lastname
                    PhoneNumber = PlayerInfo.phone_number, -- Get player phone number
                    Birthdate = PlayerInfo.dateofbirth, -- Get player birthdate
                    -- Job data 
                    Job = Player.getJob().name, -- Get player job name
                    JobLabel = Player.getJob().label, -- Get player job label
                    JobGradeLabel = Player.getJob().grade_label, -- Get player job grade label
                    JobGradeLevel = Player.getJob().grade, -- Get player job grade level
                    JobPayment = Player.getJob().grade_salary, -- Get player job salary
                }
                return PlayerDataTable -- Return player data
            end 
            
            -- Callback player data 
            -- Sends the player data to the client
            Framework.CreateCallback('d3MBA-lib:GetPlayerData', function(source, cb)
                cb(Framework.GetPlayerData(source))
            end)

            -- Callback function to check if a player has a specific item and a certain amount of it
            --- @param source <string> - representing the source from which the call is originated
            --- @param cb <function> - representing a callback function to be called after the operations
            --- @param ItemName <string> - representing the name of the item to be checked
            --- @param Amount <number> - representing the quantity of the item to be checked
            Framework.CreateCallback('d3MBA-lib:server:CheckIfPlayerHasItem', function(source, cb, ItemName, Amount)
                local Warning = function(msg) 
                    local warningMsg = "^1---------------- WARNING ----------------\n^3Callback:d3MBA-lib:server:CheckIfPlayerHasItem: %s is nil\n^1---------------- WARNING ----------------"
                    print(string.format(warningMsg, msg))
                    cb(string.format(warningMsg, msg))
                end
            
                if ItemName == nil and Amount == nil then
                    Warning("Item name and amount")
                    return
                elseif ItemName == nil then
                    Warning("Item name")
                    return
                elseif Amount == nil then
                    Warning("Amount")
                    return
                end
            
                cb(Framework.HasItem(source, ItemName, Amount))
            end)

            -- Event function to remove a specific item and a certain amount of it from the player's inventory
            --- @param ItemName <string> - representing the name of the item to be removed
            --- @param Amount <number> - representing the quantity of the item to be removed
            RegisterNetEvent('d3MBA-lib:server:RemoveItem', function(ItemName, Amount)
                if ItemName == nil then return end 
                -- If the source has the item in the specified amount, remove it
                if Framework.HasItem(source, ItemName, Amount) == true then
                    Framework.RemoveItem(source, ItemName, Amount)
                end
            end)

            -- Callback function to check if a player has a specific item and a certain amount of it
            --- @param source <string> - representing the source from which the call is originated
            --- @param cb <function> - representing a callback function to be called after the operations
            --- @param account <string> - representing the name of the account to be checked
            --- @param amount <number> - representing the amount of the account to be checked
            Framework.CreateCallback('d3MBA-lib:server:GetPlayerMoney', function(source, cb, account, amount)
                local Warning = function(msg) 
                    local warningMsg = "^1---------------- WARNING ----------------\n^3Callback:d3MBA-lib:server:GetPlayerMoney: %s is nil\n^1---------------- WARNING ----------------"
                    print(string.format(warningMsg, msg))
                    cb(string.format(warningMsg, msg))
                end
            
                if account == nil and amount == nil then
                    Warning("Account and amount")
                    return
                elseif account == nil then
                    Warning("Account")
                    return
                elseif amount == nil then
                    Warning("Amount")
                    return
                end
            
                -- If the source has the money in the specified account and amount, return true
                cb(Framework.GetMoney(source, account, amount))
            end)

            -- Callback function to get a player's inventory
            --- @param source <string> - representing the source from which the call is originated
            Framework.CreateCallback('d3MBA-lib:server:GetPlayerInventory', function(source, cb)
                -- Return the inventory directly
                cb(Framework.GetInventory(source))
            end)
            
            -- Check if player is admin callback
            ---@param source <number> -  The player to check (ID)
            Framework.CreateCallback('d3MBA-lib:server:IsPlayerAdmin', function(source, cb)
                cb(Framework.IsPlayerAdmin(source))
            end)

        end 
    end  
end)