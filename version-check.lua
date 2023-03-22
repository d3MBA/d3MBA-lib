-- Author: d3MBA#0001
-- Discord server: discord.gg/d3MBA

CreateThread(function()
    Wait(5000)
    local scriptName = GetCurrentResourceName()
    local currentVersion = GetResourceMetadata(scriptName, 'version', 0)
    
    local githubRepo = 'd3MBA/version-check'
    local githubFile = scriptName .. '.txt'
    local githubUrl = 'https://raw.githubusercontent.com/' .. githubRepo .. '/master/' .. githubFile
    
    PerformHttpRequest(githubUrl, function(statusCode, data, headers)
        if statusCode == 200 and data then
            local success, versionInfo = pcall(json.decode, data)
            if success and versionInfo.version then
                local latestVersion = versionInfo.version
                if latestVersion ~= currentVersion then
                    -- A new version is available
                    print('^3['..scriptName..'] - New Version Available.^0\nCurrent Version: ^5'..currentVersion..'^0.\nNew Version: ^5'..versionInfo.version..'^0.\nUpdate Notes: ^5'..versionInfo.notes..'^0.')
                end
            else
                print('Failed to parse version information from GitHub')
            end
        else
            print('^1Version check disabled because GitHub is down.^0')
        end
    end, 'GET', '', { ['Content-Type'] = 'application/json' })
end)