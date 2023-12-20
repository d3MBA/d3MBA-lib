-- Author: d3MBA#0001
-- Discord server: discord.gg/d3MBA

Framework = {}

Framework.CheckEmptyConfigValues = true -- [ true / false ] Set true if you want to check empty config values (print in console)  
 
Framework.AddResourecesManually = false -- [ true / false ] Set true if you want to add resources manually 
-- If is true you need to add resources in Framework.Resources table to work properly.  
-- Example: Framework.Resources = { 'd3MBA-vendingmachines', 'd3MBA-tailorjob'}

-- If is false you don't need to add resources in Framework.Resources table to work properly (it will be added automatically) 
-- all resources that start with d3MBA- will be added to Framework.Resources table  

Framework.Resources = {} -- Add resources manually here if Framework.AddResourecesManually is true

Framework.Database = 'oxmysql' -- [ 'mysql-async' / 'oxmysql' / 'ghmattimysql' ] Choose your SQL
Framework.Framework = 'qbcore' -- [ 'qbcore' / 'esx' ] Choose your framework

Framework.CoreObject = 'qb-core' -- [ 'qb-core' / 'qbx-core' ] Choose your core object (Only for QBCore and Qbox framework)

Framework.Inventory = 'ox_inventory' -- [ 'qb-inventory' / 'ps-inventory' / 'lj-inventory' / 'ox_inventory' / 'qs-inventory' ] Choose your inventory

Framework.LicenseType = 'cid' -- [ 'license' / 'steam' / 'cid' = (QBCORE = Citizen ID, ESX = Multicharacter identifier) ]
Framework.LicenseWithoutPrefix = true -- Remove [ license: / steam: ] Prefix from license

Framework.Target = 'qb-target' -- [ 'qb-target' / 'qtarget' / ox_target = 'qtarget' ] Set the target script name
Framework.Menu = 'ox_lib' -- [ 'qb-menu' / 'ox_lib' (ox_contextmenu) / 'nh-context' ] Set the menu
Framework.InputMenu = 'ox_lib' -- [ 'qb-input' / 'ox_lib' (ox_inputmenu) / 'nh-input' ] Set the target script name

Framework.FuelScript = 'ox_fuel' -- [ 'LegacyFuel' / 'ox_fuel' / 'cdn-fuel' / 'ps-fuel' / 'lj-fuel' / 'other' ] Set the fuel script name  
Framework.VehicleKeysScript = 'qbcore' -- [ 'qbcore' / 't1ger' / 'qs-vehiclekeys' / 'other' ] Set the vehicle keys script (qbcore = default qb-vehiclekeys script)

Framework.PhoneScript = 'qb-phone' -- [ 'qb-phone' / 'qs-smartphone' / 'gksphone' / 'other' ] Set the phone script name (phone notifications)
Framework.UseNotificationsScriptForPhoneNotifications = false -- [ true / false ] Set true if you want to use notifications script for phone notifications / mail notifications

Framework.ProgressBarScript = 'ox_lib' -- [ 'qbcore' / 'esx' / 'ox_lib' / 'ox_lib_circle' / 'mythic' / 'other' ] Set the progressbar script

Framework.Notifications = 'qbcore' -- [ 'qbcore' / 'esx' / 'okok' / 'codem' / 'ox_lib' / 'other' ] Set the notifications script
Framework.NotificationsSettings = {
    Info = 'primary', 
    Error = 'error', 
    Success = 'success',    
}

Framework.SpecificItemLabels = false -- [ true / false ] Set true if you want to use specific item labels for each item (item-laebls/labels.lua)

Framework.AcePermissions = {"command"} -- Add ace permissions here / Default: {"command"} gives admin access to all commands

Framework.InventoryImgPath = { -- Default path to inventory image file
    ["ox_inventory"]   = "ox_inventory/web/images/",
    ["qb-inventory"]   = "qb-inventory/html/images/",
    ["lj-inventory"]   = "lj-inventory/html/images/",
    ["ps-inventory"]   = "ps-inventory/html/images/",
    ["qs-inventory"]   = "qs-inventory/html/images/",
    ["mf-inventory"]   = "mf-inventory/nui/items/",
    -- Here you can add your own inventory icons path 
    -- ["other-inventory"]   = "other-inventory/images/",
}