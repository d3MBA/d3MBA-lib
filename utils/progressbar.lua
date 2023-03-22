-- Author: d3MBA#0001
-- Discord server: discord.gg/d3MBA

-- Creates a new progress bar
---@param name<string> - The name of the progress bar
---@param label<string> - The text label to show on the progress bar
---@param duration<number> -  The duration of the progress bar (in milliseconds (ms))
---@param controls <boolean> - controls.movement, controls.carMovement, controls.mouse, controls.combat (disable: true/false)

function Framework.ProgressBar(name, label, duration, controls)
    ----------------- QB ProgressBar -----------------
    if StringTrim(string.lower(Framework.ProgressBarScript)) == 'qbcore' then 
        QBCore.Functions.Progressbar(name, label, duration * 1000, false, true, {
            disableMovement = controls.movement,
            disableCarMovement = controls.carMovement,
            disableMouse = controls.mouse,
            disableCombat = controls.combat,   
        }, {
            animDict = "",
            anim = "",
            flags = "",
        }, {}, {}, function()
        end)
        Wait(duration * 1000) -- ⚠️ IN SOME PROGRESS BARS, THE WAIT FUNCTION IS NOT REQUIRED, IN THIS CASE, PLEASE COMMENT WAIT FUNCTION!
    ----------------- ESX ProgressBar -----------------
    elseif StringTrim(string.lower(Framework.ProgressBarScript)) == 'esx' then 
        ESX.Progressbar(label, duration * 1000,{
            FreezePlayer = controls.movement, 
            animation ={
                type = "",
                dict = "", 
                lib ="" 
            }, 
        })
    ----------------- OX ProgressBar -----------------
    elseif StringTrim(string.lower(Framework.ProgressBarScript)) == 'ox_lib' then 
    -- E.G. FOR OX_LIB PROGRESSBAR, ⚠️IF YOU WANT TO USE OX_LIB PROGRESS BAR YOU NEED TO ADD THIS TO THE fxmanifest.lua file - (shared_script '@ox_lib/init.lua') AND COMMENT WAIT FUNCTION BELOW!⚠️
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
    ----------------- Other ProgressBar -----------------
    elseif StringTrim(string.lower(Framework.ProgressBarScript)) == 'other' then 
        -- Here you can add your own progress bar

        Wait(duration * 1000) -- ⚠️ IN SOME PROGRESS BARS, THE WAIT FUNCTION IS NOT REQUIRED, IN THIS CASE, PLEASE COMMENT WAIT FUNCTION!
    end 
end