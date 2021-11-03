local ESX = nil

TriggerEvent("esx:getSharedObject", function(obj) 
    ESX = obj 
end)

RegisterServerEvent("trojen:trashrew")
AddEventHandler("trojen:trashrew", function()
    local player = ESX.GetPlayerFromId(source)

    local luck = math.random(0, 100)

    if luck >= 90 then
       player.addInventoryItem('yun', 2)
    elseif luck == 80 and luck >= 70 then
        player.addInventoryItem('sise', 2)
    elseif luck < 70 and luck >= 50 then
        player.addInventoryItem('kagit', 2)
    elseif luck < 50 and luck >= 1 then
        player.addInventoryItem('poset', 2)
    end
end)
