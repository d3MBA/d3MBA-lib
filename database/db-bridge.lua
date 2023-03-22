-- Author: d3MBA#0001
-- Discord server: discord.gg/d3MBA

Framework = Framework or {}

-- Main thread for initializing the database wrapper
CreateThread(function()
    -- Check if Framework.Database is defined and not empty
    if Framework.Database and string.len(Framework.Database) ~= 0 then
        -- If the configured database is 'mysql-async'
        if StringTrim(string.lower(Framework.Database)) == 'mysql-async' then
            -- Define the fetchAll function using MySQL.Sync.fetchAll
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
        -- If the configured database is 'oxmysql'
        elseif StringTrim(string.lower(Framework.Database)) == 'oxmysql' then
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
        -- If the configured database is 'ghmattimysql'
        elseif StringTrim(string.lower(Framework.Database)) == 'ghmattimysql' then
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
        -- If the configured database is not supported
        else
            ErrorPrint("database")
        end
    -- If Framework.Database is not defined or empty
    else
        ErrorPrint("database")
    end
end)
