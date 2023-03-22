# README

Welcome to the d3MBA-lib! This library is a versatile configuration tool for your FiveM server, supporting both ESX and QBCore frameworks. It allows you to manage multiple resources and configurations in a single place.

## Configuration File

The configuration file (config.lua) is the heart of this library. It consists of several sections where you can specify the settings for various aspects of your server. 

### Framework Settings

- `Framework.CheckEmptyConfigValues`: Set to `true` to enable console output for empty config values.
- `Framework.AddResourecesManually`: Set to `true` if you want to add resources manually. If set to `false`, resources starting with "d3MBA-" will be added automatically.
- `Framework.Resources`: If `Framework.AddResourecesManually` is set to `true`, add resources manually in this table (e.g., 'd3MBA-vendingmachines', 'd3MBA-tailorjob').

### Database and Framework Settings

- `Framework.Database`: Choose the SQL you use (e.g., 'mysql-async', 'oxmysql', 'ghmattimysql').
- `Framework.Framework`: Choose the framework you use (e.g., 'qbcore', 'esx').

### Inventory Settings

- `Framework.Inventory`: Choose the inventory you use (e.g., 'qb-inventory', 'lj-inventory', 'ox_inventory', 'qs-inventory').

### License Settings

- `Framework.LicenseType`: Choose the license type (e.g., 'license', 'steam', 'cid').
- `Framework.LicenseWithoutPrefix`: Set to `true` to remove the "license:" or "steam:" prefix from the license.

### Target and Menu Settings

- `Framework.Target`: Set the target script name (e.g., 'qb-target', 'qtarget').
- `Framework.Menu`: Set the menu script name (e.g., 'qb-menu', 'ox_lib' (ox_contextmenu), 'nh-context').
- `Framework.InputMenu`: Set the input menu script name (e.g., 'qb-input', 'ox_lib' (ox_inputmenu), 'nh-input').

### Fuel and Vehicle Keys Settings

- `Framework.FuelScript`: Set the fuel script name (e.g., 'LegacyFuel', 'ps-fuel', 'lj-fuel', 'other').
- `Framework.VehicleKeysScript`: Set the vehicle keys script (e.g., 'qbcore', 't1ger', 'qs-vehiclekeys', 'other').

### Phone and Notifications Settings

- `Framework.PhoneScript`: Set the phone script name (e.g., 'qb-phone', 'qs-smartphone', 'other').
- `Framework.UseNotificationsScriptForPhoneNotifications`: Set to `true` if you want to use notifications script for phone notifications/mail notifications.

### Progress Bar and Notifications Settings

- `Framework.ProgressBarScript`: Set the progressbar script (e.g., 'qbcore', 'esx', 'ox_lib', 'other').
- `Framework.Notifications`: Set the notifications script (e.g., 'qbcore', 'esx', 'okok', 'codem', 'other').
- `Framework.NotificationsSettings`: Customize the appearance of notifications (e.g., Info, Error, Success).

### Item Labels Settings

- `Framework.SpecificItemLabels`: Set to `true` if you want to use specific item labels for each item (item-labels/labels.lua).

## Supported Features

The d3MBA Library Resource offers extensive support for various settings and configurations, including:

- ESX and QBCore frameworks
- Multiple SQL types (mysql-async, oxmysql, ghmattimysql)
- Various inventory systems (qb-inventory, lj-inventory, ox_inventory, qs-inventory)
- License types (license, steam, cid)
- Target and menu scripts (qb-target, qtarget, qb-menu, ox_lib, nh-context, qb-input, nh-input)
- Fuel scripts (LegacyFuel, ps-fuel, lj-fuel, other)
- Vehicle keys scripts (qbcore, t1ger, qs-vehiclekeys, other)
- Phone scripts (qb-phone, qs-smartphone, other)
- Progress bar scripts (qbcore, esx, ox_lib, other)
- Notification scripts (qbcore, esx, okok, codem, other)
- Customizable notifications settings (Info, Error, Success)
- Specific item labels support

## Contact Details for Support

If you need assistance or have any questions, feel free to join discord server: https://discord.gg/d3MBA


