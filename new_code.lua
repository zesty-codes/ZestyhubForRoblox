local Communicate
local lplr = game.Players.LocalPlayer
local breakParry = false
local holding = false
local permahold = false

local getCharacter=function()local b=lplr.Backpack:FindFirstChild("Backpack")if b:FindFirstChild("Normal Punch")then return"The Strongest Hero"elseif b:FindFirstChild("Flowing Water")then return"Hero Hunter"elseif b:FindFirstChild("Machine Gun Blows")then return"Destructive Cyborg"elseif b:FindFirstChild("Flash Strike")then return"Deadly Ninja"elseif b:FindFirstChild("Homerun")then return"Brutal Demon"elseif b:FindFirstChild("Quick Slice")then return"Blade Master"elseif b:FindFirstChild("Crushing Pull")then return"Wild Psychic"end end
function getAbilities()local a=getCharacter()if a=="The Strongest Hero"then return{[1]="Normal Punch",[2]="Consecutive Punches",[3]="Shove",[4]="Uppercut"}elseif a=="Hero Hunter"then return{[1]="Flowing Water",[2]="Lethal Whirlwind Stream",[3]="Hunter's Grasp"}elseif a=="Destructive Cyborg"then return{[1]="Machine Gun Blows",[2]="Ignition Burst",[3]="Blitz Shot",[4]="Jet Dive"}elseif a=="Deadly Ninja"then return{[1]="Flash Strike",[2]="Whirlwind Kick",[3]="Scatter",[4]="Explosive Shuriken"}elseif a=="Brutal Demon"then return{[1]="Homerun",[2]="Beatdown",[3]="Grand Slam",[4]="Foul Ball"}elseif a=="Blade Master"then return{[1]="Quick Slice",[2]="Atmos Cleave",[3]="Pinpoint Cut",[4]="Split Second Counter"}end end
function Communicate(a)if lplr and lplr.Character then local b=lplr.Character:FindFirstChild("Communicate")if b then b:FireServer(a)end end end

function useAbility(ability)
    local args = {
        [1] = {
            ["Goal"] = "Auto Use End",
            ["Tool"] = lplr:FindFirstChild(ability or "Flowing Water", true) or lplr.Backpack:FindFirstChild(ability or "Flowing Water", true)
        }
    }
    
    game:GetService("Players").LocalPlayer.Character.Communicate:FireServer(unpack(args))
    
end

function CommunicateWithRelease(key, delay) -- Enum.KeyCode[____]
	Communicate({Goal = "KeyPress", Key = key})
	task.wait(delay or 0.22)
	Communicate({Goal = "KeyRelease", Key = key})
end

function Punch()
    Communicate({Goal = "LeftClick", Mobile = true})
    task.wait(0.1)
    Communicate({Goal = "LeftClickRelease", Mobile = true})
end

local plrs = game:GetService("Players")
function getPlayersNear(a,b)local c={}for d,e in next,plrs:GetPlayers()do if e~=lplr and e.Character~=nil then local f=e.Character:FindFirstChildOfClass("Humanoid")if f and f.Health>1 then print((e.Character.Head.Position-a).Magnitude)if(e.Character.Head.Position-a).Magnitude<b then table.insert(c,e)end end end end;return c end

function calculatePartVelocity(part)
    if part then
        local velocity = part.Velocity
        local X, Z = velocity.X, velocity.Z
        X = X / 6.3
        Z = Z / 6.3
        return Vector3.new(X, 0, Z)
    end
    return Vector3.zero
end

function lookAtPartVelocity(part)
    workspace.CurrentCamera.CFrame = CFrame.new(workspace.CurrentCamera.CFrame.p, part.Position + calculatePartVelocity(part))
end

function autocombo(character)
    task.spawn(function()
        repeat
            lplr.Character:PivotTo(character:GetPivot() + (character:GetPivot().LookVector * -0.8))
            task.wait()
        until character.Humanoid.Health < 1 or lplr.Character.Humanoid.Health < 1
    end)

    local abilities = getAbilities()
    for i = 1, 4 do
        if abilities[i] ~= nil then
            useAbility(abilities[i])
            task.wait(2)
        end
    end
end

autocombo(workspace.Live["Weakest Dummy"])

--[[ credits to infinite yield for the platform checking
local IsOnMobile = table.find({Enum.Platform.IOS, Enum.Platform.Android}, game:GetService("UserInputService"):GetPlatform())
game:GetService("UserInputService").InputBegan:Connect(function(ip)
	if ip.UserInputType == Enum.UserInputType.MouseButton1 then
		holding = true
        permahold = true
        while holding do
            if IsOnMobile then
                Punch()
            end
            task.wait()
        end
	end
end)

game:GetService("UserInputService").InputEnded:Connect(function(ip)
	if ip.UserInputType == Enum.UserInputType.MouseButton1 then
        permahold = false
		holding = false
	end
end)]]

--[[
while task.wait(0.5) do
	local players = getPlayersNear(lplr.Character.Head.Position, 10)
	if #players == 1 or #players > 1 then
		Communicate({Goal = "KeyPress", Key = Enum.KeyCode.F})
		repeat
            lookAtPartVelocity(players[math.random(1, #players)].Character.HumanoidRootPart)
			task.wait()
		until holding == true or #getPlayersNear(lplr.Character.Head.Position, 10) == 0
		Communicate({Goal = "KeyRelease", Key = Enum.KeyCode.F})
	end
end]]
