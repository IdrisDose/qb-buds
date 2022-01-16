local QBCore = exports['qb-core']:GetCoreObject()

isLoggedIn = true
PlayerJob = {}
PlayerData = {}
onDuty = false

function DrawText3Ds(x, y, z, text)
	SetTextScale(0.35, 0.35)
	SetTextFont(4)
	SetTextProportional(1)
	SetTextColour(255, 255, 255, 215)
	SetTextEntry("STRING")
	SetTextCentre(true)
	AddTextComponentString(text)
	SetDrawOrigin(x,y,z, 0)
	DrawText(0.0, 0.0)
	local factor = (string.len(text)) / 370
	DrawRect(0.0, 0.0+0.0125, 0.017+ factor, 0.03, 0, 0, 0, 75)
	ClearDrawOrigin()
end

Citizen.CreateThread(function()
    BestBuds = AddBlipForCoord(377.39, -833.21, 29.29)
    SetBlipSprite (BestBuds, 469)
    SetBlipDisplay(BestBuds, 4)
    SetBlipScale  (BestBuds, 0.7)
    SetBlipAsShortRange(BestBuds, true)
    SetBlipColour(BestBuds, 2)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentSubstringPlayerName("Best Buds")
    EndTextCommandSetBlipName(BestBuds)
end) 

RegisterNetEvent('QBCore:Client:OnPlayerLoaded')
AddEventHandler('QBCore:Client:OnPlayerLoaded', function()
	PlayerData = QBCore.Functions.GetPlayerData()
	PlayerJob = PlayerData.job
	if PlayerData.job.onduty and PlayerData.job.name == 'bestbuds' then
		TriggerServerEvent("QBCore:ToggleDuty")
	end
end)

RegisterNetEvent('QBCore:Client:OnJobUpdate', function(JobInfo)
    PlayerJob = JobInfo
    onDuty = PlayerJob.onduty
end)

RegisterNetEvent('QBCore:Client:SetDuty', function(duty)
    onDuty = duty
end)

RegisterNetEvent("qb-buds:DutyBuds")
AddEventHandler("qb-buds:DutyBuds", function()
	TriggerServerEvent("QBCore:ToggleDuty")
end)

RegisterNetEvent("qb-buds:Tray1")
AddEventHandler("qb-buds:Tray1", function()
	TriggerEvent("inventory:client:SetCurrentStash", "budstray1")
	TriggerServerEvent("inventory:server:OpenInventory", "stash", "budstray1", {
		maxweight = 10000,
		slots = 6,
	})
end)

RegisterNetEvent("qb-buds:shop")
AddEventHandler("qb-buds:shop", function()
	TriggerServerEvent("inventory:server:OpenInventory", "shop", "bestbuds", Config.Items)
end)

RegisterNetEvent("qb-buds:Storage")
AddEventHandler("qb-buds:Storage", function()
	TriggerEvent("inventory:client:SetCurrentStash", "BudsStorage")
	TriggerServerEvent("inventory:server:OpenInventory", "stash", "BudsStorage", {
		maxweight = 250000,
		slots = 40,
	})
end)

RegisterNetEvent("qb-buds:ak47")
AddEventHandler("qb-buds:ak47", function()
	if onDuty then
		QBCore.Functions.TriggerCallback('qb-buds:server:HasAK47Ing', function(HasItems)
			if HasItems then
				QBCore.Functions.Progressbar("pickup_sla", "Making AK 47 Strain Joint..", 4000, false, true, {
					disableMovement = true,
					disableCarMovement = true,
					disableMouse = false,
					disableCombat = true,
				}, {
					animDict = "mp_common",
					anim = "givetake1_a",
					flags = 8,
				}, {}, {}, function() -- Done
					TriggerServerEvent('qb-buds:server:finishAK47')
				end, function()
					QBCore.Functions.Notify("Cancelled..", "error")
				end)
			else
				QBCore.Functions.Notify("You dont have the ingredients to make this", "error")
			end
		end)
	else
		QBCore.Functions.Notify("You must be Clocked into work", "error")
	end
end)

RegisterNetEvent("qb-buds:bph")
AddEventHandler("qb-buds:bph", function()
	if onDuty then
		QBCore.Functions.TriggerCallback('qb-buds:server:HasPHIng', function(HasItems)
			if HasItems then
				QBCore.Functions.Progressbar("pickup_sla", "Making Purple Haze Strain Joint..", 4000, false, true, {
					disableMovement = true,
					disableCarMovement = true,
					disableMouse = false,
					disableCombat = true,
				}, {
					animDict = "mp_common",
					anim = "givetake1_a",
					flags = 8,
				}, {}, {}, function() -- Done
					TriggerServerEvent('qb-buds:server:finishPH')
				end, function()
					QBCore.Functions.Notify("Cancelled..", "error")
				end)
			else
				QBCore.Functions.Notify("You dont have the ingredients to make this", "error")
			end
		end)
	else
		QBCore.Functions.Notify("You must be Clocked into work", "error")
	end
end)

RegisterNetEvent("qb-buds:ogk")
AddEventHandler("qb-buds:ogk", function()
	if onDuty then
		QBCore.Functions.TriggerCallback('qb-buds:server:HasOGKIng', function(HasItems)
			if HasItems then
				QBCore.Functions.Progressbar("pickup_sla", "Making OG Kush Strain Joint..", 4000, false, true, {
					disableMovement = true,
					disableCarMovement = true,
					disableMouse = false,
					disableCombat = true,
				}, {
					animDict = "mp_common",
					anim = "givetake1_a",
					flags = 8,
				}, {}, {}, function() -- Done
					TriggerServerEvent('qb-buds:server:finishOGK')
				end, function()
					QBCore.Functions.Notify("Cancelled..", "error")
				end)
			else
				QBCore.Functions.Notify("You dont have the ingredients to make this", "error")
			end
		end)
	else
		QBCore.Functions.Notify("You must be Clocked into work", "error")
	end
end)

RegisterNetEvent("qb-buds:ww")
AddEventHandler("qb-buds:ww", function()
	if onDuty then
		QBCore.Functions.TriggerCallback('qb-buds:server:HasWWIng', function(HasItems)
			if HasItems then
				QBCore.Functions.Progressbar("pickup_sla", "Making White Widow Strain Joint..", 4000, false, true, {
					disableMovement = true,
					disableCarMovement = true,
					disableMouse = false,
					disableCombat = true,
				}, {
					animDict = "mp_common",
					anim = "givetake1_a",
					flags = 8,
				}, {}, {}, function() -- Done
					TriggerServerEvent('qb-buds:server:finishWW')
				end, function()
					QBCore.Functions.Notify("Cancelled..", "error")
				end)
			else
				QBCore.Functions.Notify("You dont have the ingredients to make this", "error")
			end
		end)
	else
		QBCore.Functions.Notify("You must be Clocked into work", "error")
	end
end)
