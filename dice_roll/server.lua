local Core = exports.vorp_core:GetCore()

-- Handle broadcasting the dice roll to nearby players
RegisterNetEvent("rollDiceNearby")
AddEventHandler("rollDiceNearby", function(coords, diceRoll)
    local user = Core.getUser(source)
    local character = user.getUsedCharacter
    local firstname = character.firstname
    local lastname = character.lastname

    --print("Server received dice roll request: ", diceRoll)  -- Debug print

    local players = GetPlayers()  -- Get all players
    --print("Total players on the server: ", #players)  -- Debug print

    for _, playerId in ipairs(players) do
        local ped = GetPlayerPed(playerId)
        local playerCoords = GetEntityCoords(ped)

        -- Debug: Show player position and distance from the origin
        --print("Player " .. playerId .. " is at " .. playerCoords)

        -- Check if the player is within 50 meters of the origin player
        if #(coords - playerCoords) < Config.Distance then
            --print("Player " .. playerId .. " is within range, sending dice roll...")  -- Debug print
            -- Send the dice roll result, name, and dice roll to this player
            TriggerClientEvent("showDiceToNearby", playerId, diceRoll, firstname, lastname)
        else
            print("Player " .. playerId .. " is too far away, not sending dice roll.")  -- Debug print
        end
    end
end)
