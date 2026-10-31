local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local CoreGui = game:GetService("CoreGui")
local VirtualUser = game:GetService("VirtualUser")
local Workspace = game:GetService("Workspace")

local LocalPlayer = Players.LocalPlayer

getgenv().AzureMemeSea = {
    AttackType = "Weapon",
    SafeDistance = 5,
    StatAmount = 1,

    AutoFarmLevel = false,
    SelectedNPCQuest = "Floppa Quest 1",
    AutoFarmNormalNPC = false,

    AutoFarmMaterials = false,
    SelectedMaterial = "Night Man",

    SelectedBoss = "Big Floppa",
    BossQuestTimes = "مرة واحدة (1)",
    AutoFarmBoss = false,
    AutoSpawnLordSus = false,
    AutoSpawnPumpkin = false,
    AutoSpawnEvilNoob = false,
    AutoMemeBeast = false,

    AutoStartRaid = false,
    AutoFarmRaid = false,

    AutoCollectGroundFruits = false,
    AutoGachaMoney = false,
    AutoGachaGem = false,
    AutoStoreFruit = false,
    AutoPopcat = false,

    SpeedEnabled = false,
    SpeedValue = 28,
    JumpEnabled = false,
    JumpPower = 65,
    NoClip = false
}

local OtherEvent = ReplicatedStorage:WaitForChild("OtherEvent", 10)
local MainEvents = OtherEvent and OtherEvent:FindFirstChild("MainEvents")
local MiscEvents = OtherEvent and OtherEvent:FindFirstChild("MiscEvents")
local SkillEvents = OtherEvent and OtherEvent:FindFirstChild("SkillEvents")
local QuestEvents = OtherEvent and OtherEvent:FindFirstChild("QuestEvents")

local Remote_Hitbox = SkillEvents and SkillEvents:FindFirstChild("Server_Hitbox")
local Remote_Quest = QuestEvents and QuestEvents:FindFirstChild("Quest")
local Remote_StartRaid = MiscEvents and MiscEvents:FindFirstChild("StartRaid")
local Remote_Popcat = MiscEvents and MiscEvents:FindFirstChild("Popcat")
local Remote_Code = MainEvents and MainEvents:FindFirstChild("Code")
local Remote_Modules = MainEvents and MainEvents:FindFirstChild("Modules")
local Remote_Ability = MainEvents and MainEvents:FindFirstChild("Ability")
local Remote_Stats = MainEvents and MainEvents:FindFirstChild("StatsFunction")

local ActiveCodes = {
    "100MVisits", "100KActive", "70KActive", "Update4",
    "100KFavorites", "100KLikes", "10KLikes", "10kMembers",
    "FloppaNeverDies", "SadNoob"
}

local RaidMonstersList = {
    ["Floppa Man"] = true, ["Epic Doge"] = true, ["Speedy Cheems"] = true,
    ["Tanky Moai"] = true, ["Super Popcat"] = true, ["Killer Nugget"] = true,
    ["Capybara"] = true, ["The Stone"] = true, ["Maxwell The Cat"] = true,
    ["Reverse Master"] = true, ["Dancing Cat"] = true
}

local CompleteQuestList = {
    {Quest = "Floppa Quest 1", Mob = "Floppa"},
    {Quest = "Floppa Quest 2", Mob = "Golden Floppa"},
    {Quest = "Floppa Quest 3", Mob = "Big Floppa"},
    {Quest = "Floppa Quest 4", Mob = "Doge"},
    {Quest = "Floppa Quest 5", Mob = "Cheems"},
    {Quest = "Floppa Quest 6", Mob = "Walter Dog"},
    {Quest = "Floppa Quest 7", Mob = "Staring Fish"},
    {Quest = "Floppa Quest 8", Mob = "Hamster"},
    {Quest = "Floppa Quest 9", Mob = "Snow Tree"},
    {Quest = "Floppa Quest 10", Mob = "The Rock"},
    {Quest = "Floppa Quest 11", Mob = "Banana Cat"},
    {Quest = "Floppa Quest 12", Mob = "Sus Face"},
    {Quest = "Floppa Quest 13", Mob = "Egg Dog"},
    {Quest = "Floppa Quest 14", Mob = "Popcat"},
    {Quest = "Floppa Quest 15", Mob = "Gorilla King"},
    {Quest = "Floppa Quest 16", Mob = "Smiling Cat"},
    {Quest = "Floppa Quest 17", Mob = "Killerfish"},
    {Quest = "Floppa Quest 18", Mob = "Bingus"},
    {Quest = "Floppa Quest 19", Mob = "Obamid"},
    {Quest = "Floppa Quest 20", Mob = "Floppy"},
    {Quest = "Floppa Quest 21", Mob = "Creepy Head"},
    {Quest = "Floppa Quest 22", Mob = "Scary Skull"},
    {Quest = "Floppa Quest 23", Mob = "Giant Pumpkin"},
    {Quest = "Floppa Quest 24", Mob = "Pink Absorber"},
    {Quest = "Floppa Quest 25", Mob = "Troll Face"},
    {Quest = "Floppa Quest 26", Mob = "Uncanny Cat"},
    {Quest = "Floppa Quest 27", Mob = "Quandale Dingle"},
    {Quest = "Floppa Quest 28", Mob = "Moai"},
    {Quest = "Floppa Quest 29", Mob = "Evil Noob"},
    {Quest = "Floppa Quest 30", Mob = "Red Sus"},
    {Quest = "Floppa Quest 31", Mob = "Sus Duck"},
    {Quest = "Floppa Quest 32", Mob = "Lord Sus"},
    {Quest = "Floppa Quest 33", Mob = "Sigma Man"},
    {Quest = "Floppa Quest 34", Mob = "Dancing Cat"},
    {Quest = "Floppa Quest 35", Mob = "Toothless Dragon"},
    {Quest = "Floppa Quest 36", Mob = "Manly Nugget"},
    {Quest = "Floppa Quest 37", Mob = "Huh Cat"},
    {Quest = "Floppa Quest 38", Mob = "Mystical Tree"},
    {Quest = "Floppa Quest 39", Mob = "Old Man"},
    {Quest = "Floppa Quest 40", Mob = "Nyan Cat"},
    {Quest = "Floppa Quest 41", Mob = "Baller"},
    {Quest = "Floppa Quest 42", Mob = "Slicer"},
    {Quest = "Floppa Quest 43", Mob = "Rick Roller"},
    {Quest = "Floppa Quest 44", Mob = "Gigachad"},
    {Quest = "Floppa Quest 45", Mob = "MrBeast"},
    {Quest = "Floppa Quest 46", Mob = "Handsome Man"}
}

