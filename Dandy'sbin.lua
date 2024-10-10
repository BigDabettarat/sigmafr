local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()

local randomtexts = {
    "gambling yay gambling",
    "Striker was here (so was paper mario)",
    '"Waffle  Developent, Idk" - worm',
    "Dandy's Bin | This script was brought to you by our talented scripters. Enjoy!",
    "Dandy's Bin ".. '| This script was brought to you by our "talented" scripters. Enjoy!',
    "hi i love paper mario paper mario is so cool so cool",
    "i like skibidi toilet",
    "Our Team | Issac, Striker👑, Paper Mario, Mack, Worm#1, The Sun, Craze And Rose.",
    "Who Hates Qwel???",
    "Rox Was a bad scripter according to qwel LMAO that means anticheat is bad🥳"
}

local thetext = randomtexts[math.random(1, #randomtexts)]

local Window = OrionLib:MakeWindow({Name = "Dandy's Bin collection", HidePremium = false, SaveConfig = true, ConfigFolder = "Dandy's bin Config", IntroEnabled = true, IntroText = thetext, IntroIcon = "rbxassetid://113953426721678", Icon = "rbxassetid://113953426721678"})

local Toon = "Astro"
local FToon = "Dandy"

local Ran = false

local Gen = Window:MakeTab({
    Name = "General",
    Icon = "rbxassetid://113953426721678",
    PremiumOnly = false
})

--General starts here
    local Movement = Gen:AddSection({
      Name = "Movement"
    })

Movement:AddParagraph("Note:","Use the bypass before changing your speed slider just one click")

Gen:AddButton({
	Name = "Bypass Speed Check (PRESS)",
	Callback = function()
        local eventsFolder = game.ReplicatedStorage.Events
        local speedEvent = eventsFolder:FindFirstChild("CheckPlayerSpeed")

        if speedEvent then
            speedEvent:Destroy()
            print("Bypass Completed.")
        else
            print("Not Found Already Bypassed.")
        end
	end
})

Gen:AddSlider({
	Name = "WalkSpeed",
	Min = 2,
	Max = 500,
	Default = 16,
	Color = Color3.fromRGB(255,255,255),
	Increment = 1,
	ValueName = "WS",
	Callback = function(Value)
		game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = (Value)
	end    
})

--General starts here
    local ESP = Gen:AddSection({
      Name = "ESP"
    })

ESP:AddButton({
	Name = "Player ESP",
	Callback = function()
	    local FillColor = Color3.fromRGB(0,0,255) local DepthMode = "AlwaysOnTop" local FillTransparency = 0.5 local OutlineColor = Color3.fromRGB(255,255,255) local OutlineTransparency = 0.5 local CoreGui = game:FindService("CoreGui") local Players = game:FindService("Players") local lp = Players.LocalPlayer local connections = {} local Storage = Instance.new("Folder") Storage.Parent = CoreGui Storage.Name = "Highlight_Storage" local function Highlight(plr) local Highlight = Instance.new("Highlight") Highlight.Name = plr.Name Highlight.FillColor = FillColor Highlight.DepthMode = DepthMode Highlight.FillTransparency = FillTransparency Highlight.OutlineColor = OutlineColor Highlight.OutlineTransparency = 0.5 Highlight.Parent = Storage local plrchar = plr.Character if plrchar then Highlight.Adornee = plrchar end connections[plr] = plr.CharacterAdded:Connect(function(char) Highlight.Adornee = char end) end Players.PlayerAdded:Connect(Highlight) for i,h in next, Players:GetPlayers() do Highlight(h) end Players.PlayerRemoving:Connect(function(plr) local plrname = plr.Name if Storage[plrname] then Storage[plrname]:Destroy() end if connections[plr] then connections[plr]:Disconnect() end end)
	end
})

local runservice = game:GetService("RunService")
local esp = Instance.new("Highlight")
esp.Name = "hl"
esp.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
esp.OutlineTransparency = 1

ESP:AddButton({
	Name = "Monster ESP",
	Callback = function()
	    for _,k in pairs(game.Workspace.CurrentRoom:GetChildren()) do
        if k:IsA("Model") then
            local room = k
            for _,v in pairs(room:FindFirstChild("Monsters"):GetChildren()) do
                local folder = v
                runservice.Heartbeat:Connect(function()
                    for _, v in pairs(folder:GetChildren()) do
                        repeat Wait() until v
                        if not v:FindFirstChild("hl") then
                            local hlclone = esp:Clone()
                            hlclone.Adornee = v
                            hlclone.Parent = v
                        end
                    end
                end)
            end
        end
       end
    end
})

--General ends here

local SKI = Window:MakeTab({
    Name = "Buy skins",
    Icon = "",
    PremiumOnly = false
})
--Skin starts here
    local Skin = "DreamAstro"

    SKI:AddDropdown({
        Name = "Gamepass skin",
        Default = "DreamAstro",
        Options = {"DreamAstro", "DreamPebble", "DreamVee", "DreamShelly", "DreamSprout"},
        Callback = function(Value)
            --print(Value)
            Skin = Value
        end    
    })

    SKI:AddButton({
        Name = "Buy (600+ ichor)",
        Callback = function()
            local args = {
                [1] = "Gacha1",
                [2] = Skin
            }
            
            game:GetService("ReplicatedStorage").BuySkin:InvokeServer(unpack(args))
        end    
    })
--Skin ends here

local TRO = Window:MakeTab({
    Name = "Trolling",
    Icon = "",
    PremiumOnly = false
})
--Trolling starts here
    local TROL = TRO:AddSection({
        Name = "Fake choice"
    })

    TROL:AddParagraph("Note:","After putting the fake choice just before the game starts, choose an actual character you have")

    TROL:AddDropdown({
    	Name = "Fake choice toon",
    	Default = "Dandy",
    	Options = {"Dandy","Astro", "Boxten", "Brightney", "Cosmo", "Finn", "Flutter", "Gigi", "Glisten", "Goob", "Pebble", "Poppy", "Razzle & Dazzle", "Rodger", "Scraps", "Shelly", "Shrimpo", "Sprout", "Teagan", "Tisha", "Toodles"},
    	Callback = function(Value)
    		--print(Value)
            FToon = Value
    	end    
    })

    TROL:AddButton({
    	Name = "Execute",
    	Callback = function()
            local args = {
                [1] = FToon
            }
            
            game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("Voted"):InvokeServer(unpack(args))
      	end    
    })

--Trolling ends here

local STG = Window:MakeTab({
    Name = "Starter Toon",
    Icon = "",
    PremiumOnly = false
})
-- Starter toon glitch starts here
    local Note = STG:AddSection({
    	Name = "Starter Toon Glitch"
    })

    Note:AddParagraph("Note:","You can only do this on the starter toon screen, also you can only choose one toon")

    Note:AddDropdown({
    	Name = "Toon",
    	Default = "Astro",
    	Options = {"Astro", "Boxten", "Brightney", "Cosmo", "Finn", "Flutter", "Gigi", "Glisten", "Goob", "Pebble", "Poppy", "Razzle & Dazzle", "Rodger", "Scraps", "Shelly", "Shrimpo", "Sprout", "Teagan", "Tisha", "Toodles"},
    	Callback = function(Value)
    		--print(Value)
            Toon = Value
    	end    
    })

    Note:AddButton({
    	Name = "Execute",
    	Callback = function()
            if not Ran then
                Ran = true
                OrionLib:MakeNotification({
                    Name = "BEFORE YOU DO ANYTHING!",
                    Content = "Wait a little bit before you leave",
                    Image = "rbxassetid://113953426721678",
                    Time = 8
                })
            
                  print("button pressed")
                  local args = {
                    [1] = Toon
                }

                game:GetService("ReplicatedStorage"):WaitForChild("EarnTutorialTower"):InvokeServer(unpack(args))
                wait(3)
                game:GetService("ReplicatedStorage"):WaitForChild("CheckTutorial"):InvokeServer()
                wait(3)
                OrionLib:MakeNotification({
                    Name = "You can leave now.",
                    Content = "If the script worked correctly, when you rejoin you get the toon, try again if not.",
                    Image = "rbxassetid://113953426721678",
                    Time = 8
                })
            else
                OrionLib:MakeNotification({
                    Name = "You already executed the script.",
                    Content = "You can only execute the script once, if you made the wrong choice on accident you cant go back.",
                    Image = "rbxassetid://113953426721678",
                    Time = 8
                })
            end
      	end    
    })
--Starter toon glitch ends here

local Sett = Window:MakeTab({
    Name = "Settings",
    Icon = "",
    PremiumOnly = false
})

local Set = Sett:AddSection({
    	Name = "Main"
    })
Set:AddParagraph("Note:", "More Settings Soon")

Set:AddButton({
    	Name = "Destroy UI",
    	Callback = function()
		OrionLib:Destroy()
      	end    
    })






OrionLib:Init()