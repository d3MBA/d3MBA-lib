-- Author: d3MBA#0001
-- Discord server: discord.gg/d3MBA

-- Send a notification to the player
---@param text <string> - The text of the notification
---@param type <string> - The type of notification to send (Info, Error, Success)
---@param length <number> - The length of time to display the notification (in milliseconds (ms))

RegisterNetEvent("d3MBA-lib:sendNotification", function(text, type, length)
    local type = type or Framework.NotificationsSettings.Info -- Default to info notification if no type is specified 
    local length = length or 5000 -- 5 seconds
    --------------------------- QB-CORE ---------------------------
    if StringTrim(Framework.Notifications) == "qbcore" then 
        TriggerEvent("QBCore:Notify", text, type, length) -- e.g. for QB-CORE notifications
    --------------------------- ESX ---------------------------
    elseif StringTrim(Framework.Notifications) == "esx" then
        TriggerEvent("esx:showNotification", text) -- e.g. for esx notifications 
    --------------------------- OKOK Notify ---------------------------
    elseif StringTrim(Framework.Notifications) == "okok" then
        TriggerEvent('okokNotify:Alert', "", text, length, type) -- e.g. for okokNotify 
    --------------------------- CODEM ---------------------------
    elseif StringTrim(Framework.Notifications) == "codem" then
        TriggerEvent('codem-notification', text, length, type) -- e.g. for codem notifications
    --------------------------- OTHER ---------------------------
    elseif StringTrim(Framework.Notifications) == "other" then
        -- Add your notification event or export here 
    end 
end)