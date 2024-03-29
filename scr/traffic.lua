-- Command Syntax /traffic <on | off>
RegisterCommand("traffic", function(source, args, rawCommand)
    tState = tostring(string.lower(args[1]))
    TriggerServerEvent("traffic", table.concat(args, " "))
end)
RegisterNetEvent("doTraffic")
AddEventHandler("doTraffic", function()
    if tState == "off" then
        TriggerEvent('chat:addMessage', {
            color = {239, 167, 0},
            multiline = true,
            args = {"Traffic is now " .. tState .. "."}
        })
        Citizen.CreateThread(function()
            while tState == "off" do
                local pos = GetEntityCoords(GetPlayerPed(-1))
                RemoveVehiclesFromGeneratorsInArea(pos['x'] - 500.0, pos['y'] - 500.0, pos['z'] - 500.0,
                    pos['x'] + 500.0, pos['y'] + 500.0, pos['z'] + 500.0)
                SetVehicleDensityMultiplierThisFrame(0.0)
                SetRandomVehicleDensityMultiplierThisFrame(0.0)
                SetParkedVehicleDensityMultiplierThisFrame(0.0)
                SetGarbageTrucks(0)
                SetRandomBoats(0)
                Citizen.Wait(5)
            end
        end)
    elseif tState == "on" then
        TriggerEvent('chat:addMessage', {
            color = {0, 188, 69},
            multiline = true,
            args = {"Traffic is now " .. tState .. "."}
        })
    elseif tState ~= ("on" or "off") then
        TriggerEvent('chat:addMessage', {
            color = {255, 45, 45},
            multiline = true,
            args = {"Syntax is incorrcect [/traffic <on | off>]" .. " Your Input: " .. tState}
        })
    end
end)
