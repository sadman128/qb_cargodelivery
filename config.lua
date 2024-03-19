Config                        	= {}
Config.CopsScaleReward			= true

-- Change this to false if you want clean / legit money
Config.UsesBlackMoney			= false -- use true to use black money. must config a new money called "blackmoney".

--Hash of the npc ped. Change only if you know what you are doing.
Config.NPCHash					= 349680864 			

--Random time societies will get alerted. This is a range in seconds.
Config.AlertCopsDelayRangeStart	= 60
Config.AlertCopsDelayRangeEnd	= 70

--If you want to notify more societies add them here. example { "mafia", "bikers" }
Config.AlertExtraSocieties 		= { }

--Self Explained
Config.CargoProviderLocation	= { x = 753.42, y = 2573.26, z = 75.08, h = 186.23 }  --vector4(753.42, 2573.26, 75.08, 186.23)

Config.Fuel = "LegacyFuel"  -- fuel type
Config.CargoDeliveryLocations 	= {

		{ x = 731.89, y = 4172.27, z = 39.3 },
		{ x = 1959.28, y = 3845.48, z = 31.2 },
		{ x = 388.76, y = 3591.34, z = 32.09},
		{ x = 97.24, y = 3739.86, z = 38.8}

}


Config.Scenarios = {
	
	{ 
		SpawnPoint = { x = 753.42, y = 2573.26, z = 75.08, h = 186.23 }, 
		DeliveryPoint = 6.0,
		VehicleName = "rumpo3",
		MinCopsOnline = 0,
		CargoCost = 5000,
		CargoReward = 10000
	
	},

	{ 
		SpawnPoint = { x = 753.42, y = 2573.26, z = 75.08, h = 186.23 }, 
		DeliveryPoint = 6.0,
		VehicleName = "rumpo3",
		MinCopsOnline = 0,
		CargoCost = 10000,
		CargoReward = 20000
	
	},
	{ 
		SpawnPoint = { x = 753.42, y = 2573.26, z = 75.08, h = 186.23 },  
		DeliveryPoint = 6.0,
		VehicleName = "rumpo3",
		MinCopsOnline = 0,
		CargoCost = 15000,
		CargoReward = 30000
	
	}
}

RegisterNetEvent('police:SetCopCount', function(amount)
    CurrentCops = amount
end)