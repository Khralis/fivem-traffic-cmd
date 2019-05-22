-- Command Syntax /traffic <on | off>
RegisterCommand("traffic", function(source,args,rawCommand)
Str = tostring(args[1])
tState = string.lower(Str)
if tState == "off" then
  TriggerEvent("chatMessage", "^3^*Traffic is now " .. tState)
  Citizen.CreateThread(function()
  while tState == "off"
    do
      SetVehicleDensityMultiplierThisFrame(0.0)
      --SetPedDensityMultiplierThisFrame(0.0)
      SetRandomVehicleDensityMultiplierThisFrame(0.0)
      SetParkedVehicleDensityMultiplierThisFrame(0.0)
      --SetScenarioPedDensityMultiplierThisFrame(0.0, 0.0)
      local playerPed = GetPlayerPed(-1)
      local pos = GetEntityCoords(playerPed)
      RemoveVehiclesFromGeneratorsInArea(pos['x'] - 500.0, pos['y'] - 500.0, pos['z'] - 500.0, pos['x'] + 500.0, pos['y'] + 500.0, pos['z'] + 500.0);
      SetGarbageTrucks(0)
      SetRandomBoats(0)
      Citizen.Wait(5)
      if (chatMessage) then break
    end
  end
  end)
elseif tState == "on" then
  tState = "on"
  TriggerEvent("chatMessage", "^2^*Traffic is now " .. tState)
elseif tState ~= ("on" or "off") then
  TriggerEvent("chatMessage", "^1^*Syntax is incorrcect [/traffic <on | off>]" .. " Your Input: " .. tState)
end
end)
