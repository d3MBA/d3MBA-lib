-- Author: d3MBA#0001
-- Discord server: discord.gg/d3MBA

AddEventHandler('onResourceStart', function(resource)
    if resource == GetCurrentResourceName() then         
        if CheckFramework() == 'qbcore' then
            QBCore = exports["qb-core"]:GetCoreObject()

            -- Remove item function
            function Framework.RemoveItem(source, item, amount)
                local Player = QBCore.Functions.GetPlayer(source)
                local amount = amount or 1

                Player.Functions.RemoveItem(item, amount)
                TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[item], "remove", amount)
            end 

            -- Add item function
            function Framework.AddItem(source, item, amount)
                local Player = QBCore.Functions.GetPlayer(source)
                local amount = amount or 1 

                local AddItem = exports[Framework.Inventory]:AddItem(source, item, amount) -- Weight check 
                if AddItem == true then 
                    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[item], "add", amount)
                    return true 
                else
                    return false 
                end 
            end 

            -- Has item function
            function Framework.HasItem(source, item, amount)
                local Player = QBCore.Functions.GetPlayer(source)
                local item = Player.Functions.GetItemByName(item)
                local amount = amount or 1

                if item ~= nil then
                    if item.amount >= amount then 
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
                if account == "money" then account = "cash" end

                local Player = QBCore.Functions.GetPlayer(source)
                local amount = amount or 1

                if Player.Functions.GetMoney(account) >= tonumber(amount) then
                    return true
                else 
                    return false 
                end
            end

            -- Add money 
            function Framework.AddMoney(source, account, amount)
                if account == "money" then account = "cash" end

                local Player = QBCore.Functions.GetPlayer(source)
                local amount = amount or 1

                Player.Functions.AddMoney(account, tonumber(amount))
            end

            -- Remove money 
            function Framework.RemoveMoney(source, account, amount)
                if account == "money" then account = "cash" end

                local Player = QBCore.Functions.GetPlayer(source)
                local amount = amount or 1

                Player.Functions.RemoveMoney(account, tonumber(amount))
            end

            -- Create callback
            function Framework.CreateCallback(name, cb)
                QBCore.Functions.CreateCallback(name, cb)
            end  

            -- Create useable item 
            function Framework.CreateUseableItem(item, cb)
                QBCore.Functions.CreateUseableItem(item, cb) 
            end 
    
            -- Get player data
            function Framework.GetPlayerData(source)
                local Player = QBCore.Functions.GetPlayer(source) 
                
                local PlayerDataTable = {
                    -- Player data
                    Identifier = Framework.GetPlayerIdentifiers(source), -- Get player identifiers
                    Cid = Player.PlayerData.citizenid, -- Get player citizenid
                    FirstName = Player.PlayerData.charinfo.firstname, -- Get player firstname
                    LastName = Player.PlayerData.charinfo.lastname, -- Get player lastname
                    PhoneNumber = Player.PlayerData.charinfo.phone, -- Get player phone number
                    Birthdate = Player.PlayerData.charinfo.birthdate, -- Get player birthdate
                    -- Job data 
                    Job = Player.PlayerData.job.name, -- Get player job name
                    JobLabel = Player.PlayerData.job.label, -- Get player job label
                    JobGradeLabel = Player.PlayerData.job.grade.name, -- Get player job grade label
                    JobGradeLevel = Player.PlayerData.job.grade.level, -- Get player job grade level
                    JobPayment = Player.PlayerData.job.payment, -- Get player job payment
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