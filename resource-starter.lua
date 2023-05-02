-- Author: d3MBA#0001
-- Discord server: discord.gg/d3MBA

AddEventHandler('onResourceStart', function(resource)
    if resource == GetCurrentResourceName() then
      -- Start dependent script after library has loaded
      Wait(1500)
      StartResources(Framework.Resources) 

      if Framework.CheckEmptyConfigValues == true then
        CheckEmptyConfigValues() -- Check if any config values are empty or nil
      end 

    end
end)

-- Start all scripts from Framework.Resources table after library has loaded  
function StartResources(resources) 
    for i, resource in ipairs(resources) do
        StopResource(resource)
        Wait(250) 
        StartResource(resource)
        Wait(500) -- Wait for 0.5 seconds between starting each script
    end
end


-- Check if any config values are empty or nil
function CheckEmptyConfigValues() 
    local config = {
        Resources = Framework.Resources,
        Database = Framework.Database,
        Framework = Framework.Framework,
        Inventory = Framework.Inventory,
        LicenseType = Framework.LicenseType,
        LicenseWithoutPrefix = Framework.LicenseWithoutPrefix,
        Target = Framework.Target,
        Menu = Framework.Menu,
        InputMenu = Framework.InputMenu,
        FuelScript = Framework.FuelScript,
        VehicleKeysScript = Framework.VehicleKeysScript,
        PhoneScript = Framework.PhoneScript,
        ProgressBarScript = Framework.ProgressBarScript,
        Notifications = Framework.Notifications,
        SpecificItemLabels = Framework.SpecificItemLabels
    }

    local emptyConfigFound = false

    for key, value in pairs(config) do -- Loop through config table 
        if value == "" or value == nil or value == " " then -- Check if value is empty or nil 
            emptyConfigFound = true -- Set emptyConfigFound to true if any value is empty or nil
            ErrorPrint("empty_config_value", key) -- Print error message
        end
    end

    return emptyConfigFound
end

CreateThread(function() -- Check if any config values are empty or nil 
    if Framework.CheckEmptyConfigValues == true then
        while true do
            local emptyConfigFound = CheckEmptyConfigValues()
            if emptyConfigFound then
                Wait(5000) -- Wait for 5 seconds before checking again
            else
                break
            end
        end
    end
end)