local BossExactMap = {
    ["Lord Sus"]       = {Mob = "Lord Sus", Quest = "Lord Sus Quest"},
    ["Giant Pumpkin"]  = {Mob = "Giant Pumpkin", Quest = "Giant Pumpkin Quest"},
    ["Evil Noob"]      = {Mob = "Evil Noob", Quest = "Evil Noob Quest"},
    ["Big Floppa"]     = {Mob = "Big Floppa", Quest = "Big Floppa Quest"},
    ["Walter Dog"]     = {Mob = "Walter Dog", Quest = "Walter Dog Quest"},
    ["Snow Tree"]      = {Mob = "Snow Tree", Quest = "Snow Tree Quest"},
    ["Sus Face"]       = {Mob = "Sus Face", Quest = "Sus Face Quest"},
    ["Gorilla King"]   = {Mob = "Gorilla King", Quest = "Gorilla King Quest"},
    ["Obamid"]         = {Mob = "Obamid", Quest = "Obamid Quest"},
    ["Pink Absorber"]  = {Mob = "Pink Absorber", Quest = "Pink Absorber Quest"},
    ["Moai"]           = {Mob = "Moai", Quest = "Moai Quest"},
    ["Rick Roller"]    = {Mob = "Rick Roller", Quest = "Rick Roller Quest"},
    ["MrBeast"]        = {Mob = "MrBeast", Quest = "MrBeast Quest"},
    ["Baller"]         = {Mob = "Baller", Quest = "Baller Quest"},
    ["Dancing Banana"] = {Mob = "Dancing Banana", Quest = "Dancing Banana Quest"}
}

local MaterialQuestMap = {
    ["Night Man"]   = {Mob = "Giant Pumpkin", Quest = "Giant Pumpkin Quest"},
    ["Noob Head"]   = {Mob = "Moai", Quest = "Moai Quest"},
    ["Money Bag"]   = {Mob = "MrBeast", Quest = "MrBeast Quest"},
    ["Ball"]        = {Mob = "Baller", Quest = "Baller Quest"},
    ["Cat Food"]    = {Mob = "Gorilla King", Quest = "Gorilla King Quest"},
    ["Meme Cube"]   = {Mob = "Meme Beast", Quest = "Floppa Quest 14"},
    ["Floppa Hair"] = {Mob = "Big Floppa", Quest = "Big Floppa Quest"},
    ["Cheems Bone"] = {Mob = "Cheems", Quest = "Floppa Quest 5"},
    ["Sus Orb"]     = {Mob = "Lord Sus", Quest = "Lord Sus Quest"}
}

local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()

local Window = Fluent:CreateWindow({
    Title = "Azure Hub | Meme Sea",
    SubTitle = "by gh00l",
    TabWidth = 160,
    Size = UDim2.fromOffset(580, 420),
    Acrylic = false,
    Theme = "Dark",
    MinimizeKey = Enum.KeyCode.LeftControl
})

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "Azure_FloatButton_Gui"
ScreenGui.ResetOnSpawn = false
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

pcall(function() ScreenGui.Parent = CoreGui end)
if not ScreenGui.Parent then ScreenGui.Parent = LocalPlayer:WaitForChild("PlayerGui") end

local FloatButton = Instance.new("ImageButton")
FloatButton.Name = "AzureFloatBtn"
FloatButton.Size = UDim2.new(0, 55, 0, 55)
FloatButton.Position = UDim2.new(0.05, 0, 0.25, 0)
FloatButton.BackgroundColor3 = Color3.fromRGB(20, 20, 25)
FloatButton.AutoButtonColor = false
FloatButton.Image = "rbxassetid://121840126476423"
FloatButton.Parent = ScreenGui

