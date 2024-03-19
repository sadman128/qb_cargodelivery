ESX = nil
LastDelivery = 0.0
local QBCore = exports['qb-core']:GetCoreObject()


TriggerEvent('QBCore:GetObject', function(obj) ESX = obj end)

function GetCopsOnline()

	local PoliceConnected = 0
	local xPlayers = 	QBCore.Functions.GetPlayers()

	for i=1, #xPlayers, 1 do
		local xPlayer = QBCore.Functions.GetPlayer(xPlayers[i])
		
		if xPlayer.PlayerData.job.name == 'police' then
			PoliceConnected = PoliceConnected + 1
		end
	end

	return PoliceConnected
end



RegisterServerEvent('esx_cargodelivery:resetEvent')
AddEventHandler('esx_cargodelivery:resetEvent', function()
	LastDelivery = 0.0
end)




QBCore.Functions.CreateCallback('esx_cargodelivery:getCopsOnline', function(source, cb)
	cb(GetCopsOnline())
end)

QBCore.Functions.CreateCallback('kenji_alertcargo', function()
        TriggerClientEvent('chat:addMessage', -1, { color = { 255, 0, 0 }, args = {'Warning', 'Illegal cargo is on the way. Must wait 20 minutes'}})       
        end)




QBCore.Functions.CreateCallback('esx_cargodelivery:sellCargo', function(source, cb, price)
	local xPlayer = QBCore.Functions.GetPlayer(source)

	if Config.UsesBlackMoney then
	
		xPlayer.Functions.AddMoney('blackmoney' , price)
	
	else

		xPlayer.Functions.AddMoney('cash' , price)

	end
	
	TriggerClientEvent('QBCore:Notify', source, "You earned " .. price .. " for delivering the cargo.")
	cb(true)

	LastDelivery = 0.0

end)





QBCore.Functions.CreateCallback('esx_cargodelivery:buyCargo', function(source, cb, price)
	
	local xPlayer = QBCore.Functions.GetPlayer(source)

	if (os.time() - LastDelivery) < 200.0 and LastDelivery ~= 0.0 then

		TriggerClientEvent('QBCore:Notify', source, "Delivery is in progress")
		cb(false)

	else 

		police_alarm_time = os.time() + math.random(10000, 20000)

		if Config.UsesBlackMoney then

			if xPlayer.PlayerData.money.blackmoney >= price then

				xPlayer.Functions.RemoveMoney('blackmoney' , price)

				LastDelivery = os.time()

				cb(true)
			else

				TriggerClientEvent('QBCore:Notify', source, "Not enough Black money.")
	

				cb(false)
			end

		else 

				if xPlayer.PlayerData.money.cash >= price then

				xPlayer.Functions.RemoveMoney('cash' , price)
				
				LastDelivery = os.time()

				cb(true)
			else

				TriggerClientEvent('QBCore:Notify', source, "Not enough money.")
	
				cb(false)
			end
		end

	end

end)

QBCore.Functions.CreateCallback('kenji_notify', function(source, text)
TriggerClientEvent('QBCore:Notify', source, text)
end)
