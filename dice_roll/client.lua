-- Client-side

-- Register the dice command to trigger the roll
RegisterCommand("dice", function(source, args, rawCommand)
    -- Generate a random number between 1 and 6
    local diceRoll = math.random(1, 6)

    -- Get the player's position
    local ped = PlayerPedId()
    local coords = GetEntityCoords(ped)

    -- Trigger the server to broadcast the dice roll to nearby players
    TriggerServerEvent("rollDiceNearby", coords, diceRoll)
end)

-- Event to show the dice roll result on the UI
RegisterNetEvent("showDiceToNearby")
AddEventHandler("showDiceToNearby", function(diceRoll, firstname, lastname)
    local diceNumber = diceRoll .. ".png"  -- Set the correct image filename
    local title = firstname .. " " .. lastname .. " has rolled a six sided die"  -- Format the title

    -- Send the dice result and title to the NUI
    SendNUIMessage({
        type = "ui",
        diceNumber = diceNumber,   -- Pass the dice image filename
        title = title,             -- Pass the title with the player's name
        display = true             -- Set to true to show the UI
    })

    -- Optionally, you can close the NUI after a set time:
    Citizen.Wait(5000)  -- Wait for 5 seconds before hiding the UI
    SendNUIMessage({
        type = "ui",
        display = false         -- Set to false to hide the UI
    })
end)


