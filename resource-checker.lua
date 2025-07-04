-- resource-checker.lua
-- Author: d3MBA#0001
-- Discord server: discord.gg/d3MBA

CreateThread(function()
    local numResources = GetNumResources()
    local currentResourceName = GetCurrentResourceName()

    for i = 0, numResources - 1 do
        local resourceName = GetResourceByFindIndex(i)

        if resourceName:match("^d3MBA%-")
            and not resourceName:match(" ")
            and not resourceName:match("2")
            and resourceName ~= currentResourceName then
            table.insert(Framework.Resources, resourceName)
        end
    end
end)