local Corner = Instance.new("UICorner", FloatButton)
Corner.CornerRadius = UDim.new(0, 14)

local Stroke = Instance.new("UIStroke", FloatButton)
Stroke.Thickness = 2
Stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border

task.spawn(function()
    local hue = 0
    while true do
        hue = (hue + 0.008) % 1
        Stroke.Color = Color3.fromHSV(hue, 0.8, 1)
        RunService.RenderStepped:Wait()
    end
end)

local dragging, dragInput, dragStart, startPos
FloatButton.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startPos = FloatButton.Position
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then dragging = false end
        end)
    end
end)

FloatButton.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
        dragInput = input
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if input == dragInput and dragging then
        local delta = input.Position - dragStart
        FloatButton.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
end)

local isWindowVisible = true
FloatButton.MouseButton1Click:Connect(function()
    local tw = TweenService:Create(FloatButton, TweenInfo.new(0.08, Enum.EasingStyle.Quad), {Size = UDim2.new(0, 48, 0, 48)})
    tw:Play()
    tw.Completed:Wait()
    TweenService:Create(FloatButton, TweenInfo.new(0.08, Enum.EasingStyle.Quad), {Size = UDim2.new(0, 55, 0, 55)}):Play()

    isWindowVisible = not isWindowVisible
    if Window and Window.Root then
        Window.Root.Visible = isWindowVisible
    end
end)

local function getRoot(char)
    return char and (char:FindFirstChild("HumanoidRootPart") or char:FindFirstChild("Torso"))
end

local function getHum(char)
    return char and char:FindFirstChildOfClass("Humanoid")
end

local function equipCombatTool()
    local char = LocalPlayer.Character
    if not char then return nil end
    local hum = getHum(char)
    if not hum then return nil end

    local wType = getgenv().AzureMemeSea.AttackType
    local currentTool = char:FindFirstChildOfClass("Tool")

    if currentTool then
        if wType == "FightingStyle" and (currentTool.Name == "Combat" or currentTool.Name == "Baller") then return currentTool
        elseif wType == "Power" and (currentTool.Name:find("Power") or currentTool.Name:find("Fruit") or currentTool.Name:find("Dough")) then return currentTool
        elseif wType == "Weapon" and not (currentTool.Name == "Combat" or currentTool.Name == "Baller" or currentTool.Name:find("Power") or currentTool.Name:find("Fruit") or currentTool.Name:find("Dough")) then return currentTool end
    end

    local targetTool = nil
    for _, tool in ipairs(LocalPlayer.Backpack:GetChildren()) do
        if tool:IsA("Tool") then
            if wType == "FightingStyle" and (tool.Name == "Combat" or tool.Name == "Baller") then targetTool = tool; break
            elseif wType == "Power" and (tool.Name:find("Power") or tool.Name:find("Fruit") or tool.Name:find("Dough")) then targetTool = tool; break
            elseif wType == "Weapon" and not (tool.Name == "Combat" or tool.Name == "Baller" or tool.Name:find("Power") or tool.Name:find("Fruit") or tool.Name:find("Dough")) then targetTool = tool; break end
        end
    end

    if not targetTool then
        targetTool = LocalPlayer.Backpack:FindFirstChildOfClass("Tool")
    end

    if targetTool then
        hum:EquipTool(targetTool)
        return targetTool
    end
    return currentTool
end

local function attackSingleTarget(targetPart)
    if not targetPart then return end
    local tool = equipCombatTool()
    pcall(function()
        if Remote_Hitbox then Remote_Hitbox:FireServer(targetPart) end
        if tool then tool:Activate() end
        VirtualUser:CaptureController()
        VirtualUser:ClickButton1(Vector2.new(500, 500))
    end)
end

local function lockPositionAboveTarget(targetRootPart)
    local char = LocalPlayer.Character
    local root = getRoot(char)
    if not root or not targetRootPart then return end
    local dist = getgenv().AzureMemeSea.SafeDistance or 5
    root.CFrame = CFrame.new(targetRootPart.Position + Vector3.new(0, dist, 0), targetRootPart.Position)
    root.Velocity = Vector3.zero
    root.AssemblyLinearVelocity = Vector3.zero
    root.AssemblyAngularVelocity = Vector3.zero
end

local function isRaidMonster(mob)
    if not mob:IsA("Model") or Players:GetPlayerFromCharacter(mob) then return false end
    if mob:FindFirstChild("Raid_Mark") or RaidMonstersList[mob.Name] then return true end
    return false
end

