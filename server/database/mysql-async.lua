-- mysql-async.lua: This file is used to define the database functions for the MySQL-Async database library.

function Framework.fetchAll(query, params)
    return MySQL.Sync.fetchAll(query, params)
end

-- Define the fetchScalar function using MySQL.Sync.fetchScalar
function Framework.fetchScalar(query, params)
    return MySQL.Sync.fetchScalar(query, params)
end

-- Define the execute function using MySQL.Sync.execute
function Framework.execute(query, params)
    return MySQL.Sync.execute(query, params)
end