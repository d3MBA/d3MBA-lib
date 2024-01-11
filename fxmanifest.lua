fx_version 'cerulean'
game 'gta5'
lua54 'yes'

author "d3MBA#0001"

description "Library for QB-CORE / ESX framework"
discord "discord.gg/d3MBA"

version "2.5.1" -- Don't touch this

shared_scripts {
    'config.lua', -- Config file for the library 
    '@ox_lib/init.lua', -- For ox_lib uncomment this
    -- '@es_extended/imports.lua', -- For ESX framework uncomment this
    'framework/lib-shared-functions.lua', -- Shared functions for the library
    'utils/fuel.lua', 
    'item-labels/labels.lua',
}

server_scripts {
    'config.lua',
    -- Resource checker & starter
    'resource-checker.lua', 
    'resource-starter.lua',
    -- Database 
    '@mysql-async/lib/MySQL.lua',
    'database/db-bridge.lua',
    -- Framework
    'framework-starter.lua',
    'framework/QBCORE/server-qbcore.lua',
    'framework/ESX/server-esx.lua',
    'framework/shared-framework-server.lua',
    'framework/shared-functions.lua',
    -- Script functions 
    'script-functions/scripts-config.lua',
    'script-functions/server/*.lua',
    -- Version checker
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
    'framework/shared-functions.lua',
    -- Script functions
    'script-functions/scripts-config.lua',
    'script-functions/client/*.lua',
}
