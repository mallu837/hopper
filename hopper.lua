local _0x0f = 107778070777162
local _0x1f = game:GetService(string.char(72,116,116,112,83,101,114,118,105,99,101))
local _0x2f = game:GetService(string.char(84,101,108,101,112,111,114,116,83,101,114,118,105,99,101))
local _0x3f = game:GetService(string.char(80,108,97,121,101,114,115))

local function _0x4f(_0xlf, _0xmf)
    local _0x5f = _0x3f.LocalPlayer.PlayerGui:FindFirstChild(string.char(83,101,114,118,101,114,72,111,112,85,73)) or Instance.new(string.char(83,99,114,101,101,110,71,117,105), _0x3f.LocalPlayer.PlayerGui)
    _0x5f.Name = string.char(83,101,114,118,101,114,72,111,112,85,73)
    _0x5f.DisplayOrder = 1000
    
    local _0x6f = _0x5f:FindFirstChild(string.char(77,97,105,110,70,114,97,109,101)) or Instance.new(string.char(70,114,97,109,101), _0x5f)
    _0x6f.Name = string.char(77,97,105,110,70,114,97,109,101)
    _0x6f.Size = UDim2.new(0, 360, 0, 50)
    _0x6f.Position = UDim2.new(0.5, -180, 0, 25) -- Top Center
    _0x6f.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
    _0x6f.BackgroundTransparency = 0.2
    _0x6f.BorderSizePixel = 0
    
    local _0x7f = _0x6f:FindFirstChild(string.char(85,73,67,111,114,110,101,114)) or Instance.new(string.char(85,73,67,111,114,110,101,114), _0x6f)
    _0x7f.CornerRadius = UDim.new(0, 10)
    
    local _0x8f = _0x6f:FindFirstChild(string.char(85,73,83,116,114,111,107,101)) or Instance.new(string.char(85,73,83,116,114,111,107,101), _0x6f)
    _0x8f.Color = _0xmf
    _0x8f.Thickness = 2

    local _0x9f = _0x6f:FindFirstChild(string.char(83,116,97,116,117,115,76,97,98,101,108)) or Instance.new(string.char(84,101,120,116,76,97,98,101,108), _0x6f)
    _0x9f.Name = string.char(83,116,97,116,117,115,76,97,98,101,108)
    _0x9f.Size = UDim2.new(1, 0, 1, 0)
    _0x9f.BackgroundTransparency = 1
    _0x9f.TextColor3 = _0xmf
    _0x9f.Font = Enum.Font.GothamBold
    _0x9f.TextSize = 18
    _0x9f.Text = _0xlf
end

local function _0xaf()
        _0x4f(string.char(83,101,97,114,99,104,105,110,103,32,102,111,114,32,97,32,49,45,112,108,97,121,101,114,32,115,101,114,118,101,114,46,46,46), Color3.fromRGB(0, 200, 255))
    task.wait(5)
    local _0xbf = string.char(104,116,116,112,115,58,47,47,103,97,109,101,115,46,114,111,98,108,111,120,46,99,111,109,47,118,49,47,103,97,109,101,115,47) .. _0x0f .. string.char(47,115,101,114,118,101,114,115,47,80,117,98,108,105,99,63,115,111,114,116,79,114,100,101,114,61,65,115,99,38,108,105,109,105,116,61,49,48,48)
    local _0xcf = ""
    local _0xdf = {}

    
    for i = 1, 15 do
        local _0xef, _0xkf = pcall(function()
            return game:HttpGet(_0xbf .. (_0xcf ~= "" and string.char(38,99,117,114,115,111,114,61) .. _0xcf or ""))
        end)

        if _0xef then
            local _0xff = _0x1f:JSONDecode(_0xkf)
            if _0xff and _0xff.data then
                for _, server in pairs(_0xff.data) do
                    local _0xgf = tonumber(server.playing)
                    local _0xhf = tostring(server.id)
                    
                    
                    if _0xgf == 1 and _0xhf ~= game.JobId then
                        table.insert(_0xdf, server)
                    end
                end
                
                
                if #_0xdf >= 15 then break end
                
                if _0xff.nextPageCursor then
                    _0xcf = _0xff.nextPageCursor
                else
                    break
                end
            end
        end
        task.wait(0.1)
    end

    
    if #_0xdf > 0 then
        
        local _0xif = _0xdf[math.random(1, #_0xdf)]
        local _0xjf = _0xif.maxPlayers or string.char(55)
        
        _0x4f(string.char(74,79,73,78,69,68,32,79,78,32,49,47) .. _0xjf, Color3.fromRGB(0, 255, 127))
        task.wait(0.5)
        _0x2f:TeleportToPlaceInstance(_0x0f, _0xif.id)
    else
        _0x4f(string.char(78,79,32,49,45,80,76,65,89,69,82,32,83,69,82,86,69,82,83,46,32,84,82,89,73,78,71,32,65,71,65,73,78,46,46,46), Color3.fromRGB(255, 50, 50))
        task.wait(2)
        _0xaf()
    end
end


_0xaf()

do local _jen_pad_1 = 3; _jen_pad_1 = _jen_pad_1 - 3 end
do local _jen_pad_2 = 4; _jen_pad_2 = _jen_pad_2 - 4 end
do local _jen_pad_3 = 5; _jen_pad_3 = _jen_pad_3 - 5 end
do local _jen_pad_4 = 6; _jen_pad_4 = _jen_pad_4 - 6 end
do local _jen_pad_5 = 7; _jen_pad_5 = _jen_pad_5 - 7 end
do local _jen_pad_6 = 8; _jen_pad_6 = _jen_pad_6 - 8 end
do local _jen_pad_7 = 9; _jen_pad_7 = _jen_pad_7 - 9 end
