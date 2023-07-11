-- Author: d3MBA#0001
-- Discord server: discord.gg/d3MBA

-- Check if a table is empty
---@param table table - The table to check
function Framework.IsTableEmpty(table)
    return next(table) == nil
end

