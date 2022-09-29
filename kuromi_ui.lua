local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("KuromiUI - by NodeMixaholic.", "DarkTheme")

--Main
local mainTab = Window:NewTab("Main")
local generalSection = mainTab:NewSection("General")


generalSection:NewToggle("Spam Parts", "spam lol", function(state)
    if state then
        _G.spamparts = true
        while wait(.3) and _G.spamparts == true do
        pos = game.Players.LocalPlayer.Character.HumanoidRootPart.Position
        for _, a in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
        if a:IsA("Tool") then
        wait(.3)
        a.CanBeDropped = true
        game.Players.LocalPlayer.Character.Humanoid:EquipTool(a)
        a.Parent = game.Workspace
        end
        end
        game.Players.LocalPlayer.Character:MoveTo(pos + Vector3.new(1,2,3));
        game.Players.LocalPlayer.Character.Humanoid.Health = 0
        wait(6)
        game.Players.LocalPlayer.Character:MoveTo(pos + Vector3.new(1,2,3));
        end
    else
        _G.spamparts = false
    end
end)

generalSection:NewButton("Give FE Suicide Gun", "By NodeMixaholic. MEDEVIL HOOD OF MYSTERY RECCOMENDED!", function()
        for _, a in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
        if a:IsA("Accessory") then
        newtool = Instance.new("Tool", game.Players.LocalPlayer.Backpack)
        a.Handle.Mesh.MeshId = "rbxassetid://130099641"
        a.Handle.Parent = newtool
        newtool.Name = "Suicide gun"
        newtool.ToolTip = "With the " .. a.Name .. " wrap."
        
        function onActivate()
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 0
        game.Players.LocalPlayer.Character.Humanoid.JumpPower = 0
        wait()
        AnimationId = "181525546"
        local Anim = Instance.new("Animation")
        Anim.AnimationId = "rbxassetid://"..AnimationId
        local k = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
        k:Play()
        k:AdjustSpeed(4)
        wait(.3375)
        k:AdjustSpeed(0)
        wait(1)
        game.Players.LocalPlayer.Character.Humanoid.Health = 0
        end
        newtool.Activated:Connect(onActivate)
        
        end
        end
        --DIRTY HACKS TO PARENT HAT/TOOLS WITH REPLICATION ON FE--
        game:GetService'RunService'.Stepped:wait()
        grabknife.Parent = plr.Character
        for i = 1,3 do
        local lol = lp:FindFirstChildOfClass'Backpack':FindFirstChildOfClass'HopperBin'
        if lol:FindFirstChild'LocalScript' then lol:Destroy() end
        end
        -- hacky replication made by harkinian!!
end)

generalSection:NewButton("Infinite Yield", "by EdgeIY", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
end)

generalSection:NewButton("ChatHax", "by ant-6802", function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/ant-7802/--/main/straightmilk.lua'))()
end)

generalSection:NewButton("Ear Rape", "turn your volume down! <3", function()
    for _, sound in next, workspace:GetDescendants() do
        if sound:IsA("Sound") then
            sound:Play()
        end
     end
end)

generalSection:NewButton("Server Shutdown", "turn your volume down! <3. makes server useless.", function()
    while wait() do
        for _, sound in next, workspace:GetDescendants() do
            if sound:IsA("Sound") then
                sound:Play()
            end
         end
    end
end)



--Player section
local playerTab = Window:NewTab("LocalPlayer")
local playerSection = playerTab:NewSection("Player")

playerSection:NewSlider("WalkSpeed", "Changes your WalkSpeed", 500, 0, function(s) -- 500 (MaxValue) | 0 (MinValue)
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = s
end)

playerSection:NewSlider("JumpPower", "Changes your JumpPower", 1000, 0, function(s) -- 1000 (MaxValue) | 0 (MinValue)
    game.Players.LocalPlayer.Character.Humanoid.JumpPower = s
end)

playerSection:NewToggle("Fly", "universial fly script by nodemixaholic", function(state)
    if state then
        _G.swimfly = true
        while wait() and _G.swimfly == true do
            game.Players.LocalPlayer.Character.Humanoid:ChangeState(4)
        end
    else
        _G.swimfly = false
    end
end)


playerSection:NewButton("BTOOLS", "build client-sided", function()
    localplayer = game.Players.LocalPlayer
    local Copy = Instance.new("HopperBin",localplayer.Backpack)
    Copy.BinType = "Clone"
    local Destroy = Instance.new("HopperBin",localplayer.Backpack)
    Destroy.BinType = "Hammer"
    local Grab = Instance.new("HopperBin",localplayer.Backpack)
    Grab.BinType = "Grab"
end)


