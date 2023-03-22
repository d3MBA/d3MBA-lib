-- Author: d3MBA#0001
-- Discord server: discord.gg/d3MBA

CreateThread(function() 
    if CheckFramework() == 'qbcore' then
        QBCore = exports["qb-core"]:GetCoreObject()
        
        -- Check player job  
        function Framework.CheckJob(source, job)
            if job == nil then return false end 

            if QBCore.Functions.GetPlayerData().job.name == job then 
                return true 
            else
                return false 
            end 
        end 
        
        -- Check player job duty 
        function Framework.CheckJobDuty(source)            
            if QBCore.Functions.GetPlayerData().job.onduty == true then 
                return true 
            else
                return false 
            end 
        end
        
        -- On player loaded event 
        RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
            TriggerEvent('d3MBA-lib:client:OnPlayerLoaded')
        end)
        
        RegisterNetEvent('d3MBA-lib:client:OnPlayerLoaded', function()
            -- AddEventHandler('d3MBA-lib:client:OnPlayerLoaded', function()
                -- When the player loads, this is the code you want to execute
            -- end)
        end)

        -- On player logout event 
        RegisterNetEvent('QBCore:Client:OnPlayerUnload', function()
            TriggerEvent('d3MBA-lib:client:OnPlayerLogout')
        end)
        
        RegisterNetEvent('d3MBA-lib:client:OnPlayerLogout', function()
            -- AddEventHandler('d3MBA-lib:client:OnPlayerUnload', function()
                -- When the player exit, this is the code you want to execute
            -- end)
        end)
    end  
end)