local function executeQuestPrompt(questName, timesText)
    local questsFolder = Workspace:FindFirstChild("NPCs") and Workspace.NPCs:FindFirstChild("Quests_Npc")
    if not questsFolder then return end

    local questModel = questsFolder:FindFirstChild(questName)
    if not questModel then
        for _, q in ipairs(questsFolder:GetChildren()) do
            if q.Name:lower() == questName:lower() or q.Name:lower():find(questName:lower()) then
                questModel = q
                break
            end
        end
    end

    if questModel then
        local block = questModel:FindFirstChild("Block") or questModel:FindFirstChildWhichIsA("BasePart")
        local prompt = block and block:FindFirstChildWhichIsA("ProximityPrompt", true) or questModel:FindFirstChildWhichIsA("ProximityPrompt", true)
        
        if prompt and block and LocalPlayer.Character then
            local root = getRoot(LocalPlayer.Character)
            if root then
                root.CFrame = block.CFrame * CFrame.new(0, 3, 2)
                task.wait(0.2)
                local times = timesText == "مرتين (2)" and 2 or 1
                for i = 1, times do
                    prompt.HoldDuration = 0
                    prompt.MaxActivationDistance = 9999
                    if fireproximityprompt then fireproximityprompt(prompt, 0) end
                    task.wait(0.1)
                end
            end
        end
    end
    pcall(function() if Remote_Quest then Remote_Quest:FireServer(questName) end end)
end

-- حلقة بدء الرايد الفعالة والمحدثة
task.spawn(function()
    while true do
        task.wait(1)
        if getgenv().AzureMemeSea.AutoStartRaid and LocalPlayer.Character then
            pcall(function()
                local myRoot = getRoot(LocalPlayer.Character)
                local raidArea = Workspace:FindFirstChild("Island") 
                    and Workspace.Island:FindFirstChild("MrBeastIsland") 
                    and Workspace.Island.MrBeastIsland:FindFirstChild("Raid_Area")

                if myRoot and raidArea then
                    myRoot.CFrame = raidArea:GetPivot() + Vector3.new(0, 3, 0)
                end
                if Remote_StartRaid then
                    Remote_StartRaid:FireServer()
                end
            end)
        end
    end
end)

-- حلقة تفريم وحوش الرايد
task.spawn(function()
    while true do
        task.wait(0.1)
        if getgenv().AzureMemeSea.AutoFarmRaid and LocalPlayer.Character then
            local monsterFolder = Workspace:FindFirstChild("Monster")
            if monsterFolder then
                for _, mob in ipairs(monsterFolder:GetChildren()) do
                    if not getgenv().AzureMemeSea.AutoFarmRaid then break end
                    if isRaidMonster(mob) then
                        local hum = getHum(mob)
                        local mRoot = getRoot(mob)
                        if hum and hum.Health > 0 and mRoot then
                            local timeout = tick() + 20
                            while getgenv().AzureMemeSea.AutoFarmRaid and hum and hum.Health > 0 and mob.Parent and tick() < timeout do
                                lockPositionAboveTarget(mRoot)
                                attackSingleTarget(mRoot)
                                RunService.Heartbeat:Wait()
                            end
                        end
                    end
                end
            end
        end
    end
end)

-- حلقة الزعماء
task.spawn(function()
    while true do
        task.wait(0.1)
        if getgenv().AzureMemeSea.AutoFarmBoss and LocalPlayer.Character then
            local chosenBossKey = getgenv().AzureMemeSea.SelectedBoss
            local bossInfo = BossExactMap[chosenBossKey]
            local monsterFolder = Workspace:FindFirstChild("Monster")

            if monsterFolder and bossInfo then
                local bossFound = nil
                for _, mob in ipairs(monsterFolder:GetChildren()) do
                    if mob.Name == bossInfo.Mob then
                        bossFound = mob
                        break
                    end
                end

                if bossFound then
                    local hum = getHum(bossFound)
                    local mRoot = getRoot(bossFound)
                    if hum and hum.Health > 0 and mRoot then
                        local bossTimer = tick() + 45
                        while getgenv().AzureMemeSea.AutoFarmBoss and hum and hum.Health > 0 and bossFound.Parent and tick() < bossTimer do
                            lockPositionAboveTarget(mRoot)
                            attackSingleTarget(mRoot)
                            RunService.Heartbeat:Wait()
                        end
                    end
                else
                    pcall(function()
                        executeQuestPrompt(bossInfo.Quest, getgenv().AzureMemeSea.BossQuestTimes)
                    end)
                    task.wait(1)
                end
            end
        end
    end
end)

-- حلقة الـ NPC العادي
task.spawn(function()
    while true do
        task.wait(0.1)
        if getgenv().AzureMemeSea.AutoFarmNormalNPC and LocalPlayer.Character then
            local selectedQ = getgenv().AzureMemeSea.SelectedNPCQuest
            local mobName = "Floppa"
            for _, item in ipairs(CompleteQuestList) do
                if item.Quest == selectedQ then
                    mobName = item.Mob
                    break
                end
            end

            executeQuestPrompt(selectedQ, "مرة واحدة (1)")
            task.wait(0.2)

            local monsterFolder = Workspace:FindFirstChild("Monster")
            if monsterFolder then
                local targetMob = nil
                for _, mob in ipairs(monsterFolder:GetChildren()) do
                    if not isRaidMonster(mob) and mob.Name == mobName then
                        local hum = getHum(mob)
                        if hum and hum.Health > 0 then
                            targetMob = mob
                            break
                        end
                    end
                end

                if targetMob then
                    local hum = getHum(targetMob)
                    local mRoot = getRoot(targetMob)
                    if hum and hum.Health > 0 and mRoot then
                        local farmTimer = tick() + 25
                        while getgenv().AzureMemeSea.AutoFarmNormalNPC and hum and hum.Health > 0 and targetMob.Parent and tick() < farmTimer do
                            lockPositionAboveTarget(mRoot)
                            attackSingleTarget(mRoot)
                            RunService.Heartbeat:Wait()
                        end
                    end
                else
                    task.wait(0.5)
                end
            end
        end
    end
end)

