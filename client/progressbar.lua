-- Author: d3MBA#0001
-- Discord server: discord.gg/d3MBA

-- Creates a new progress bar
---@param name<string> - The name of the progress bar
---@param label<string> - The text label to show on the progress bar
---@param duration<number> -  The duration of the progress bar (in milliseconds (ms))
---@param controls <boolean> - controls.movement, controls.carMovement, controls.mouse, controls.combat (disable: true/false)

function Framework.ProgressBar(name, label, duration, controls)
    -- helper that blocks the thread until the exact duration elapses (⚠️DO NOT MODIFY THIS FUNCTION!!!⚠️)
    local function startBar(startFn) -- ⚠️DO NOT MODIFY THIS FUNCTION!!!⚠️
        local startTime = GetGameTimer()
        local durMS = duration * 1000
        startFn()
        while GetGameTimer() - startTime < durMS do
            Wait(0)
        end
        return true
    end


    ----------------- QB ProgressBar -----------------
    if StringTrim(string.lower(Framework.ProgressBarScript)) == 'qbcore' then 
        return startBar(function()
            QBCore.Functions.Progressbar(name, label, duration * 1000, false, true, {
                disableMovement = controls.movement,
                disableCarMovement = controls.carMovement,
                disableMouse = controls.mouse,
                disableCombat = controls.combat,   
            }, {}, {}, {}, function()
            end)
        end)
    ----------------- ESX ProgressBar -----------------
    elseif StringTrim(string.lower(Framework.ProgressBarScript)) == 'esx' then 
        return startBar(function()
            ESX.Progressbar(label, duration * 1000,{
                FreezePlayer = controls.movement, 
                animation ={
                    type = "",
                    dict = "", 
                    lib ="" 
                }, 
            })
        end)
    ----------------- OX ProgressBar -----------------
    elseif StringTrim(string.lower(Framework.ProgressBarScript)) == 'ox_lib' then 
    -- E.G. FOR OX_LIB PROGRESSBAR, ⚠️IF YOU WANT TO USE OX_LIB PROGRESS BAR YOU NEED TO ADD THIS TO THE fxmanifest.lua file - (shared_script '@ox_lib/init.lua') AND COMMENT WAIT FUNCTION BELOW!⚠️
        return startBar(function()
            lib.progressBar({
                duration = duration * 1000,
                label = label,
                useWhileDead = false,
                canCancel = false,
                disable = {
                    move = controls.movement,
                    car = controls.carMovement,
                    combat = controls.combat,
                    mouse = controls.mouse,
                },
            })
        end)
    ----------------- ox_lib circle progressBar -----------------
    elseif StringTrim(string.lower(Framework.ProgressBarScript)) == 'ox_lib_circle' then  
        return startBar(function()
            lib.progressCircle({
                duration = duration * 1000,
                label = label,
                position = 'bottom',
                useWhileDead = false,
                canCancel = false,
                disable = {
                    move = controls.movement,
                    car = controls.carMovement,
                    combat = controls.combat,
                    mouse = controls.mouse,
                },
            })
        end)
    ------------------- Mythic ProgressBar -------------------
    elseif StringTrim(string.lower(Framework.ProgressBarScript)) == 'mythic' then 
        return startBar(function()
            TriggerEvent("mythic_progressbar:client:progress", {
                name = name,
                duration = duration * 1000,
                label = label,
                useWhileDead = false,
                canCancel = false,
                controlDisables = {
                    disableMovement = controls.movement,
                    disableCarMovement = controls.carMovement,
                    disableMouse = controls.mouse,
                    disableCombat = controls.combat,
                },
                }
            )
        end)
    ----------------- Other ProgressBar -----------------
    elseif StringTrim(string.lower(Framework.ProgressBarScript)) == 'other' then 
        -- Here you can add your own progress bar

        return startBar(function() end) 
    end 
end
