-- Author: d3MBA#0001
-- Discord server: discord.gg/d3MBA

AddEventHandler('onResourceStart', function(resource)
    if resource == GetCurrentResourceName() then 
        if CheckFramework() == 'esx' then 
            ESX = exports["es_extended"]:getSharedObject()

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

        end 
    end  
end)