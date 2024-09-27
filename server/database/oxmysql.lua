-- oxmysql.lua: This file is used to define the database functions for the oxmysql database library.

-- Define the fetchAll function using oxmysql functions
function Framework.fetchAll(query, params)
    return MySQL.query ~= nil and MySQL.query.await(query, params) or exports['oxmysql']:executeSync(query, params)
end

-- Define the fetchScalar function using oxmysql functions
function Framework.fetchScalar(query, params)
    return MySQL.scalar ~= nil and MySQL.scalar.await(query, params) or exports['oxmysql']:scalarSync(query, params)
end

-- Define the execute function using oxmysql functions
function Framework.execute(query, params)
    return MySQL.update ~= nil and MySQL.update.await(query, params) or exports['oxmysql']:executeSync(query, params)
end