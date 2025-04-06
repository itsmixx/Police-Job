RegisterCommand("becomepolice", function(source, args)
    local src = source
    local targetId = tonumber(args[1])
    if not targetId then
        TriggerClientEvent('chat:addMessage', src, {
            args = {"^1Usage", "/becomepolice [ID]"}
        })
        return
    end

    TriggerClientEvent('policeJob:setAsPolice', targetId)
    TriggerClientEvent('chat:addMessage', src, {
        args = {"^2Success", "Player " .. targetId .. " is now a police officer."}
    })
end, true)

RegisterCommand("removepolice", function(source, args)
    local src = source
    local targetId = tonumber(args[1])
    if not targetId then
        TriggerClientEvent('chat:addMessage', src, {
            args = {"^1Usage", "/removepolice [ID]"}
        })
        return
    end

    TriggerClientEvent('policeJob:removedPolice', targetId)
    TriggerClientEvent('chat:addMessage', src, {
        args = {"^2Success", "Player " .. targetId .. " is no longer a police officer."}
    })
end, true)
