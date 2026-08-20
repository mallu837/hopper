local _0x0f = game:GetService(string.char(72,116,116,112,83,101,114,118,105,99,101))
local _0x1f = game:GetService(string.char(84,101,108,101,112,111,114,116,83,101,114,118,105,99,101))
local _0x2f = game:GetService(string.char(80,108,97,121,101,114,115))
local _0x3f = game.PlaceId
local _0x4f = game.JobId


local function _0x5f(_0xnf, _0xof)
    local _0x6f = _0x2f.LocalPlayer.PlayerGui:FindFirstChild(string.char(85,110,105,118,101,114,115,97,108,72,111,112,85,73)) or Instance.new(string.char(83,99,114,101,101,110,71,117,105), _0x2f.LocalPlayer.PlayerGui)
    _0x6f.Name = string.char(85,110,105,118,101,114,115,97,108,72,111,112,85,73)
    _0x6f.DisplayOrder = 1000
    
    local _0x7f = _0x6f:FindFirstChild(string.char(77,97,105,110,70,114,97,109,101)) or Instance.new(string.char(70,114,97,109,101), _0x6f)
    _0x7f.Name = string.char(77,97,105,110,70,114,97,109,101)
    _0x7f.Size = UDim2.new(0, 380, 0, 50)
    _0x7f.Position = UDim2.new(0.5, -190, 0, 25) -- Top Center
    _0x7f.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
    _0x7f.BackgroundTransparency = 0.2
    _0x7f.BorderSizePixel = 0
    
    local _0x8f = _0x7f:FindFirstChild(string.char(85,73,67,111,114,110,101,114)) or Instance.new(string.char(85,73,67,111,114,110,101,114), _0x7f)
    _0x8f.CornerRadius = UDim.new(0, 10)
    
    local _0x9f = _0x7f:FindFirstChild(string.char(85,73,83,116,114,111,107,101)) or Instance.new(string.char(85,73,83,116,114,111,107,101), _0x7f)
    _0x9f.Color = _0xof
    _0x9f.Thickness = 2

    local _0xaf = _0x7f:FindFirstChild(string.char(83,116,97,116,117,115,76,97,98,101,108)) or Instance.new(string.char(84,101,120,116,76,97,98,101,108), _0x7f)
    _0xaf.Name = string.char(83,116,97,116,117,115,76,97,98,101,108)
    _0xaf.Size = UDim2.new(1, 0, 1, 0)
    _0xaf.BackgroundTransparency = 1
    _0xaf.TextColor3 = _0xof
    _0xaf.Font = Enum.Font.GothamBold
    _0xaf.TextSize = 16
    _0xaf.Text = _0xnf:upper()
end

local function _0xbf()
    
    local _0xcf = math.random(2, 5)
    _0x5f(string.char(83,99,97,110,110,105,110,103,32,102,111,114,32,49,45,112,108,97,121,101,114,32,115,101,114,118,101,114,115,46,46,46), Color3.fromRGB(0, 200, 255))
    task.wait(_0xcf) 

    local _0xdf = string.char(104,116,116,112,115,58,47,47,103,97,109,101,115,46,114,111,98,108,111,120,46,99,111,109,47,118,49,47,103,97,109,101,115,47) .. _0x3f .. string.char(47,115,101,114,118,101,114,115,47,80,117,98,108,105,99,63,115,111,114,116,79,114,100,101,114,61,65,115,99,38,108,105,109,105,116,61,49,48,48)
    local _0xef = ""
    local _0xff = {}

    
    for i = 1, 15 do
        local _0xgf, _0xmf = pcall(function()
            return game:HttpGet(_0xdf .. (_0xef ~= "" and string.char(38,99,117,114,115,111,114,61) .. _0xef or ""))
        end)

        if _0xgf then
            local _0xhf = _0x0f:JSONDecode(_0xmf)
            if _0xhf and _0xhf.data then
                for _, server in pairs(_0xhf.data) do
                    local _0xif = tonumber(server.playing)
                    local _0xjf = tonumber(server.maxPlayers)
                    local _0xkf = tostring(server.id)
                    
                    -- Filter for exactly 1 player and ensure it's not the current server
                    if _0xif == 1 and _0xkf ~= _0x4f then
                        table.insert(_0xff, {_0xkf = _0xkf, max = _0xjf})
                    end
                end
                
                -- Stop scanning once we have 10 random options
                if #_0xff >= 10 then break end
                
                if _0xhf.nextPageCursor then
                    _0xef = _0xhf.nextPageCursor
                else
                    break
                end
            end
        else
            _0x5f(string.char(65,80,73,32,69,114,114,111,114,32,45,32,87,97,105,116,105,110,103,46,46,46), Color3.fromRGB(255, 0, 0))
            task.wait(2)
        end
        task.wait(0.1)
    end

    
    if #_0xff > 0 then
        -- Pick a random one to avoid the string.char(99,114,111,119,100)
        local _0xlf = _0xff[math.random(1, #_0xff)]
        
        _0x5f(string.char(74,79,73,78,69,68,32,79,78,32,49,47) .. _0xlf.max, Color3.fromRGB(0, 255, 127))
        task.wait(0.5)
        
        _0x1f:TeleportToPlaceInstance(_0x3f, _0xlf.id)
    else
        
        _0x5f(string.char(78,111,32,49,45,112,108,97,121,101,114,32,115,101,114,118,101,114,115,32,102,111,117,110,100,46,32,82,101,116,114,121,105,110,103,46,46,46), Color3.fromRGB(255, 50, 50))
        task.wait(2)
        _0xbf() 
    end
end


_0xbf()

do local _jen_pad_1 = 3; _jen_pad_1 = _jen_pad_1 - 3 end
do local _jen_pad_2 = 4; _jen_pad_2 = _jen_pad_2 - 4 end
do local _jen_pad_3 = 5; _jen_pad_3 = _jen_pad_3 - 5 end
do local _jen_pad_4 = 6; _jen_pad_4 = _jen_pad_4 - 6 end
do local _jen_pad_5 = 7; _jen_pad_5 = _jen_pad_5 - 7 end
do local _jen_pad_6 = 8; _jen_pad_6 = _jen_pad_6 - 8 end
do local _jen_pad_7 = 9; _jen_pad_7 = _jen_pad_7 - 9 end
