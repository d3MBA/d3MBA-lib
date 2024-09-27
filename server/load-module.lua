local dir = "server/%s/%s.lua"
local resource = "d3MBA-lib"

function LoadModule(module, selection)
    local chunk = LoadResourceFile(resource, dir:format(module, string.lower(selection)))
    if not chunk then
        return error(("Couldn't load module file: %s - %s"):format(module, string.lower(selection)), 3)
    end

    local fn, err = load(chunk, ("@@d3MBA-lib/server/%s/%s.lua"):format(module, string.lower(selection)))

    if not fn and err then
        return error(("Error loading module: %s - %s"):format(module, string.lower(selection)), 3)
    end

    return fn()
end

-- Load additional Lua files
LoadModule("framework", Framework.Framework)
LoadModule("framework", "shared-functions")
LoadModule("database", Framework.Database)

exports('GetFrameworkObject', function()
    return Framework
end)

