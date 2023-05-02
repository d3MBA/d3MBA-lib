-- Author: d3MBA#0001
-- Discord server: discord.gg/d3MBA

-- This function will make it easier to add images to your menus.
--- @param url - <string> (url of the image) 
--- @param width - <number> (width of the image) 
--- @param height - <number> (height of the image) 

function Framework.ConvertImageFormat(url, width, height) -- Function to convert the image format to the menu format
    if url == nil or url == "" or url == " " then 
        print("^1---------------- WARNING ----------------")
        print("URL is nil or empty") 
        print("^1---------------- WARNING ----------------")
        return 
    end 

    local width = width or nil  -- default is 96x96 
    local height = height or nil -- default is 96x96 

    if Framework.Menu == "qb-menu" then 
        if width == nil then  
            return  '<img src="'..url..'" style=" height:'..height..'px"/>' 
        elseif height == nil then 
            return '<img src="'..url..'" style="width:'..width..'px"/>' 
        end 
        return '<img src="'..url..'" style="width:'..width..'px; height:'..height..'px"/>' 
    elseif Framework.Menu == "nh-context" then 
        return url 
    elseif Framework.Menu == "ox_lib" then 
        return url
    end 
end