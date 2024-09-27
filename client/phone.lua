-- Author: d3MBA#0001
-- Discord server: discord.gg/d3MBA

-- This function is used to send a phone notification to the client
-- The notification is displayed for 2.5 seconds by default
---@param title <string> - The title of the notification
---@param text <string> - The text of the notification
---@param icon <string> - The icon of the notification
---@param timeout <number> - The timeout of the notification

RegisterNetEvent('d3MBA-lib:client:SendPhoneNotification', function(title, text, icon, timeout)
    if Framework.UseNotificationsScriptForPhoneNotifications == false then 
        timeout = timeout or 2500 -- 2.5 seconds 

        --------------------------- QB-PHONE ---------------------------
        if StringTrim(Framework.PhoneScript) == "qb-phone" then 
            TriggerEvent('qb-phone:client:notify', {
                title = title,
                text = text,
                icon = icon,
                timeout = timeout
            })
        --------------------------- QS-SMARTPHONE ---------------------------
        elseif StringTrim(Framework.PhoneScript) == "qs-smartphone" then
            TriggerEvent('qs-smartphone:client:notify', {
                title = title,
                text = text,
                icon = icon,
                timeout = timeout
            })
        --------------------------- GKS-PHONE ---------------------------
        elseif StringTrim(Framework.PhoneScript) == "gksphone" then
            local NotifData = {
                title = title, 
                message = text, 
                img= '/html/static/img/icons/messages.png',
                duration = timeout
            }
            exports["gksphone"]:SendNotification(NotifData)
        --------------------------------- LB-PHONE ---------------------------
        elseif StringTrim(Framework.PhoneScript) == "lb-phone" then
            exports["lb-phone"]:SendNotification({
                title = title, 
                content = text, 
            })
        --------------------------- OTHER ---------------------------
        elseif StringTrim(Framework.PhoneScript) == "other" then
            -- Add your notification event or export here 
        end 
    else -- If you want to use the notifications script for phone notifications, if is Framework.UseNotificationsScriptForPhoneNotifications == true
        timeout = timeout or 5000 -- 5 seconds  
        TriggerEvent("d3MBA-lib:sendNotification", title .. " - " .. text, Framework.NotificationsSettings.Info, timeout)   
    end 
end)


-- Send phone mail event
-- Description: This event is used to send phone mail to the player
---@param sender <string> - The name of the sender of the mail
---@param subject <string> - The subject of the mail
---@param message <string> - The message of the mail
---@param button <string> - The button text to display on the mail

RegisterNetEvent('d3MBA-lib:client:SendPhoneMail', function(sender, subject, message, button)
    button = button or {}
    if Framework.UseNotificationsScriptForPhoneNotifications == false then 

        --------------------------- QB-PHONE ---------------------------
        if StringTrim(Framework.PhoneScript) == "qb-phone" then 
            TriggerServerEvent('qb-phone:server:sendNewMail', {
                sender = sender,
                subject = subject,
                message = message,
                button = button
            })
        --------------------------- QS-SMARTPHONE ---------------------------
        elseif StringTrim(Framework.PhoneScript) == "qs-smartphone" then
            TriggerServerEvent('qs-smartphone:server:sendNewMail', {
                sender = sender,
                subject = subject,
                message = message,
                button = button
            })
        --------------------------- GKS-PHONE ---------------------------
        elseif StringTrim(Framework.PhoneScript) == "gksphone" then
            local MailData = {
                sender = sender,
                image = '/html/static/img/icons/mail.png',
                subject = subject,
                message = message,
                button = button
            }
            exports["gksphone"]:SendNewMail(MailData)
        --------------------------------- LB-PHONE ---------------------------
        elseif StringTrim(Framework.PhoneScript) == "lb-phone" then
            print("lb-phone mail export called")
        --------------------------- OTHER ---------------------------
        elseif StringTrim(Framework.PhoneScript) == "other" then
            -- Add your notification event or export here 
        end 
    else -- If you want to use the notifications script for phone mails, if is Framework.UseNotificationsScriptForPhoneNotifications == true
        TriggerEvent("d3MBA-lib:sendNotification", sender .. " - " .. subject .. " - " .. message, Framework.NotificationsSettings.Info, 5000)  
    end 
end)

