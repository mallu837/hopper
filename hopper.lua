local HttpService = game:GetService("HttpService")
local TeleportService = game:GetService("TeleportService")
local Players = game:GetService("Players")

local PlaceId = game.PlaceId
local JobId = game.JobId
local LocalPlayer = Players.LocalPlayer

-- Configuration
local MAX_PAGES = 15          -- How many pages to scan (100 servers per page)
local RETRY_DELAY = 5         -- Seconds to wait before retrying the whole process on failure
local BLACKLIST = {}          -- Keeps track of servers that failed to teleport

function fetchServers(cursor)
    local url = string.format(
        "https://games.roblox.com/v1/games/%s/servers/Public?sortOrder=Asc&limit=100&cursor=%s",
        PlaceId, 
        cursor or ""
    )
    
    local success, result = pcall(function()
        return game:HttpGet(url) -- Using HttpGet for executors
    end)
    
    if success then
        local data = HttpService:JSONDecode(result)
        if data and data.data then
            return data
        end
    end
    
    return nil
end

function hopToLowServer()
    local cursor = ""
    local attempts = 0
    
    print("Searching for a low-player server...")

    while attempts < MAX_PAGES do
        local result = fetchServers(cursor)
        
        if not result then
            warn("API Rate limit or Error. Waiting 5 seconds...")
            task.wait(5)
            attempts = attempts + 1
            continue
        end

        local possibleServers = {}

        for _, server in ipairs(result.data) do
            -- Filter: Not full, not current, not blacklisted, and has at least 1 player (to avoid broken/dead servers)
            if server.playing < server.maxPlayers 
               and server.id ~= JobId 
               and not BLACKLIST[server.id] 
               and server.playing > 0 then
                table.insert(possibleServers, server)
            end
        end

        if #possibleServers > 0 then
            -- Sort by player count (Ascending) just in case the API order is messy
            table.sort(possibleServers, function(a, b)
                return a.playing < b.playing
            end)

            -- Pick from the top 5 to avoid everyone hitting the same server at once
            local target = possibleServers[math.random(1, math.min(#possibleServers, 5))]
            
            print(string.format("Attempting join: %s (%s/%s players)", target.id, target.playing, target.maxPlayers))
            
            -- Track the attempt
            local tpSuccess, tpError = pcall(function()
                TeleportService:TeleportToPlaceInstance(PlaceId, target.id, LocalPlayer)
            end)

            if not tpSuccess then
                warn("Teleport call failed, blacklisting server and trying another. Error: " .. tostring(tpError))
                BLACKLIST[target.id] = true
                -- We don't return here; the loop continues to find another server
            else
                -- Teleport initiated, wait a moment to see if it actually goes through
                task.wait(2) 
            end
        end

        if result.nextPageCursor then
            cursor = result.nextPageCursor
            attempts = attempts + 1
        else
            -- No more pages left
            break
        end
    end

    return false
end

-- MAIN AUTO-RETRY LOOP
task.spawn(function()
    while true do
        local success = hopToLowServer()
        
        if not success then
            warn("Could not find or join a server. Retrying the entire search in " .. RETRY_DELAY .. "s...")
            task.wait(RETRY_DELAY)
        end
    end
end)
