local HttpService = game:GetService("HttpService")
local TeleportService = game:GetService("TeleportService")
local Players = game:GetService("Players")
local PlaceId = game.PlaceId
local JobId = game.JobId


local function createNotify(msg, color)
    local sg = Players.LocalPlayer.PlayerGui:FindFirstChild("UniversalHopUI") or Instance.new("ScreenGui", Players.LocalPlayer.PlayerGui)
    sg.Name = "UniversalHopUI"
    sg.DisplayOrder = 1000
    
    local frame = sg:FindFirstChild("MainFrame") or Instance.new("Frame", sg)
    frame.Name = "MainFrame"
    frame.Size = UDim2.new(0, 380, 0, 50)
    frame.Position = UDim2.new(0.5, -190, 0, 25) -- Top Center
    frame.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
    frame.BackgroundTransparency = 0.2
    frame.BorderSizePixel = 0
    
    local corner = frame:FindFirstChild("UICorner") or Instance.new("UICorner", frame)
    corner.CornerRadius = UDim.new(0, 10)
    
    local stroke = frame:FindFirstChild("UIStroke") or Instance.new("UIStroke", frame)
    stroke.Color = color
    stroke.Thickness = 2

    local text = frame:FindFirstChild("StatusLabel") or Instance.new("TextLabel", frame)
    text.Name = "StatusLabel"
    text.Size = UDim2.new(1, 0, 1, 0)
    text.BackgroundTransparency = 1
    text.TextColor3 = color
    text.Font = Enum.Font.GothamBold
    text.TextSize = 16
    text.Text = msg:upper()
end

local function startSearch()
    
    local waitTime = math.random(2, 5)
    createNotify("Scanning for 1-player servers...", Color3.fromRGB(0, 200, 255))
    task.wait(waitTime) 

    local url = "https://games.roblox.com/v1/games/" .. PlaceId .. "/servers/Public?sortOrder=Asc&limit=100"
    local cursor = ""
    local validServers = {}

    
    for i = 1, 15 do
        local success, result = pcall(function()
            return game:HttpGet(url .. (cursor ~= "" and "&cursor=" .. cursor or ""))
        end)

        if success then
            local data = HttpService:JSONDecode(result)
            if data and data.data then
                for _, server in pairs(data.data) do
                    local playing = tonumber(server.playing)
                    local maxPlayers = tonumber(server.maxPlayers)
                    local id = tostring(server.id)
                    
                    
                    if playing == 1 and id ~= JobId then
                        table.insert(validServers, {id = id, max = maxPlayers})
                    end
                end
                
                
                if #validServers >= 10 then break end
                
                if data.nextPageCursor then
                    cursor = data.nextPageCursor
                else
                    break
                end
            end
        else
            createNotify("API Error - Waiting...", Color3.fromRGB(255, 0, 0))
            task.wait(2)
        end
        task.wait(0.1)
    end

    
    if #validServers > 0 then
        
        local target = validServers[math.random(1, #validServers)]
        
        createNotify("JOINED ON 1/" .. target.max, Color3.fromRGB(0, 255, 127))
        task.wait(0.5)
        
        TeleportService:TeleportToPlaceInstance(PlaceId, target.id)
    else
        
        createNotify("No 1-player servers found. Retrying...", Color3.fromRGB(255, 50, 50))
        task.wait(2)
        startSearch() 
    end
end


startSearch()
