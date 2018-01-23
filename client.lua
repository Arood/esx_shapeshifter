ESX = nil
local turbo = false

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

Citizen.CreateThread( function()
  while true do
    Citizen.Wait(0)
    if turbo then
      RestorePlayerStamina(GetPlayerPed(GetPlayerPed(-1)), 1.0)
    end
  end
end)

RegisterNetEvent('esx:shapeshift_turbo')
AddEventHandler('esx:shapeshift_turbo', function(toggle)
  turbo = toggle
end)

RegisterNetEvent('esx:shapeshift')
AddEventHandler('esx:shapeshift', function(args)
  if #args ~= 2 then
    return
  end
  if(GetPlayerName(tonumber(args[1])) == nil)then
    return
  end
  
  local model = GetHashKey(args[2])
  if(not(IsModelValid(model)))then
		return
  end
  
  RequestModel(model)
	while not HasModelLoaded(model) do
		Wait(1)
  end
  
  SetPlayerModel(GetPlayerFromServerId(tonumber(args[1])), model)
  SetModelAsNoLongerNeeded(model)
  SetPedDefaultComponentVariation(GetPlayerPed(GetPlayerFromServerId(tonumber(args[1]))))
  Wait(200)
  SetPlayerModel(GetPlayerFromServerId(tonumber(args[1])), model)
  SetModelAsNoLongerNeeded(model)
  SetPedDefaultComponentVariation(GetPlayerPed(GetPlayerFromServerId(tonumber(args[1]))))
end)

RegisterNetEvent('esx:shapeshift_restore')
AddEventHandler('esx:shapeshift_restore', function()

  TriggerEvent('skinchanger:loadDefaultModel', true)
  ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)

    TriggerEvent('skinchanger:loadDefaultModel', skin['sex'] == 0, function()
      TriggerEvent('skinchanger:loadClothes', skin, jobSkin)
    end)

  end)
  
end)