-- حلقة المتريال
task.spawn(function()
    while true do
        task.wait(0.1)
        if getgenv().AzureMemeSea.AutoFarmMaterials and LocalPlayer.Character then
            local mat = getgenv().AzureMemeSea.SelectedMaterial
            local matData = MaterialQuestMap[mat]
            if matData then
                executeQuestPrompt(matData.Quest, "مرة واحدة (1)")
                task.wait(0.2)

                local monsterFolder = Workspace:FindFirstChild("Monster")
                if monsterFolder then
                    for _, mob in ipairs(monsterFolder:GetChildren()) do
                        if not getgenv().AzureMemeSea.AutoFarmMaterials then break end
                        if mob.Name == matData.Mob then
                            local hum = getHum(mob)
                            local mRoot = getRoot(mob)
                            if hum and hum.Health > 0 and mRoot then
                                local timeout = tick() + 15
                                while getgenv().AzureMemeSea.AutoFarmMaterials and hum and hum.Health > 0 and mob.Parent and tick() < timeout do
                                    lockPositionAboveTarget(mRoot)
                                    attackSingleTarget(mRoot)
                                    RunService.Heartbeat:Wait()
                                end
                            end
                        end
                    end
                end
            end
        end
    end
end)

local function summonBossAltar(keyword)
    local char = LocalPlayer.Character
    local root = getRoot(char)
    if not root then return end

    local islandFolder = Workspace:FindFirstChild("Island")
    if not islandFolder then return end

    local altar = nil
    if keyword == "sus" then altar = islandFolder:FindFirstChild("ForgottenIsland") and islandFolder.ForgottenIsland:FindFirstChild("Summon3") and islandFolder.ForgottenIsland.Summon3:FindFirstChild("Altar")
    elseif keyword == "noob" then altar = islandFolder:FindFirstChild("MoaiIsland") and islandFolder.MoaiIsland:FindFirstChild("Summon2") and islandFolder.MoaiIsland.Summon2:FindFirstChild("Altar")
    elseif keyword == "pumpkin" then altar = islandFolder:FindFirstChild("PumpkinIsland") and islandFolder.PumpkinIsland:FindFirstChild("Summon1") and islandFolder.PumpkinIsland.Summon1:FindFirstChild("Altar") end

    if altar then
        local prompt = altar:FindFirstChildWhichIsA("ProximityPrompt", true)
        local base = altar:IsA("BasePart") and altar or altar:FindFirstChildWhichIsA("BasePart")
        if prompt and base then
            root.CFrame = base.CFrame * CFrame.new(0, 3, 3)
            task.wait(0.2)
            prompt.HoldDuration = 0
            prompt.MaxActivationDistance = 9999
            if fireproximityprompt then fireproximityprompt(prompt, 0) end
            task.wait(0.3)
        end
    end
end

task.spawn(function()
    while true do
        task.wait(3)
        if getgenv().AzureMemeSea.AutoSpawnLordSus then summonBossAltar("sus") end
        if getgenv().AzureMemeSea.AutoSpawnPumpkin then summonBossAltar("pumpkin") end
        if getgenv().AzureMemeSea.AutoSpawnEvilNoob then summonBossAltar("noob") end
    end
end)

task.spawn(function()
    while true do
        task.wait(0.5)
        if getgenv().AzureMemeSea.AutoMemeBeast and LocalPlayer.Character then
            local monsterFolder = Workspace:FindFirstChild("Monster")
            if monsterFolder then
                local beast = monsterFolder:FindFirstChild("Meme Beast") or monsterFolder:FindFirstChild("MemeBeast")
                if beast then
                    local hum = getHum(beast)
                    local bRoot = getRoot(beast)
                    if hum and hum.Health > 0 and bRoot then
                        while getgenv().AzureMemeSea.AutoMemeBeast and hum and hum.Health > 0 and beast.Parent do
                            lockPositionAboveTarget(bRoot)
                            attackSingleTarget(bRoot)
                            RunService.Heartbeat:Wait()
                        end
                    end
                end
            end
        end
    end
end)

task.spawn(function()
    while true do
        task.wait(0.2)
        if getgenv().AzureMemeSea.AutoPopcat then
            pcall(function()
                local popcatModel = Workspace:FindFirstChild("NPCs") 
                    and Workspace.NPCs:FindFirstChild("Misc_Npc") 
                    and Workspace.NPCs.Misc_Npc:FindFirstChild("Popcat_Clickable")
                if popcatModel then
                    local cd = popcatModel:FindFirstChildOfClass("ClickDetector") or popcatModel:FindFirstChildWhichIsA("ClickDetector", true)
                    if cd then fireclickdetector(cd) end
                end
                if Remote_Popcat then Remote_Popcat:FireServer() end
            end)
        end
    end
end)

