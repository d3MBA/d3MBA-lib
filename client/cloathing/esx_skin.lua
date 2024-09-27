function Framework.SetCloathing(outfit)
    if not outfit then return end

    TriggerEvent('skinchanger:getSkin', function(skin)           
        TriggerEvent('skinchanger:loadClothes', skin, outfit)
    end)

end

function Framework.ResetCloathing()
    ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
        TriggerEvent('skinchanger:loadSkin', skin)
    end)
end