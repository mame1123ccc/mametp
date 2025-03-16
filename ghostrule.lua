local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local player = Players.LocalPlayer

-- 最新の `HumanoidRootPart` を取得する関数
local function getHumanoidRootPart()
    local character = player.Character or player.CharacterAdded:Wait()
    return character:WaitForChild("HumanoidRootPart", 5) -- 5秒待って取得
end

-- キーが押されたときの処理
local function onKeyPress(input, gameProcessed)
    if gameProcessed then return end -- チャット入力などで処理されていたら無視

    if input.KeyCode == Enum.KeyCode.G then
        -- テレポート先の座標（ここを変更すれば好きな座標に飛ばせる）
        local teleportPosition = Vector3.new(938, 249, 32888)

        -- HumanoidRootPart を取得してテレポート
        local humanoidRootPart = getHumanoidRootPart()

        if not humanoidRootPart then
            warn("HumanoidRootPart が取得できませんでした！")
            return
        end

        -- プレイヤーを指定の座標にテレポート
        humanoidRootPart.CFrame = CFrame.new(teleportPosition)
    end
end

-- GUIで確認できるようにボックスの位置を画面で表示
local function createGUIBox()
    local screenGui = Instance.new("ScreenGui")
    screenGui.Parent = player.PlayerGui

    local box = Instance.new("TextButton")
    box.Size = UDim2.new(0, 100, 0, 50) -- ボックスの大きさ
    box.Position = UDim2.new(0, 50, 0.5, -50) -- 左端中央
    box.Text = "まめつぶぐみ"
    box.BackgroundColor3 = Color3.fromRGB(255, 50, 0) -- 赤色
    box.Parent = screenGui

    -- ボックスがクリックされたときにテレポート
    box.MouseButton1Click:Connect(function()
        local teleportPosition = Vector3.new(2284, 15, 911)
        local humanoidRootPart = getHumanoidRootPart()
        if humanoidRootPart then
            humanoidRootPart.CFrame = CFrame.new(teleportPosition)
        end
    end)
end

-- キーボード入力を監視
UserInputService.InputBegan:Connect(onKeyPress)

-- キャラクターがリスポーンしたら `HumanoidRootPart` を確実に取得する
player.CharacterAdded:Connect(function()
    wait(1) -- キャラが安定するまで少し待つ
    getHumanoidRootPart()
end)

-- GUI上にボックスを表示
createGUIBox()
