-- Author: d3MBA#0001
-- Discord server: discord.gg/d3MBA

-- Check if a table is empty
---@param table table - The table to check
function Framework.IsTableEmpty(table)
    return next(table) == nil
end


-- Round value to decimal places 
---@param value number - The value to round
---@param numDecimalPlaces number - The number of decimal places to round to 
function Framework.Round(value, numDecimalPlaces) 
    if not numDecimalPlaces then return math.floor(value + 0.5) end
    local power = 10 ^ numDecimalPlaces
    return math.floor((value * power) + 0.5) / (power)
end


-- Random number generator
---@param min number - The minimum number
---@param max number - The maximum number
function Framework.Random(min, max)   
    return math.random(min, max)
end
