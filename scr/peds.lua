-- Command Syntax /peds <on | off>
RegisterCommand("peds", function(source,args,rawCommand)
Str = tostring(args[1])
pState = string.lower(Str)
TriggerServerEvent("peds", table.concat(args, " "))
end)
RegisterNetEvent("doPeds")
AddEventHandler("doPeds", function()
if pState == "off" then
  TriggerEvent('chat:addMessage', {color = {239, 167, 0},multiline = true, args = {"Peds are now " .. pState .. "."}})
  Citizen.CreateThread(function(peds)
  while pState == "off"
    do
      SetPedDensityMultiplierThisFrame(0.0)
      SetScenarioPedDensityMultiplierThisFrame(0.0, 0.0)
      local playerPed = GetPlayerPed(-1)
      local pos = GetEntityCoords(playerPed)
      Citizen.Wait(5)
    end
    end)
  elseif pState == "on" then
    pState = "on"
    TriggerEvent('chat:addMessage', {color = {0, 188, 69},multiline = true, args = {"Peds are now " .. pState .. "."}})
  elseif pState ~= ("on" or "off") then
    TriggerEvent('chat:addMessage', {color = { 255, 45, 45},multiline = true, args = {"Syntax is incorrcect [/peds <on | off>]" .. " Your Input: " .. pState}})
  end
  end)
