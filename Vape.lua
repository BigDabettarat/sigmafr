local dpv: string = "Developer Edition"

local versionv: string = "Dev"

print("Getting Version Of Vape")
task.wait(2)
print("Version:", versionv)
print("Loading Offsets.")
task.wait(2)
print("Using:", dpv)
print("Loaded Offsets!")
task.wait(1)
print("Finishing Up..")
task.wait(1)
print("Loaded Vape", dpv)



local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/SaveManager.lua"))()
local InterfaceManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/InterfaceManager.lua"))()

local Window = Fluent:CreateWindow({
    Title = "Vape",
    SubTitle = "Discord: @thatsangelic",
    TabWidth = 160,
    Size = UDim2.fromOffset(580, 460),
    Acrylic = true, -- The blur may be detectable, setting this to false disables blur entirely
    Theme = "Darker",
    MinimizeKey = Enum.KeyCode.LeftControl -- Used when theres no MinimizeKeybind
})

local Tabs = {
    Main = Window:AddTab({ Title = "Main", Icon = "" }),
    Visuals = Window:AddTab({ Title = "Visuals", Icon = "" }),
    Settings = Window:AddTab({ Title = "Settings", Icon = "settings" })
}

local Options: any = Fluent.Options

local player = game.Players.LocalPlayer

local wsd: any = player.Character.Humanoid.WalkSpeed

local jpd: any = player.Character.Humanoid.JumpPower

Tabs.Main:AddParagraph({
        Title = "Note:",
        Content = "This Controls Your CFrame Propites."
    })

local Slider: any = Tabs.Main:AddSlider("WSS", {
        Title = "WalkSpeed",
        Description = "WS",
        Default = wsd,
        Min = 1,
        Max = 150,
        Rounding = 1,
        Callback = function(Value)
            player.Character.Humanoid.WalkSpeed = Value
        end
    })

    local Slider: any = Tabs.Main:AddSlider("JPS", {
        Title = "JumpPower",
        Description = "JP",
        Default = jpd,
        Min = 1,
        Max = 300,
        Rounding = 1,
        Callback = function(Value)
            player.Character.Humanoid.JumpPower = Value
        end
    })

    Tabs.Visuals:AddButton({
        Title = "Player ESP",
        Description = "Makes Players Blue Through Walls.",
        Callback = function()
                local FillColor = Color3.fromRGB(0,0,255) local DepthMode = "AlwaysOnTop" local FillTransparency = 0.5 local OutlineColor = Color3.fromRGB(255,255,255) local OutlineTransparency = 0.5 local CoreGui = game:FindService("CoreGui") local Players = game:FindService("Players") local lp = Players.LocalPlayer local connections = {} local Storage = Instance.new("Folder") Storage.Parent = CoreGui Storage.Name = "Highlight_Storage" local function Highlight(plr) local Highlight = Instance.new("Highlight") Highlight.Name = plr.Name Highlight.FillColor = FillColor Highlight.DepthMode = DepthMode Highlight.FillTransparency = FillTransparency Highlight.OutlineColor = OutlineColor Highlight.OutlineTransparency = 0.5 Highlight.Parent = Storage local plrchar = plr.Character if plrchar then Highlight.Adornee = plrchar end connections[plr] = plr.CharacterAdded:Connect(function(char) Highlight.Adornee = char end) end Players.PlayerAdded:Connect(Highlight) for i,v in next, Players:GetPlayers() do Highlight(v) end Players.PlayerRemoving:Connect(function(plr) local plrname = plr.Name if Storage[plrname] then Storage[plrname]:Destroy() end if connections[plr] then connections[plr]:Disconnect() end end)
        end
    })

-- Hand the library over to our managers
SaveManager:SetLibrary(Fluent)
InterfaceManager:SetLibrary(Fluent)

-- Ignore keys that are used by ThemeManager.
-- (we dont want configs to save themes, do we?)
SaveManager:IgnoreThemeSettings()

-- You can add indexes of elements the save manager should ignore
SaveManager:SetIgnoreIndexes({})

-- use case for doing it this way:
-- a script hub could have themes in a global folder
-- and game configs in a separate folder per game
InterfaceManager:SetFolder("FluentScriptHub")
SaveManager:SetFolder("FluentScriptHub/specific-game")

InterfaceManager:BuildInterfaceSection(Tabs.Settings)
SaveManager:BuildConfigSection(Tabs.Settings)


Window:SelectTab(1)

Fluent:Notify({
    Title = "Vape",
    Content = "Vape Has Finalized",
    Duration = 5
})

-- You can use the SaveManager:LoadAutoloadConfig() to load a config
-- which has been marked to be one that auto loads!
SaveManager:LoadAutoloadConfig()