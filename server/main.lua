local QBCore = exports['qb-core']:GetSharedObject()

-- Billing Information

RegisterServerEvent("qb-buds:bill:player", function(playerId, amount)
    local biller = QBCore.Functions.GetPlayer(source)
    local billed = QBCore.Functions.GetPlayer(tonumber(playerId))
    local amount = tonumber(amount)
    if biller.PlayerData.job.name == 'bestbuds' then
        if billed ~= nil then
            if biller.PlayerData.citizenid ~= billed.PlayerData.citizenid then
                if amount and amount > 0 then
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
                else
                    TriggerClientEvent('QBCore:Notify', source, 'Must Be A Valid Amount Above 0', 'error')
                end
            else
                TriggerClientEvent('QBCore:Notify', source, 'You Cannot Bill Yourself', 'error')
            end
        else
            TriggerClientEvent('QBCore:Notify', source, 'Player Not Online', 'error')
        end
    else
        TriggerClientEvent('QBCore:Notify', source, 'No Access', 'error')
    end
end)

-- AK 47 Crafting

QBCore.Functions.CreateCallback('qb-buds:server:get:ingredientak47', function(source, cb)
    local src = source
    local Ply = QBCore.Functions.GetPlayer(src)
    local weedak47 = Ply.Functions.GetItemByName("weed_ak47")
    local rollingpaper = Ply.Functions.GetItemByName("rolling_paper")
    if weedak47 ~= nil and rollingpaper ~= nil then
        cb(true)
    else
        cb(false)
    end
end)

-- Purple Haze Crafting

QBCore.Functions.CreateCallback('qb-buds:server:get:ingredientbph', function(source, cb)
    local src = source
    local Ply = QBCore.Functions.GetPlayer(src)
    local weedbph = Ply.Functions.GetItemByName("weed_purple-haze")
    local rollingpaper = Ply.Functions.GetItemByName("rolling_paper")
    if weedbph ~= nil and rollingpaper ~= nil then
        cb(true)
    else
        cb(false)
    end
end)

-- OG Kush Crafting

QBCore.Functions.CreateCallback('qb-buds:server:get:ingredientogk', function(source, cb)
    local src = source
    local Ply = QBCore.Functions.GetPlayer(src)
    local weedogk = Ply.Functions.GetItemByName("weed_og-kush")
    local rollingpaper = Ply.Functions.GetItemByName("rolling_paper")
    if weedogk ~= nil and rollingpaper ~= nil then
        cb(true)
    else
        cb(false)
    end
end)

-- White Widow Crafting

QBCore.Functions.CreateCallback('qb-buds:server:get:ingredientww', function(source, cb)
    local src = source
    local Ply = QBCore.Functions.GetPlayer(src)
    local weedww = Ply.Functions.GetItemByName("weed_white-widow")
    local rollingpaper = Ply.Functions.GetItemByName("rolling_paper")
    if weedww ~= nil and rollingpaper ~= nil then
        cb(true)
    else
        cb(false)
    end
end)