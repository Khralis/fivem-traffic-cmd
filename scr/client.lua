RegisterNetEvent("doNoPerms")
AddEventHandler("doNoPerms", function()
    TriggerEvent('chat:addMessage', {
        color = {255, 45, 45},
        multiline = true,
        args = {"[Error]: Sorry, but you don't have permission to do this"}
    })
end)
