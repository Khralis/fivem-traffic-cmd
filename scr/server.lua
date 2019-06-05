RegisterServerEvent("traffic")
AddEventHandler("traffic", function(param)
local perms = GetConvar("use_perms", "true")
if perms ~= "true" then
  TriggerClientEvent("doTraffic",source)
else
  if IsPlayerAceAllowed(source, "trafficcmd") and perms == "true" then
    TriggerClientEvent("doTraffic",source)
  else
    TriggerClientEvent("doNoPerms", source)
  end
end
end)

RegisterServerEvent("peds")
AddEventHandler("peds", function(param)
local perms = GetConvar("use_perms", "true")
if perms ~= "true" then
  TriggerClientEvent("doPeds",source)
else
  if IsPlayerAceAllowed(source, "pedscmd") and perms == "true" then
    TriggerClientEvent("doPeds",source)
  else
    TriggerClientEvent("doNoPerms", source)
  end
end
end)
