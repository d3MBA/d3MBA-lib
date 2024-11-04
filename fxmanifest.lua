fx_version 'cerulean'
game 'gta5'
lua54 'yes'

author "d3MBA#0001"

description "Library for QB-CORE / ESX framework"
discord "discord.gg/d3MBA"

version "4.0.0" -- Don't touch this

shared_scripts {
    'config/config.lua', -- Config file for the library 
    'config/scripts-config.lua',
    '@ox_lib/init.lua', -- For ox_lib uncomment this
    -- '@es_extended/imports.lua', -- For ESX framework uncomment this
    'utils/fuel.lua', 
    'item-labels/labels.lua',
}

server_scripts {
    'config/config.lua',
    'config/scripts-config.lua', -- scripts config file
    '@mysql-async/lib/MySQL.lua',
    'server/load-module.lua', 
    -- Resource checker & starter
    'resource-checker.lua', 
    'resource-starter.lua',
    -- Version checker
    'version-check.lua',
    'shared/*.lua',
}

client_scripts {
    'config/config.lua', -- Config file for the library
    'config/scripts-config.lua',
    'client/load-module.lua',
    'client/*.lua',
    -- Script
    'menu/*.lua',
    -- Script functions
    'script-functions/client/*.lua',
    'shared/*.lua',
}

files {
    'client/**/*.lua',
}