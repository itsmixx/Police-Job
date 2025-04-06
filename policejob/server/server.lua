RegisterServerEvent('policeJob:arrestSuspect')
AddEventHandler('policeJob:arrestSuspect', function(targetId)
    local src = source
    local targetPlayer = GetPlayerFromId(targetId)

    if targetPlayer then
        local identifier = GetPlayerIdentifier(targetId)
        
        if framework == 'esx' then
            local xPlayer = ESX.GetPlayerFromId(targetId)
            MySQL.Async.execute('INSERT INTO policejob_arrests (identifier, arrest_duration) VALUES (@identifier, @arrest_duration)', {
                ['@identifier'] = xPlayer.identifier,
                ['@arrest_duration'] = arrestDuration
            })
        elseif framework == 'qbcore' then
            local player = QBCore.Functions.GetPlayer(targetId)
            MySQL.Async.execute('INSERT INTO policejob_arrests (citizenid, arrest_duration) VALUES (@citizenid, @arrest_duration)', {
                ['@citizenid'] = player.PlayerData.citizenid,
                ['@arrest_duration'] = arrestDuration
            })
        end
        
        TriggerClientEvent('policeJob:arrested', targetId)
        TriggerClientEvent('chat:addMessage', src, {
            args = {"^2Police Job", "Player " .. targetId .. " has been arrested."}
        })
    end
end)

RegisterServerEvent('policeJob:releaseSuspect')
AddEventHandler('policeJob:releaseSuspect', function(targetId)
    local src = source
    local targetPlayer = GetPlayerFromId(targetId)

    if targetPlayer then
        local identifier = GetPlayerIdentifier(targetId)
        
        if framework == 'esx' then
            local xPlayer = ESX.GetPlayerFromId(targetId)
            MySQL.Async.execute('UPDATE policejob_arrests SET status = @status, released_at = NOW() WHERE identifier = @identifier', {
                ['@identifier'] = xPlayer.identifier,
                ['@status'] = 'released'
            })
        elseif framework == 'qbcore' then
            local player = QBCore.Functions.GetPlayer(targetId)
            MySQL.Async.execute('UPDATE policejob_arrests SET status = @status, released_at = NOW() WHERE citizenid = @citizenid', {
                ['@citizenid'] = player.PlayerData.citizenid,
                ['@status'] = 'released'
            })
        end
        
        TriggerClientEvent('policeJob:released', targetId)
        TriggerClientEvent('chat:addMessage', src, {
            args = {"^2Police Job", "Player " .. targetId .. " has been released."}
        })
    end
end)


AddEventHandler('onResourceStart', function(resourceName)
    if resourceName == GetCurrentResourceName() then
        print("=====================================")
        print("🚔 Police Job Script - Credits")
        print("Scripted by: mix")
        print("Animations: Rockstar Games (GTA V)")
        print("Compatibility: ESX, QBCore, Standalone")
        print("Database Support: oxmysql, mysql-async, ghmattimysql")
        print("=====================================")
    end
end)
