Menus Documentation

This code is a versatile function for creating menus in a FiveM server. It supports three different menu libraries: qb-menu, nh-context, and ox_lib. To use this function, you'll need to trigger the `d3MBA-lib:client:OpenMenu` event and pass the required arguments. Here's an example of how to create a menu for each of the supported libraries:

```lua 

    -- Example for qb-menu
    local menuHeaderOptions = {
        title = "Main Menu",
        context = "This is the main menu",
        icon = "fas fa-home",
        disabled = false,
        isServer = false,
        event = "menu:example",
        args = {"example argument"}
    }

    local menuOptions = {
        {
            title = "Option 1",
            context = "This is option 1",
            icon = "fas fa-cog",
            disabled = false,
            isServer = false,
            event = "option1:example",
            args = {"option 1 argument"}
        },
        {
            title = "Option 2",
            context = "This is option 2",
            icon = "fas fa-cog",
            disabled = false,
            isServer = false,
            event = "option2:example",
            args = {"option 2 argument"}
        }
    }

    local menuFooterOptions = {
        title = "Close",
        context = "Close the menu",
        icon = "fas fa-times",
        disabled = false,
        isServer = false,
        event = nil,
        args = nil
    }

    TriggerEvent("d3MBA-lib:client:OpenMenu", "qb-menu", menuHeaderOptions, menuOptions, menuFooterOptions)

    -- Example for nh-context
    -- Use the same menuHeaderOptions, menuOptions, and menuFooterOptions as for qb-menu

    TriggerEvent("d3MBA-lib:client:OpenMenu", "nh-context", menuHeaderOptions, menuOptions, menuFooterOptions)

    -- Example for ox_lib
    -- Use the same menuHeaderOptions, menuOptions, and menuFooterOptions as for qb-menu

    TriggerEvent("d3MBA-lib:client:OpenMenu", "ox_lib", menuHeaderOptions, menuOptions, menuFooterOptions)


```


Function Arguments Explanation:

1. `menuType` (string) - Determines which menu library to use ("qb-menu", "nh-context", or "ox_lib").
2. `menuHeaderOptions` (table) - Contains the options for the menu header, such as title, context, icon, disabled status, event, and arguments.
3. `menuOptions` (table) - Contains a list of options for the menu body. Each option should have a title, context, icon, disabled status, event, and arguments.
4. `menuFooterOptions` (table) - Contains the options for the menu footer, such as title, context, icon, disabled status, event, and arguments.