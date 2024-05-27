-- Author: d3MBA#0001
-- Discord server: discord.gg/d3MBA

CreateThread(function() 
    if CheckFramework() == 'esx' then
        ESX = exports["es_extended"]:getSharedObject()

        function Framework.CheckJob(source, job)
            if job == nil then return false end 

            if ESX.PlayerData.job.name == job then 
                return true 
            else
                return false 
            end 
        end 
        
        -- Check player job duty 
        function Framework.CheckJobDuty(source)            
            return true 
        end

        function Framework.GetVehicleProperties(vehicle) 
            return ESX.Game.GetVehicleProperties(vehicle)  
        end 

        function Framework.ChangeClothes(clothes, onduty) 
            print(json.encode(clothes))
            print(clothes, onduty)
            if onduty == false then -- Change player clothes to job clothes 
                ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)
                    if skin.sex == 0 then 
                        TriggerEvent('skinchanger:loadClothes', skin, clothes["male"])
                    else
                        TriggerEvent('skinchanger:loadClothes', skin, clothes["female"])
                    end 
                end)
            else -- Reset player clothes 
                ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)
                    TriggerEvent('skinchanger:loadSkin', skin)
                    TriggerEvent('esx:restoreLoadout')
                end)
            end
        end

        -- On player loaded event 
        RegisterNetEvent('esx:playerLoaded', function()
            TriggerEvent('d3MBA-lib:client:OnPlayerLoaded')
        end)
        
        RegisterNetEvent('d3MBA-lib:client:OnPlayerLoaded', function()
            -- AddEventHandler('d3MBA-lib:client:OnPlayerLoaded', function()
                -- When the player loads, this is the code you want to execute
            -- end)
        end)

        -- On player logout event 
        RegisterNetEvent('esx:onPlayerLogout', function()
            TriggerEvent('d3MBA-lib:client:OnPlayerLogout')
        end)
        
        RegisterNetEvent('d3MBA-lib:client:OnPlayerLogout', function()
            -- AddEventHandler('d3MBA-lib:client:OnPlayerLogout', function()
                -- When the player exit, this is the code you want to execute
            -- end)
        end)
         
    end 
end)
