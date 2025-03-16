-- サーバー側スクリプト

local lavaParts = Workspace.Map.CircleIsland.Detail.LavaParts -- LavaPartsの親

-- Lavaパーツを削除する関数
local function destroyLava()
    while true do
        -- Lavaパーツを取得して削除
        for _, lavaPart in pairs(lavaParts:GetChildren()) do
            if lavaPart.Name == "Lava" then
                lavaPart:Destroy()
            end
        end
        wait(0.01) -- 0.01秒ごとに削除
    end
end

-- Lava削除を開始
destroyLava()
