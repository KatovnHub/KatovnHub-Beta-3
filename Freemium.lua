local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "📂 KatovnHub | Freemium", 
   LoadingTitle = "Katovn Script Hub",
   LoadingSubtitle = "by Katovn Team",
   ConfigurationSaving = {
      Enabled = false,
      FileName = "KatovnFreeData"
   },

   ImageId = "rbxassetid://115055477301086", -- ✅ LOGO FREE MỚI
   ImageSize = 32,
})

local TechTab = Window:CreateTab("⚡ Tech", 4483345998)
TechTab:CreateSection("⚔️ Combat Assist")
TechTab:CreateButton({ Name = "🔥 Supa Tech V3", Callback = function() end })

local TrollTab = Window:CreateTab("💀 Troll Player", 4483345998)
TrollTab:CreateSection("🤡 Fun & Troll")
TrollTab:CreateButton({ Name = "🌪️ Troll Feature", Callback = function() end })

local TSBTab = Window:CreateTab("🎯 Script TSB", 4483345998)
TSBTab:CreateSection("👊 The Strongest Battlegrounds")
TSBTab:CreateButton({ Name = "💎 Load TSB Main", Callback = function() end })

local DiscordTab = Window:CreateTab("💬 Discord", 4483345998)
DiscordTab:CreateSection("👥 Community")
DiscordTab:CreateButton({
   Name = "🔗 Copy New Discord Link",
   Callback = function()
       setclipboard("https://discord.gg/WrnvdHtQXn")
       Rayfield:Notify({Title = "Copied", Content = "Discord link copied!", Duration = 3})
   end,
})

local AdminTab = Window:CreateTab("🛡️ Admin", 4483345998)
AdminTab:CreateSection("📜 Admin Scripts")
AdminTab:CreateButton({
   Name = "🚀 Infinite Yield",
   Callback = function()
       loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
   end,
})

local SettingTab = Window:CreateTab("⚙️ Setting", 4483345998)
SettingTab:CreateSection("General Settings")

SettingTab:CreateDropdown({
   Name = "Change Theme",
   Options = {"Default", "Light", "Dark"},
   CurrentOption = {"Default"},
   MultipleOptions = false,
   Callback = function(Option)
       Rayfield:ModifyTheme(Option[1])
   end,
})

SettingTab:CreateButton({
   Name = "Rejoin",
   Callback = function()
       game:GetService("TeleportService"):Teleport(game.PlaceId, game.Players.LocalPlayer)
   end,
})

SettingTab:CreateSection("Server Info")
local infoLabel = SettingTab:CreateParagraph({Title = "Details", Content = "Connecting..."})

task.spawn(function()
    while task.wait(1) do
        pcall(function()
            local ping = math.floor(game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValue())
            local fps = math.floor(game:GetService("Stats").Workspace.Heartbeat:GetValue())
            infoLabel:Set({
                Title = "📡 Server Info",
                Content = string.format("🌍 PlaceId: %s\n⚡ Ping: %d ms\n🔥 FPS: %d", game.PlaceId, ping, fps)
            })
        end)
    end
end)

Rayfield:Notify({
   Title = "KatovnHub",
   Content = "Freemium Loaded Successfully!",
   Duration = 5,
   Image = 115055477301086 -- ✅ LOGO FREE MỚI
})