playerSection:NewToggle("Infinite OOF", "to infinity and beyond!", function(state)
    if state then
        _G.infoof = true -- Re-execute to turn off
        _G.speed = 110 -- Keep around 100 or it wont play

        -- Variables
        local RunService = game:GetService("RunService");
        local Players = game:GetService("Players");
        local LocalPlayer = game:GetService("Players").LocalPlayer;

        local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait();
        local Humanoid = Character:WaitForChild("Humanoid") or Character:FindFirstChildOfClass("Humanoid");
        local HRP = Humanoid.RootPart or Humanoid:FindFirstChild("HumanoidRootPart")

        -- Check
        if not Humanoid or not _G.infoof then
            if Humanoid and Humanoid.Health <= 0 then
                Humanoid:Destroy()
            end
            return
        end

        -- Setting Up Humanoid
        Humanoid:SetStateEnabled(Enum.HumanoidStateType.Dead, false)
        Humanoid.BreakJointsOnDeath = false
        Humanoid.RequiresNeck = false

        local con; con = RunService.Stepped:Connect(function()
            if not Humanoid then return con:Disconnect() end
                Humanoid:ChangeState(Enum.HumanoidStateType.Running)  -- Change state so not die
            end)

        -- Infinite Death [literally 3 lines dont make it complicated]
        LocalPlayer.Character = nil
        LocalPlayer.Character = Character
        task.wait(Players.RespawnTime + 0.1)

while task.wait(1/_G.speed) do
   Humanoid:ChangeState(Enum.HumanoidStateType.Dead)
   end
    else
        _G.infoof = false
    end
end)

playerSection:NewButton("FE Headless", "rogangsters go brrr, i get headless free.", function()
local lp = game:GetService "Players".LocalPlayer
if lp.Character:FindFirstChild "Head" then
    local char = lp.Character
    char.Archivable = true
    local new = char:Clone()
    new.Parent = workspace
    lp.Character = new
    wait(2)
    local oldhum = char:FindFirstChildWhichIsA "Humanoid"
    local newhum = oldhum:Clone()
    newhum.Parent = char
    newhum.RequiresNeck = false
    oldhum.Parent = nil
    wait(2)
    lp.Character = char
    new:Destroy()
    wait(1)
    newhum:GetPropertyChangedSignal("Health"):Connect(
        function()
            if newhum.Health <= 0 then
                oldhum.Parent = lp.Character
                wait(1)
                oldhum:Destroy()
            end
        end)
    workspace.CurrentCamera.CameraSubject = char
    if char:FindFirstChild "Animate" then
        char.Animate.Disabled = true
        wait(.1)
        char.Animate.Disabled = false
    end
    lp.Character:FindFirstChild "Head":Destroy()
end
end)

generalSection:NewButton("Invisible Wheel Chair", "a Poodletooth classic made by someone else. lol.", function()
    game.StarterGui:SetCore("SendNotification", {
        Title = "Invisible wheel chair.";
        Text = "So powerful!";
        Icon = "";
        Duration = 5;
        })

        local player = game.Players.LocalPlayer
        local anims = player.Character.Animate
        local sit = anims.sit:FindFirstChildOfClass("Animation").AnimationId
        anims.idle:FindFirstChildOfClass("Animation").AnimationId = sit
        anims.walk:FindFirstChildOfClass("Animation").AnimationId = sit
        anims.run:FindFirstChildOfClass("Animation").AnimationId = sit
        anims.jump:FindFirstChildOfClass("Animation").AnimationId = sit
        
        player.Character:FindFirstChildOfClass('Humanoid').HipHeight = 3
        player.Character:FindFirstChildOfClass('Humanoid').WalkSpeed = 85
end)

playerSection:NewButton("Funny Character", "R6 Required. By NodeMixaholic.", function()
game.Players.LocalPlayer.Character.Head.Mesh:Destroy()
game.Players.LocalPlayer.Character.Head:FindFirstChildOfClass("Decal"):Destroy()
game.Players.LocalPlayer.Character["Left Arm"]:Destroy()
game.Players.LocalPlayer.Character["Right Arm"]:Destroy()

repeat
AnimationId = "121572214"
local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://"..AnimationId
local k = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
k:Play()
k:AdjustSpeed(0.2)
wait(.075)
k:AdjustSpeed(1.6)
wait(.1)
k:AdjustSpeed(4.6)
wait(.2)
local Humanoid = game.Players.LocalPlayer.Character.Humanoid

local ActiveTracks = Humanoid:GetPlayingAnimationTracks()

for _,v in pairs(ActiveTracks)
do v:Stop()
end
wait()
until game.Players.LocalPlayer.Character.Humanoid.Health == 0
end)

playerSection:NewButton("Zombify Me", "R6 required. By NodeMixaholic.", function()
    AnimationId      = "183294396"
    local Anim       = Instance.new("Animation")
    Anim.AnimationId = "rbxassetid://"..AnimationId
    local k          = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
    k:Play(0)
    k:AdjustSpeed(1)
end)

--Printer game
if game.PlaceId == 8447279898 then
    local placeTab = Window:NewTab("Useless Printer Game")
    local placeSectionM = placeTab:NewSection("You will likely get caught.")

    placeSectionM:NewButton("Tons of Money!", "You will get caught.", function()
        while game.Players.LocalPlayer.leaderstats.Money.Value < 17100000000 do
            getsenv(game.Players.LocalPlayer.PlayerScripts.cashTreasureChest).claimReward()
            wait(.15)
        end
    end)
    
    placeSectionM:NewButton("More Money!", "You may caught.", function()
        getsenv(game.Players.LocalPlayer.PlayerScripts.cashTreasureChest).claimReward()
    end)
end
