RegisterServerEvent("traffic")
AddEventHandler("traffic", function(param)
    local perms = GetConvar("use_perms", "true")
    if perms ~= "true" then
        TriggerClientEvent("doTraffic", source)
    elseif IsPlayerAceAllowed(source, "trafficcmd") and perms == "true" then
        TriggerClientEvent("doTraffic", source)
    else
        TriggerClientEvent("doNoPerms", source)

    end
end)

RegisterServerEvent("peds")
AddEventHandler("peds", function(param)
    local perms = GetConvar("use_perms", "true")
    if perms ~= "true" then
        TriggerClientEvent("doPeds", source)
    elseif IsPlayerAceAllowed(source, "pedscmd") and perms == "true" then
        TriggerClientEvent("doPeds", source)
    else
        TriggerClientEvent("doNoPerms", source)
    end
end)