task.spawn(function()
    while true do
        task.wait(0.5)
        if getgenv().AzureMemeSea.AutoCollectGroundFruits and LocalPlayer.Character then
            local myRoot = getRoot(LocalPlayer.Character)
            local powerFolder = Workspace:FindFirstChild("SpawningPower") and Workspace.SpawningPower:FindFirstChild("Spawned_Powers")

            if myRoot and powerFolder then
                for _, fruit in ipairs(powerFolder:GetChildren()) do
                    if not getgenv().AzureMemeSea.AutoCollectGroundFruits then break end
                    local handle = fruit:IsA("BasePart") and fruit or fruit:FindFirstChildWhichIsA("BasePart", true)
                    if handle and handle:IsDescendantOf(Workspace) then
                        myRoot.CFrame = handle.CFrame + Vector3.new(0, 1.5, 0)
                        task.wait(0.1)
                        if firetouchinterest then
                            firetouchinterest(myRoot, handle, 0)
                            task.wait(0.04)
                            firetouchinterest(myRoot, handle, 1)
                        end
                        task.wait(0.15)
                    end
                end
            end
        end
    end
end)

task.spawn(function()
    while true do
        task.wait(1)
        if getgenv().AzureMemeSea.AutoGachaMoney then
            pcall(function() if Remote_Modules then Remote_Modules:FireServer("Random_Power", {Type="Decuple", NPCName="Floppa Gacha", GachaType="Money"}) end end)
        end
        if getgenv().AzureMemeSea.AutoGachaGem then
            pcall(function() if Remote_Modules then Remote_Modules:FireServer("Random_Power", {Type="Decuple", NPCName="Doge Gacha", GachaType="Gem"}) end end)
        end
        if getgenv().AzureMemeSea.AutoStoreFruit then
            for _, tool in ipairs(LocalPlayer.Backpack:GetChildren()) do
                if tool:IsA("Tool") and (tool.Name:find("Fruit") or tool.Name:find("Power")) then
                    pcall(function() if Remote_Modules then Remote_Modules:FireServer("Eatable_Power", {Action = "Store", Tool = tool}) end end)
                end
            end
        end
    end
end)

RunService.Stepped:Connect(function()
    local char = LocalPlayer.Character
    if char then
        if getgenv().AzureMemeSea.NoClip then
            for _, p in ipairs(char:GetDescendants()) do if p:IsA("BasePart") then p.CanCollide = false end end
        end
        local hum = getHum(char)
        if hum then
            if getgenv().AzureMemeSea.SpeedEnabled then hum.WalkSpeed = getgenv().AzureMemeSea.SpeedValue end
            if getgenv().AzureMemeSea.JumpEnabled then hum.UseJumpPower = true; hum.JumpPower = getgenv().AzureMemeSea.JumpPower end
        end
    end
end)

local Tabs = {
    Combat   = Window:AddTab({ Title = "نوع القتال", Icon = "swords" }),
    State    = Window:AddTab({ Title = "تطوير State", Icon = "trending-up" }),
    NPCs     = Window:AddTab({ Title = "الـ NPC (المهام)", Icon = "user-check" }),
    Bosses   = Window:AddTab({ Title = "الزعماء", Icon = "skull" }),
    Raid     = Window:AddTab({ Title = "الرايد", Icon = "flame" }),
    Farm     = Window:AddTab({ Title = "المتريال", Icon = "target" }),
    Fruits   = Window:AddTab({ Title = "الفواكه والمتجر", Icon = "apple" }),
    Services = Window:AddTab({ Title = "الخدمات والكودات", Icon = "scroll" }),
    Movement = Window:AddTab({ Title = "الحركة", Icon = "user" })
}

Tabs.Combat:AddDropdown("AttackType", {
    Title = "نوع الهجوم الأساسي",
    Values = {"Weapon (السيف)", "Power (الفاكهة)", "FightingStyle (الأسلوب)"},
    Default = "Weapon (السيف)",
    Callback = function(val)
        if val:find("Weapon") then getgenv().AzureMemeSea.AttackType = "Weapon"
        elseif val:find("Power") then getgenv().AzureMemeSea.AttackType = "Power"
        elseif val:find("FightingStyle") then getgenv().AzureMemeSea.AttackType = "FightingStyle" end
    end
})

Tabs.Combat:AddInput("SafeDistance", {
    Title = "ارتفاع التثبيت فوق الهدف",
    Default = "5",
    Numeric = true,
    Callback = function(val)
        getgenv().AzureMemeSea.SafeDistance = tonumber(val) or 5
    end
})

local questNamesOnly = {}
for _, q in ipairs(CompleteQuestList) do table.insert(questNamesOnly, q.Quest) end

