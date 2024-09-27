-- ghmattimysql.lua: This file is used to define the database functions for the ghmattimysql database library.

-- Define the fetchAll function using ghmattimysql functions
function Framework.fetchAll(query, params)
    return exports['ghmattimysql']:executeSync(query, params)
end

-- Define the fetchScalar function using ghmattimysql functions
function Framework.fetchScalar(query, params)
    return exports['ghmattimysql']:scalarSync(query, params)
end

-- Define the execute function using ghmattimysql functions
function Framework.execute(query, params)
    return exports['ghmattimysql']:executeSync(query, params)
end