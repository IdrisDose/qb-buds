local QBCore = exports['qb-core']:GetCoreObject()

-- Billing Information

RegisterServerEvent("qb-buds:server:BillPlayer", function(playerId, amount)
    local biller = QBCore.Functions.GetPlayer(source)
    local billed = QBCore.Functions.GetPlayer(tonumber(playerId))
    local amount = tonumber(amount)

    if biller.PlayerData.job.name ~= 'bestbuds' then
        TriggerClientEvent('QBCore:Notify', source, 'No Access', 'error')
        return false
    end


    if not billed then
        TriggerClientEvent('QBCore:Notify', source, 'Player Not Online', 'error')
        return false
    end

    if biller.PlayerData.citizenid == billed.PlayerData.citizenid then
        TriggerClientEvent('QBCore:Notify', source, 'You Cannot Bill Yourself', 'error')
        return false
    end

    if not amount or amount < 1 then
        TriggerClientEvent('QBCore:Notify', source, 'Must Be A Valid Amount Above 0', 'error')
        return false
    end


    if Config.SQL == 'oxmysql' then
        exports.oxmysql:insert('INSERT INTO phone_invoices (citizenid, amount, society, sender) VALUES (:citizenid, :amount, :society, :sender)', {
            ['citizenid'] = billed.PlayerData.citizenid,
            ['amount'] = amount,
            ['society'] = biller.PlayerData.job.name,
            ['sender'] = biller.PlayerData.charinfo.firstname
        })
    else
        exports.ghmattisql:execute('INSERT INTO phone_invoices (citizenid, amount, society, sender) VALUES (@citizenid, @amount, @society, @sender)', {
            ['@citizenid'] = billed.PlayerData.citizenid,
            ['@amount'] = amount,
            ['@society'] = biller.PlayerData.job.name,
            ['@sender'] = biller.PlayerData.charinfo.firstname
        })
    end

    TriggerClientEvent('qb-phone:RefreshPhone', billed.PlayerData.source)
    TriggerClientEvent('QBCore:Notify', source, 'Invoice Successfully Sent', 'success')
    TriggerClientEvent('QBCore:Notify', billed.PlayerData.source, 'New Invoice Received')
end)

RegisterServerEvent('qb-buds:server:finishWW', function(data)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)

    if not Player.PlayerData.job.name == 'bestbuds' then
        TriggerClientEvent('QBCore:Notify', source, 'No Access', 'error')
        return false
    end


    Player.Functions.RemoveItem("weed_white-widow", 1)
    Player.Functions.RemoveItem("rolling_paper", 1)
    TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["joint_ww"], "add")
    Player.Functions.AddItem('joint_ww', 1)
    TriggerClientEvent('QBCore:Notify', source, 'You made a Whitewidow Joint.', 'success')
end)

RegisterServerEvent('qb-buds:server:finishAK47', function(data)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)

    if not Player.PlayerData.job.name == 'bestbuds' then
        TriggerClientEvent('QBCore:Notify', source, 'No Access', 'error')
        return false
    end

    Player.Functions.RemoveItem("weed_ak47", 1)
    Player.Functions.RemoveItem("rolling_paper", 1)
    TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["joint_ak47"], "add")
    Player.Functions.AddItem('joint_ak47', 1)
    TriggerClientEvent('QBCore:Notify', source, 'You made an AK47 Joint.', 'success')
end)

RegisterServerEvent('qb-buds:server:finishOGK', function(data)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)

    if not Player.PlayerData.job.name == 'bestbuds' then
        TriggerClientEvent('QBCore:Notify', source, 'No Access', 'error')
        return false
    end

    Player.Functions.RemoveItem("weed_og-kush", 1)
    Player.Functions.RemoveItem("rolling_paper", 1)
    TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["joint_ogk"], "add")
    Player.Functions.AddItem('joint_ogk', 1, nil, {})

    TriggerClientEvent('QBCore:Notify', source, 'You made a OG Kush Joint.', 'success')
end)

RegisterServerEvent('qb-buds:server:finishPH', function(data)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)

    if not Player.PlayerData.job.name == 'bestbuds' then
        TriggerClientEvent('QBCore:Notify', source, 'No Access', 'error')
        return false
    end

    Player.Functions.RemoveItem("weed_purple-haze", 1)
    Player.Functions.RemoveItem("rolling_paper", 1)
    TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["joint_bph"], "add")
    Player.Functions.AddItem('joint_bph', 1)
    TriggerClientEvent('QBCore:Notify', source, 'You made a Purple Haze Joint.', 'success')
end)


-- AK 47 Crafting

QBCore.Functions.CreateCallback('qb-buds:server:HasAK47Ing', function(source, cb)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local weedak47 = Player.Functions.GetItemByName("weed_ak47")
    local rollingpaper = Player.Functions.GetItemByName("rolling_paper")

    if not Player.PlayerData.job.name == 'bestbuds' then
        TriggerClientEvent('QBCore:Notify', source, 'No Access', 'error')
        return cb(false)
    end

    if weedak47 ~= nil and rollingpaper ~= nil then
        cb(true)
    else
        cb(false)
    end
end)

-- Purple Haze Crafting

QBCore.Functions.CreateCallback('qb-buds:server:HasPHIng', function(source, cb)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local weedbph = Player.Functions.GetItemByName("weed_purple-haze")
    local rollingpaper = Player.Functions.GetItemByName("rolling_paper")

    if not Player.PlayerData.job.name == 'bestbuds' then
        TriggerClientEvent('QBCore:Notify', source, 'No Access', 'error')
        return cb(false)
    end


    if weedbph ~= nil and rollingpaper ~= nil then
        cb(true)
    else
        cb(false)
    end
end)

-- OG Kush Crafting

QBCore.Functions.CreateCallback('qb-buds:server:HasOGKIng', function(source, cb)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local weedogk = Player.Functions.GetItemByName("weed_og-kush")
    local rollingpaper = Player.Functions.GetItemByName("rolling_paper")

    if not Player.PlayerData.job.name == 'bestbuds' then
        TriggerClientEvent('QBCore:Notify', source, 'No Access', 'error')
        return cb(false)
    end

    if weedogk ~= nil and rollingpaper ~= nil then
        cb(true)
    else
        cb(false)
    end
end)

-- White Widow Crafting

QBCore.Functions.CreateCallback('qb-buds:server:HasWWIng', function(source, cb)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local weedww = Player.Functions.GetItemByName("weed_white-widow")
    local rollingpaper = Player.Functions.GetItemByName("rolling_paper")

    if not Player.PlayerData.job.name == 'bestbuds' then
        TriggerClientEvent('QBCore:Notify', source, 'No Access', 'error')
        return cb(false)
    end


    if weedww ~= nil and rollingpaper ~= nil then
        cb(true)
    else
        cb(false)
    end
end)