Tabs.NPCs:AddDropdown("NPCQuestSelect", {
    Title = "اختر مهمة الـ NPC",
    Values = questNamesOnly,
    Default = "Floppa Quest 1",
    Callback = function(val) getgenv().AzureMemeSea.SelectedNPCQuest = val end
})

Tabs.NPCs:AddToggle("AutoNormalNPC", { Title = "أوتو مهمة وتفريم الـ NPC المحدد", Default = false, Callback = function(val) getgenv().AzureMemeSea.AutoFarmNormalNPC = val end })

Tabs.State:AddInput("StatAmount", {
    Title = "قيمة التطوير المحددة (Amount)",
    Default = "1",
    Numeric = true,
    Callback = function(val)
        getgenv().AzureMemeSea.StatAmount = tonumber(val) or 1
    end
})

Tabs.State:AddButton({ Title = "❤️ ترقية الصحة", Callback = function() pcall(function() if Remote_Stats then Remote_Stats:InvokeServer({Target = "HealthLevel", Action = "UpgradeStats", Amount = getgenv().AzureMemeSea.StatAmount}) end end) end })
Tabs.State:AddButton({ Title = "🛡️ ترقية الدفاع", Callback = function() pcall(function() if Remote_Stats then Remote_Stats:InvokeServer({Target = "DefenseLevel", Action = "UpgradeStats", Amount = getgenv().AzureMemeSea.StatAmount}) end end) end })
Tabs.State:AddButton({ Title = "⚔️ ترقية السيف", Callback = function() pcall(function() if Remote_Stats then Remote_Stats:InvokeServer({Target = "SwordLevel", Action = "UpgradeStats", Amount = getgenv().AzureMemeSea.StatAmount}) end end) end })
Tabs.State:AddButton({ Title = "⚡ ترقية طاقة الفاكهة", Callback = function() pcall(function() if Remote_Stats then Remote_Stats:InvokeServer({Target = "MemePowerLevel", Action = "UpgradeStats", Amount = getgenv().AzureMemeSea.StatAmount}) end end) end })
Tabs.State:AddButton({ Title = "🥊 ترقية أسلوب القتال", Callback = function() pcall(function() if Remote_Stats then Remote_Stats:InvokeServer({Target = "MeleeLevel", Action = "UpgradeStats", Amount = getgenv().AzureMemeSea.StatAmount}) end end) end })

Tabs.Bosses:AddDropdown("BossSelect", {
    Title = "اختر الزعيم",
    Values = {"Lord Sus", "Giant Pumpkin", "Evil Noob", "Big Floppa", "Walter Dog", "Snow Tree", "Sus Face", "Gorilla King", "Obamid", "Pink Absorber", "Moai", "Rick Roller", "MrBeast", "Baller", "Dancing Banana"},
    Default = "Big Floppa",
    Callback = function(val) getgenv().AzureMemeSea.SelectedBoss = val end
})

Tabs.Bosses:AddDropdown("BossQuestTimes", {
    Title = "عدد مرات أخذ مهمة الزعيم",
    Values = {"مرة واحدة (1)", "مرتين (2)"},
    Default = "مرة واحدة (1)",
    Callback = function(val) getgenv().AzureMemeSea.BossQuestTimes = val end
})

Tabs.Bosses:AddToggle("AutoBoss", { Title = "أوتو مهمة وجلد الزعيم المختار فوراً", Default = false, Callback = function(val) getgenv().AzureMemeSea.AutoFarmBoss = val end })
Tabs.Bosses:AddToggle("AutoBeast", { Title = "جلد Meme Beast فور ظهوره", Default = false, Callback = function(val) getgenv().AzureMemeSea.AutoMemeBeast = val end })
Tabs.Bosses:AddToggle("SpawnSus", { Title = "رسبنة لورد سوس", Default = false, Callback = function(val) getgenv().AzureMemeSea.AutoSpawnLordSus = val end })
Tabs.Bosses:AddToggle("SpawnPumpkin", { Title = "رسبنة بامبكين", Default = false, Callback = function(val) getgenv().AzureMemeSea.AutoSpawnPumpkin = val end })
Tabs.Bosses:AddToggle("SpawnNoob", { Title = "رسبنة إيفل نوب", Default = false, Callback = function(val) getgenv().AzureMemeSea.AutoSpawnEvilNoob = val end })

Tabs.Raid:AddToggle("AutoStartRaid", { Title = "بدء الرايد تلقائياً (تم الإصلاح)", Default = false, Callback = function(val) getgenv().AzureMemeSea.AutoStartRaid = val end })
Tabs.Raid:AddToggle("AutoFarmRaid", { Title = "تفريم وحوش الرايد تلقائياً", Default = false, Callback = function(val) getgenv().AzureMemeSea.AutoFarmRaid = val end })

Tabs.Farm:AddDropdown("MatSelect", {
    Title = "اختر المتريال",
    Values = {"Night Man", "Noob Head", "Money Bag", "Ball", "Cat Food", "Meme Cube", "Floppa Hair", "Cheems Bone", "Sus Orb"},
    Default = "Night Man",
    Callback = function(val) getgenv().AzureMemeSea.SelectedMaterial = val end
})
Tabs.Farm:AddToggle("AutoMat", { Title = "أوتو مهمة وتفريم المتريال المختار", Default = false, Callback = function(val) getgenv().AzureMemeSea.AutoFarmMaterials = val end })

