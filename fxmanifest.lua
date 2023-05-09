fx_version 'cerulean'
game 'gta5'
lua54 'yes'

author "d3MBA#0001"

description "Library for QB-CORE / ESX framework"
discord "discord.gg/d3MBA"

version "1.0.2" -- Don't touch this

shared_scripts {
    'config.lua', -- Config file for the library 
    '@ox_lib/init.lua', -- For ox_lib uncomment this
    'framework/shared-functions.lua', -- Shared functions for the library
    'utils/fuel.lua', 
    'item-labels/labels.lua',
}

server_scripts {
    'config.lua',
    'resource-checker.lua', 
    'resource-starter.lua',
    -- Database 
    '@mysql-async/lib/MySQL.lua',
    'database/db-bridge.lua',
    -- Framework
    'framework/QBCORE/server-qbcore.lua',
    'framework/ESX/server-esx.lua',
    'framework/shared-framework-server.lua',
    'version-check.lua',
}

client_scripts {
    'config.lua', -- Config file for the library 
    -- Script
    'framework/shared-framework-client.lua',
    'menu/*.lua',
    'utils/*.lua',
    -- Framework
    'framework/QBCORE/client-qbcore.lua',
    'framework/ESX/client-esx.lua',

}
