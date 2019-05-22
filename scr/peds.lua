-- Command Syntax /peds <on | off>
RegisterCommand("peds", function(source,args,rawCommand)
Str = tostring(args[1])
pState = string.lower(Str)
if pState == "off" then
  TriggerEvent("chatMessage", "^3^*Peds are now " .. pState)
  Citizen.CreateThread(function(peds)
  while pState == "off"
    do
      SetPedDensityMultiplierThisFrame(0.0)
      SetScenarioPedDensityMultiplierThisFrame(0.0, 0.0)
      local playerPed = GetPlayerPed(-1)
      local pos = GetEntityCoords(playerPed)
      Citizen.Wait(5)
      if (chatMessage) then break
    end
  end
  end)
elseif pState == "on" then
  pState = "on"
  TriggerEvent("chatMessage", "^2^*Peds are now " .. pState)
elseif pState ~= ("on" or "off") then
  TriggerEvent("chatMessage", "^1^*Syntax is incorrcect [/peds <on | off>]" .. " Your Input: " .. pState)
end
end)
