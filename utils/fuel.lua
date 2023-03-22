-- Author: d3MBA#0001
-- Discord server: discord.gg/d3MBA

-- Function to set the fuel of a vehicle to a specific amount.
---@param vehicle <string> - The vehicle whose fuel level should be set.
---@param fuel <number> - The fuel level to set the vehicle to.
--  Example: Framework.Fuel(playerVehicle, 20.0)

function Framework.Fuel(vehicle, fuel)
    exports[Framework.FuelScript]:SetFuel(vehicle, fuel)
end 