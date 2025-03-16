while true do
    for _, part in pairs(game.Workspace.Map:GetDescendants()) do
        if part:IsA("BasePart") and part.Name == "Lava" then
            part:Destroy()
        end
    end
    wait(1) -- 0.1秒ごとにチェック
end
