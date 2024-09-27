-- Author: d3MBA#0001
-- Discord server: discord.gg/d3MBA

-- Function to set the fuel of a vehicle to a specific amount.
---@param vehicle <string> - The vehicle whose fuel level should be set.
---@param fuel <number> - The fuel level to set the vehicle to.
--  Example: Framework.Fuel(playerVehicle, 20.0)

function Framework.Fuel(vehicle, fuel)
    local vehicle = vehicle or GetVehiclePedIsIn(PlayerPedId(), false) -- Default to the vehicle the player is in if no vehicle is specified 
    local fuel = fuel or 50.0 -- Default to 50.0 if no fuel is specified 
    
    if Framework.FuelScript == "ox_fuel" then -- If the fuel script is ox_fuel, set the fuel level using the ox_fuel function. 
        Entity(vehicle).state.fuel = fuel
    else
        exports[Framework.FuelScript]:SetFuel(vehicle, fuel)
    end 
end 

RegisterNetEvent("d3MBA-lib:client:setFuel", function(vehicle, fuel) -- Event to set the fuel of a vehicle. 
    local vehicleEntity = NetworkGetEntityFromNetworkId(vehicle) 
    Framework.Fuel(vehicleEntity, fuel)
end) 