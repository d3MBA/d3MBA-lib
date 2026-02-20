-- Discord server: discord.gg/d3MBA

Framework = {} -- ⚠️DO NOT MODIFY THIS!!!⚠️
Framework.Resources = {} -- ⚠️DO NOT MODIFY THIS!!!⚠️


Framework.CheckEmptyConfigValues = true -- [ true / false ] Set true if you want to check empty config values (print in console)  

Framework.Database = '' -- [ 'mysql-async' / 'oxmysql' / 'ghmattimysql' ] Choose your SQL
Framework.Framework = '' -- [ 'qbcore' / 'esx' ] Choose your framework

Framework.CoreObject = '' -- [ 'qb-core' / 'qbx-core' ] QBCore/QBx-Core only | ⚠️ Even if you are using QBx-Core, keep this set to 'qb-core' | If you are using ESX leave this empty: ''

Framework.Inventory = '' -- [ 'qb-inventory' / 'ps-inventory' / 'lj-inventory' / 'ox_inventory' / 'qs-inventory' ] Choose your inventory

Framework.LicenseType = '' -- [ 'license' / 'steam' / 'cid' = (QBCORE = Citizen ID, ESX = Multicharacter identifier) ]
Framework.LicenseWithoutPrefix = true -- Remove [ license: / steam: ] Prefix from license

-- ⚠️IF YOU'RE USING OX_TARGET SET Framework.Target = "qtarget"⚠️
Framework.Target = '' -- [ 'qb-target' / 'qtarget' / ⚠️IF YOU'RE USING OX_TARGET SET Framework.Target = "qtarget"⚠️ ] Set the target script name

Framework.Menu = '' -- [ 'qb-menu' / 'ox_lib' (ox_contextmenu) / 'nh-context' ] Set the menu
Framework.InputMenu = '' -- [ 'qb-input' / 'ox_lib' (ox_inputmenu) / 'nh-input' ] Set the target script name

Framework.FuelScript = '' -- [ 'LegacyFuel' / 'ox_fuel' / 'cdn-fuel' / 'ps-fuel' / 'lj-fuel' / 'other' ] Set the fuel script name  
Framework.VehicleKeysScript = '' -- [ 'qbcore' / 't1ger' / 'qs-vehiclekeys' / 'jaksam' / 'renewed' / 'cd-garage' / 'other' ] Set the vehicle keys script (qbcore = default qb-vehiclekeys script)

Framework.PhoneScript = '' -- [ 'qb-phone' / 'qs-smartphone' / 'gksphone' / 'other' ] Set the phone script name (phone notifications)
Framework.UseNotificationsScriptForPhoneNotifications = false -- [ true / false ] Set true if you want to use notifications script for phone notifications / mail notifications

Framework.ProgressBarScript = '' -- [ 'qbcore' / 'esx' / 'ox_lib' / 'ox_lib_circle' / 'mythic' / 'other' ] Set the progressbar script

Framework.Cloathing = '' -- codem-appearance / tgiann-clothing / esx_skin / fivem-appearance / illenium-appearance / ox_appearance / qb-clothing

Framework.Notifications = '' -- [ 'qbcore' / 'esx' / 'okok' / 'codem' / 'ox_lib' / 'other' ] Set the notifications script
Framework.NotificationsSettings = {
    Info = 'primary',
    Error = 'error', 
    Success = 'success',    
}

Framework.BlackMoney = {
    Mode = '', -- [ 'item' / 'account' ] Choose if black money is handled as an inventory item or account, DEPENDING ON YOUR SERVER FRAMEWORK!
    Name = '', -- The item name or account name depending on the mode, ⚠️DEPENDING ON YOUR SERVER FRAMEWORK!: (black_money / dirty_money)⚠️
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