Tabs.Fruits:AddToggle("AutoCollect", { Title = "شفط فواكه الأرض", Default = false, Callback = function(val) getgenv().AzureMemeSea.AutoCollectGroundFruits = val end })
Tabs.Fruits:AddToggle("GachaMoney", { Title = "سحب 10 فواكه بالكاش", Default = false, Callback = function(val) getgenv().AzureMemeSea.AutoGachaMoney = val end })
Tabs.Fruits:AddToggle("GachaGem", { Title = "سحب 10 فواكه بالجواهر", Default = false, Callback = function(val) getgenv().AzureMemeSea.AutoGachaGem = val end })
Tabs.Fruits:AddToggle("AutoStore", { Title = "تخزين الفواكه في الحقيبة", Default = false, Callback = function(val) getgenv().AzureMemeSea.AutoStoreFruit = val end })
Tabs.Fruits:AddToggle("AutoPopcat", { Title = "النقر التلقائي على Popcat", Default = false, Callback = function(val) getgenv().AzureMemeSea.AutoPopcat = val end })

Tabs.Fruits:AddButton({ Title = "🛒 شراء سلاح Doge", Callback = function() pcall(function() if Remote_Modules then Remote_Modules:FireServer("Weapon_Seller", "Doge") end end) end })
Tabs.Fruits:AddButton({ Title = "🛒 شراء سلاح Cheems", Callback = function() pcall(function() if Remote_Modules then Remote_Modules:FireServer("Weapon_Seller", "Cheems") end end) end })
Tabs.Fruits:AddButton({ Title = "🪦 شراء سيف Gravestone", Callback = function() pcall(function() if Remote_Modules then Remote_Modules:FireServer("Weapon_Seller", "Gravestone") end end) end })

Tabs.Services:AddButton({ Title = "🎁 استرداد جميع الكودات النشطة", Callback = function() task.spawn(function() for _, code in ipairs(ActiveCodes) do pcall(function() if Remote_Code then Remote_Code:InvokeServer(code) end end) task.wait(0.15) end end) end })
Tabs.Services:AddButton({ Title = "🐾 فريق Floppa Recruiter", Callback = function() pcall(function() if Remote_Modules then Remote_Modules:FireServer("Change_Team", "Floppa Recruiter") end end) end })
Tabs.Services:AddButton({ Title = "🐕 فريق Cheems Recruiter", Callback = function() pcall(function() if Remote_Modules then Remote_Modules:FireServer("Change_Team", "Cheems Recruiter") end end) end })
Tabs.Services:AddButton({ Title = "🥊 أسلوب القتال (Baller)", Callback = function() pcall(function() if Remote_Modules then Remote_Modules:FireServer("FightingStyle_Teacher", "Baller") end end) end })
Tabs.Services:AddButton({ Title = "🎨 تغيير لون الهاكي", Callback = function() pcall(function() if Remote_Modules then Remote_Modules:FireServer("Reroll_Color", "Halved Sorcerer") end end) end })
Tabs.Services:AddButton({ Title = "✨ تفعيل / تطوير الهاكي", Callback = function() pcall(function() if Remote_Ability then Remote_Ability:InvokeServer("Aura") end end) end })
Tabs.Services:AddButton({ Title = "🛏️ تعيين نقطة الرسبون", Callback = function() pcall(function() if Remote_Modules then Remote_Modules:FireServer("Set_BedPoint", "The Bed") end end) end })
Tabs.Services:AddButton({ Title = "🍉 رول العرق", Callback = function() pcall(function() if Remote_Modules then Remote_Modules:FireServer("Reroll_Race", "Watermelon Man") end end) end })

Tabs.Movement:AddToggle("SpeedToggle", { Title = "تفعيل السرعة", Default = false, Callback = function(val) getgenv().AzureMemeSea.SpeedEnabled = val end })
Tabs.Movement:AddInput("SpeedValue", { Title = "قيمة السرعة", Default = "28", Numeric = true, Callback = function(val) getgenv().AzureMemeSea.SpeedValue = tonumber(val) or 28 end })
Tabs.Movement:AddToggle("JumpToggle", { Title = "تفعيل القفز", Default = false, Callback = function(val) getgenv().AzureMemeSea.JumpEnabled = val end })
Tabs.Movement:AddInput("JumpPower", { Title = "قوة القفز", Default = "65", Numeric = true, Callback = function(val) getgenv().AzureMemeSea.JumpPower = tonumber(val) or 65 end })
Tabs.Movement:AddToggle("NoClip", { Title = "اختراق الجدران (NoClip)", Default = false, Callback = function(val) getgenv().AzureMemeSea.NoClip = val end })

Fluent:Notify({
    Title = "Azure Hub",
    Content = "تم إصلاح زر بدء الرايد وكل مشاكل أخذ المهمات بنجاح تام!",
    Duration = 4
})
