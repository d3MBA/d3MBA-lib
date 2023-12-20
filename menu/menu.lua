-- Author: d3MBA#0001
-- Discord server: discord.gg/d3MBA

RegisterNetEvent("d3MBA-lib:client:OpenMenu", function(menuType, menuHeaderOptions, menuOptions, menuFooterOptions)    
    local menu = {}

    -- HEADER SECTION 

    if menuHeaderOptions then 
        if menuType == "qb-menu" then
            table.insert(menu, {
                disabled = menuHeaderOptions.disabled or false,
                header = menuHeaderOptions.title,
                txt = menuHeaderOptions.context,
                -- icon = menuHeaderOptions.icon or nil,

                params = {
                    isServer = menuHeaderOptions.isServer or false,
                    event = menuHeaderOptions.event,
                    args = menuHeaderOptions.args or nil,
                }
            })
        elseif menuType == "nh-context" then
                table.insert(menu, {
                    header = menuHeaderOptions.title,
                    context = menuHeaderOptions.context,
                    icon = menuHeaderOptions.icon or nil,
                    disabled = menuHeaderOptions.disabled or false,
                    server = menuHeaderOptions.isServer or false,
                    event = menuHeaderOptions.event,
                    args = {menuHeaderOptions.args or nil},
                })
        elseif menuType == "ox_lib" then 
            if menuHeaderOptions.isServer == false or menuHeaderOptions.isServer == nil then 
                table.insert(menu, {
                    title = menuHeaderOptions.title,
                    description = menuHeaderOptions.context,
                    icon = menuHeaderOptions.icon or nil, 
                    disabled = menuHeaderOptions.disabled or false,
                    event = menuHeaderOptions.event or nil,
                    args = menuHeaderOptions.args or nil,
                })
            elseif menuHeaderOptions.isServer == true then 
                table.insert(menu, {
                    title = menuHeaderOptions.title,
                    description = menuHeaderOptions.context,
                    icon = menuHeaderOptions.icon or nil, 
                    disabled = menuHeaderOptions.disabled or false,
                    serverEvent = menuHeaderOptions.event,
                    args = menuHeaderOptions.args or nil,
                })
            end
            
        end
    end 

    -- OPTIONS SECTION

    for k, v in pairs(menuOptions) do 
        if menuType == "qb-menu" then
            if v.image == nil or v.image == "" or v.image == " " then -- if image is nil 
                table.insert(menu, {
                    header = v.title,
                    txt = v.context,
                    -- icon = v.icon or nil, 
                    disabled = v.disabled or false,
                    params = {
                        isServer = v.isServer or false,
                        event = v.event or nil,
                        args = v.args or nil,
                    },                 
                })
            elseif v.image ~= nil then -- if image is not nil then add image to menu  
                    table.insert(menu, {
                        header = v.image .. " " .. v.title,
                        txt = v.context,
                        -- icon = v.icon or nil, 
                        disabled = v.disabled or false,
                        params = {
                            isServer = v.isServer or false,
                            event = v.event or nil,
                            args = v.args or nil,
                        },                 
                    })
                    
            end 
        elseif menuType == "nh-context" then
            table.insert(menu, {
                header = v.title,
                context = v.context,
                icon = v.icon or nil,
                disabled = v.disabled or false,
                server = v.isServer or false,
                image = v.image or nil, 
                event = v.event or nil,
                args = {v.args or nil},
            })
        elseif menuType == "ox_lib" then
            if v.isServer == false or v.isServer == nil then 
                table.insert(menu, {
                    title = v.title,
                    description = v.context,
                    icon = v.icon or nil, 
                    image = v.image or nil, 
                    disabled = v.disabled or false,
                    event = v.event,
                    args = v.args or nil,
                })
            elseif v.isServer == true then 
                table.insert(menu, {
                    title = v.title,
                    description = v.context,
                    icon = v.icon or nil, 
                    image = v.image or nil, 
                    disabled = v.disabled or false,
                    serverEvent = v.event,
                    args = v.args or nil,
                })
            end 
        end
    end

    -- FOOTER SECTION

    if menuFooterOptions then
        if menuType == "qb-menu" then
            if menuFooterOptions.event ~= nil then
                table.insert(menu, {
                    disabled = menuFooterOptions.disabled or false,
                    header = menuFooterOptions.title,
                    txt = menuFooterOptions.context,
                    -- icon = menuFooterOptions.icon or nil, 
                    
                    params = {
                        isServer = menuFooterOptions.isServer or false,
                        event = menuFooterOptions.event,
                        args = menuFooterOptions.args or args,
                    }
                })
            else 
                table.insert(menu, {
                    disabled = menuFooterOptions.disabled or false,
                    header = menuFooterOptions.title,
                    txt = menuFooterOptions.context,
                    -- icon = menuFooterOptions.icon or nil, 
                    
                    params = {
                        exports['qb-menu']:closeMenu(menu)
                    }
                })
            end  
        elseif menuType == "nh-context" then
            if menuFooterOptions.event ~= nil then
                table.insert(menu, {
                    header = menuFooterOptions.title,
                    context = menuFooterOptions.context,
                    icon = menuFooterOptions.icon or nil,
                    disabled = menuFooterOptions.disabled or false,
                    server = menuFooterOptions.isServer or false,
                    event = menuFooterOptions.event,
                    args = {menuFooterOptions.args or nil},
                })
            else
                table.insert(menu, {
                    header = menuFooterOptions.title,
                    context = menuFooterOptions.context,
                    icon = menuFooterOptions.icon or nil,
                    disabled = menuFooterOptions.disabled or false,
                    server = menuFooterOptions.isServer or false,
                    event = "nh-context:closeMenu",
                    args = {menu},
                })
            end 
        elseif menuType == "ox_lib" then
            if menuFooterOptions.event ~= nil then
                table.insert(menu, {
                    title = menuFooterOptions.title,
                    description = menuFooterOptions.context,
                    icon = menuFooterOptions.icon or nil, 
                    disabled = menuFooterOptions.disabled or false,
                    event = menuFooterOptions.event,
                    args = menuFooterOptions.args or nil,
                })
            else 
                table.insert(menu, {
                    title = menuFooterOptions.title,
                    description = menuFooterOptions.context,
                    icon = menuFooterOptions.icon or nil, 
                    disabled = menuFooterOptions.disabled or false,
                    event = "close",
                })
            end  
        end
    end

    -- OPEN MENU (REGISTER MENU)

    if menuType == "qb-menu" then
        exports['qb-menu']:openMenu(menu)
    elseif menuType == "nh-context" then
        TriggerEvent('nh-context:createMenu', menu)
    elseif menuType == "ox_lib" then
        lib.registerContext({id = "universalMenu", title = menuHeaderOptions.ox_title, options = menu})
        lib.showContext('universalMenu')
    end
end) 
