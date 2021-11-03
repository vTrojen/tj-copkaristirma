ESX  = nil

local cachedBins = {}
local trashcooldown = false

Citizen.CreateThread(function ()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) 
            ESX = obj 
        end)
        Citizen.Wait(5)
    end
end)


RegisterNetEvent("trojen:copkaristirma")
AddEventHandler("trojen:copkaristirma", function()
    local sleepThread = 1000
    local entity, entityDst = ESX.Game.GetClosestObject(Config.Kutu)
    if DoesEntityExist(entity) and entityDst <= 1.5 then
        sleepThread = 5
        local freeze = PlayerPedId()
        if not trashcooldown then
        local binCoords = GetEntityCoords(entity)

            if not cachedBins[entity] then
                cachedBins[entity] = true

                OpenTrash()
            else
                exports['mythic_notify']:SendAlert('error', 'Çöpü zaten aradın!')
            end
        end
        if trashcooldown then
            exports['mythic_notify']:SendAlert('error', '3 dakika beklemek zorundasın!')
        end
    end
    Citizen.Wait(sleepThread)
end)

RegisterCommand("copk", function()
TriggerEvent('trojen:copkaristirma')
end, false)

function OpenTrash()
    local freeze = PlayerPedId()
	FreezeEntityPosition(freeze, true)
    TaskStartScenarioInPlace(PlayerPedId(), "PROP_HUMAN_BUM_BIN", 0, true)
    Citizen.Wait(10000)
    TriggerServerEvent("trojen:trashrew")
    FreezeEntityPosition(freeze, false)
    ClearPedTasks(PlayerPedId())
    trashcooldown = true
    Citizen.Wait(180000)
    trashcooldown = false
end
