local isPolice = false

RegisterNetEvent('policeJob:setAsPolice')
AddEventHandler('policeJob:setAsPolice', function()
    isPolice = true
    TriggerEvent('chat:addMessage', {
        args = {"^1Police Job", "You are now a police officer!"}
    })
end)

RegisterNetEvent('policeJob:removedPolice')
AddEventHandler('policeJob:removedPolice', function()
    isPolice = false
    TriggerEvent('chat:addMessage', {
        args = {"^1Police Job", "You are no longer a police officer!"}
    })
end)

RegisterCommand("arrest", function(_, args)
    if not isPolice then
        TriggerEvent('chat:addMessage', {
            args = {"^1Police Job", "You are not a police officer!"}
        })
        return
    end

    local targetId = tonumber(args[1])
    if targetId then
        TriggerServerEvent('policeJob:arrestSuspect', targetId)
    else
        TriggerEvent('chat:addMessage', {
            args = {"^1Usage", "/arrest [ID]"}
        })
    end
end)

RegisterCommand("release", function(_, args)
    if not isPolice then
        TriggerEvent('chat:addMessage', {
            args = {"^1Police Job", "You are not a police officer!"}
        })
        return
    end

    local targetId = tonumber(args[1])
    if targetId then
        TriggerServerEvent('policeJob:releaseSuspect', targetId)
    else
        TriggerEvent('chat:addMessage', {
            args = {"^1Usage", "/release [ID]"}
        })
    end
end)

RegisterNetEvent('policeJob:arrested')
AddEventHandler('policeJob:arrested', function()
    TriggerEvent('chat:addMessage', {
        args = {"^1Police", "You are now in custody!"}
    })
    playArrestAnim()
end)

RegisterNetEvent('policeJob:released')
AddEventHandler('policeJob:released', function()
    TriggerEvent('chat:addMessage', {
        args = {"^1Police", "You have been released from custody!"}
    })
    ClearPedTasks(PlayerPedId())
end)

function playArrestAnim()
    local ped = PlayerPedId()
    RequestAnimDict("mp_arresting")
    while not HasAnimDictLoaded("mp_arresting") do
        Wait(0)
    end
    TaskPlayAnim(ped, "mp_arresting", "idle", 8.0, -8.0, -1, 49, 0, false, false, false)
end
