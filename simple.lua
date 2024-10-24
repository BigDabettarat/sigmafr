local player: any = game.Players.LocalPlayer

local wsd: any = player.Character.Humanoid.WalkSpeed

local jpd: any = player.Character.Humanoid.JumpPower

local version: string = "1.0.0"

local premium: string = "Free Edition"

-- Defineing Needed Stuff

print("Loading UI")
print("Loading Offsets")
task.wait(1)
print("Loaded Offsets")
print("Fetching ID and Version")
task.wait(1)
print("Nova Version:", version)
print("ID:", premium)
task.wait(1)
print("Finishing Up...")
task.wait(2)
print("Loaded Nova!")

-- Printing random shit

local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/SaveManager.lua"))()
local InterfaceManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/InterfaceManager.lua"))()

-- launching fluent libary

local Window = Fluent:CreateWindow({
    Title = "Nova",
    SubTitle = "Discord: @thatsangelic",
    TabWidth = 160,
    Size = UDim2.fromOffset(580, 460),
    Acrylic = true,
    Theme = "Darker",
    MinimizeKey = Enum.KeyCode.LeftControl
})

-- making window

local Tabs = {
    Main = Window:AddTab({ Title = "Main", Icon = ""}),
    Visuals = Window:AddTab({ Title = "Visuals", Icon = ""}),
    Settings = Window:AddTab({ Title = "Settings", Icon = "settings"})
}

-- making tabs

local Options: any = Fluent.Options

-- options setup

Tabs.Main:AddParagraph({
    Title = "Note:",
    Content = "Controls Your CFrame Properties."
})

-- Added note

Tabs.Main:AddSlider("WSS", {
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

Tabs.Main:AddSlider("JPS", {
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

-- added walkspeed and jumppower slider

Tabs.Visuals:AddButton({
    Title = "Player ESP",
    Description = "Highlights All Players In Server.",
    Callback = function()
        local FillColor = Color3.fromRGB(0,0,255) local DepthMode = "AlwaysOnTop" local FillTransparency = 0.5 local OutlineColor = Color3.fromRGB(255,255,255) local OutlineTransparency = 0.5 local CoreGui = game:FindService("CoreGui") local Players = game:FindService("Players") local lp = Players.LocalPlayer local connections = {} local Storage = Instance.new("Folder") Storage.Parent = CoreGui Storage.Name = "Highlight_Storage" local function Highlight(plr) local Highlight = Instance.new("Highlight") Highlight.Name = plr.Name Highlight.FillColor = FillColor Highlight.DepthMode = DepthMode Highlight.FillTransparency = FillTransparency Highlight.OutlineColor = OutlineColor Highlight.OutlineTransparency = 0.5 Highlight.Parent = Storage local plrchar = plr.Character if plrchar then Highlight.Adornee = plrchar end connections[plr] = plr.CharacterAdded:Connect(function(char) Highlight.Adornee = char end) end Players.PlayerAdded:Connect(Highlight) for i,v in next, Players:GetPlayers() do Highlight(v) end Players.PlayerRemoving:Connect(function(plr) local plrname = plr.Name if Storage[plrname] then Storage[plrname]:Destroy() end if connections[plr] then connections[plr]:Disconnect() end end)
    end
})

-- add esp visual in blue and white





































































































SaveManager:SetLibrary(Fluent)
InterfaceManager:SetLibrary(Fluent)


SaveManager:IgnoreThemeSettings()


SaveManager:SetIgnoreIndexes({})


InterfaceManager:SetFolder("FluentScriptHub")
SaveManager:SetFolder("FluentScriptHub/specific-game")

InterfaceManager:BuildInterfaceSection(Tabs.Settings)
SaveManager:BuildConfigSection(Tabs.Settings)

-- building settings tab from the libary


Window:SelectTab(1)

-- selected tab to show when launched

Fluent:Notify({
    Title = "Nova",
    Content = "Nova Finished Loading!",
    Duration = 6
})

-- notify the user that Nova loaded


SaveManager:LoadAutoloadConfig()

-- auto load config from the latest play on the script