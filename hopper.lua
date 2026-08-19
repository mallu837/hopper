local HttpService = game:GetService("HttpService")
local TeleportService = game:GetService("TeleportService")
local Players = game:GetService("Players")

local PlaceId = game.PlaceId
local JobId = game.JobId

function hopToLowServer()
    local cursor = ""
    local attempts = 0
    local maxPages = 10 -- How many pages (100 servers each) to search through

    print("Searching for the best low-player server...")

    while attempts < maxPages do
        -- API to fetch public servers, sorted by lowest player count (Asc)
        local url = string.format(
            "https://games.roblox.com/v1/games/%s/servers/Public?sortOrder=Asc&limit=100&cursor=%s",
            PlaceId, 
            cursor
        )

        local success, result = pcall(function()
            return HttpService:JSONDecode(game:HttpGet(url))
        end)

        if success and result and result.data then
            local possibleServers = {}

            for _, server in ipairs(result.data) do
                -- Criteria: Not full, not the current server, and has 1+ players
                if server.playing < server.maxPlayers and server.id ~= JobId then
                    table.insert(possibleServers, server)
                end
            end

            if #possibleServers > 0 then
                -- Pick a random server from the first 5 "best" results 
                -- This prevents everyone from trying to join the exact same 1-player server
                local target = possibleServers[math.random(1, math.min(#possibleServers, 5))]
                
                print("Found server with " .. target.playing .. " players. Teleporting...")
                
                local tpSuccess, tpError = pcall(function()
                    TeleportService:TeleportToPlaceInstance(PlaceId, target.id, Players.LocalPlayer)
                end)
                
                if not tpSuccess then
                    warn("Teleport failed: " .. tostring(tpError))
                else
                    return -- Exit script if teleport starts
                end
            end

            -- Move to the next page if no suitable server found
            if result.nextPageCursor then
                cursor = result.nextPageCursor
                attempts = attempts + 1
            else
                break
            end
        else
            warn("API Error or rate-limited. Retrying in 2 seconds...")
            task.wait(2)
        end
    end

    print("Could not find a suitable small server after searching " .. (attempts * 100) .. " servers.")
end

-- Execute the hop
hopToLowServer()
