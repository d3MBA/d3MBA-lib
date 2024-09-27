-- Author: d3MBA#0001
-- Discord server: discord.gg/d3MBA

-- Trim spaces from the beginning and end of a string
function StringTrim(string)
    string = string:gsub("%s+", "")
    string = string.gsub(string, "%s+", "")
    return string
end

-- Check framework | esx or qbcore
-- This function checks if the user has selected a framework in the config.
-- If not, it checks if either esx or qbcore is started. If one of them is started, it will automatically select that framework.

-- If none of the above are true, it will output an error message and return nil.

function CheckFramework()
    -- Check if the user has selected a framework in the config
    if StringTrim(string.lower(Framework.Framework)) == 'qbcore' then
        return 'qbcore'
    elseif StringTrim(string.lower(Framework.Framework)) == 'esx' then
        return 'esx'
    elseif Framework.Framework == ' ' or Framework.Framework == '' then
        -- Check if esx is started
        if GetResourceState('es_extended') == 'started' then
            print("^5Auto selected framework: ^3ESX")
            return 'esx'
        -- Check if qbcore is started
        elseif GetResourceState('qb-core') == 'started' then
            print("^5Auto selected framework: ^3QBCORE")
            return 'qbcore'
        else
            -- If neither of the above are true, return an error message and return nil
            ErrorPrint('framework')
            return nil
        end
    elseif Framework.Framework ~= 'esx' or Framework.Framework ~= 'qbcore' then
        ErrorPrint('invalid_framework', Framework.Framework)
        return nil
    end
end


