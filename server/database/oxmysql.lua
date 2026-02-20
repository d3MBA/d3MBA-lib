-- This file is used to define the database functions for the oxmysql database library.
-- Uses MySQL compat layer (loaded via @mysql-async/lib/MySQL.lua in fxmanifest).

-- Define the fetchAll function using oxmysql functions
function Framework.fetchAll(query, params)
    if MySQL == nil or MySQL.query == nil then
        print('^1[d3MBA-lib] fetchAll error:^7 MySQL compat layer not loaded.')
        return {}
    end
    local ok, result = pcall(MySQL.query.await, query, params or {})
    if not ok then
        print('^1[d3MBA-lib] fetchAll error:^7 ' .. tostring(result))
        return {}
    end
    return result or {}
end

-- Define the fetchScalar function using oxmysql functions
function Framework.fetchScalar(query, params)
    if MySQL == nil or MySQL.scalar == nil then
        print('^1[d3MBA-lib] fetchScalar error:^7 MySQL compat layer not loaded.')
        return nil
    end
    local ok, result = pcall(MySQL.scalar.await, query, params or {})
    if not ok then
        print('^1[d3MBA-lib] fetchScalar error:^7 ' .. tostring(result))
        return nil
    end
    return result
end

-- Define the execute function using oxmysql functions
function Framework.execute(query, params)
    if MySQL == nil or MySQL.update == nil then
        print('^1[d3MBA-lib] execute error:^7 MySQL compat layer not loaded.')
        return nil
    end
    local ok, result = pcall(MySQL.update.await, query, params or {})
    if not ok then
        print('^1[d3MBA-lib] execute error:^7 ' .. tostring(result))
        return nil
    end
    return result
end