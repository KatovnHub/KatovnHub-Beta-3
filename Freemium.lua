local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

-- ==============================
-- WINDOW
-- ==============================
local Window = Rayfield:CreateWindow({
   Name = "📂 KatovnHub | Freemium",
   Icon = 115055477301086, -- ✅ LOGO FREE (đúng: Icon)
   LoadingTitle = "Katovn Script Hub",
   LoadingSubtitle = "by Katovn Team",
   Theme = "Default",
   ConfigurationSaving = {
      Enabled = false
   }
})

-- ==============================
-- TECH TAB
-- ==============================
local TechTab = Window:CreateTab("⚡ Tech", 4483345998)
TechTab:CreateSection("⚔️ Combat Assist")

TechTab:CreateButton({
   Name = "🔥 Supa Tech V3",
   Callback = function()
      Rayfield:Notify({
         Title = "Info",
         Content = "Coming soon bro 😎",
         Duration = 3
      })
   end
})

-- ==============================
-- TROLL TAB
-- ==============================
local TrollTab = Window:CreateTab("💀 Troll Player", 4483345998)
TrollTab:CreateSection("🤡 Fun & Troll")

TrollTab:CreateButton({
   Name = "🌪️ Troll Feature",
   Callback = function()
      Rayfield:Notify({
         Title = "Troll",
         Content = "Feature coming soon 😂",
         Duration = 3
      })
   end
})

-- ==============================
-- TSB TAB
-- ==============================
local TSBTab = Window:CreateTab("🎯 Script TSB", 4483345998)
TSBTab:CreateSection("👊 The Strongest Battlegrounds")

TSBTab:CreateButton({
   Name = "💎 Load TSB Main",
   Callback = function()
      Rayfield:Notify({
         Title = "TSB",
         Content = "Paste your TSB script here bro",
         Duration = 3
      })
   end
})

-- ==============================
-- ADMIN TAB
-- ==============================
local AdminTab = Window:CreateTab("🛡️ Admin", 4483345998)
AdminTab:CreateSection("📜 Admin Scripts")

AdminTab:CreateButton({
   Name = "🚀 Infinite Yield",
   Callback = function()
      loadstring(game:HttpGet(
         "https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"
      ))()
   end
})

-- ==============================
-- DISCORD TAB
-- ==============================
local DiscordTab = Window:CreateTab("💬 Discord", 4483345998)
DiscordTab:CreateSection("👥 Community")

DiscordTab:CreateButton({
   Name = "🔗 Copy Discord Link",
   Callback = function()
      setclipboard("https://discord.gg/WrnvdHtQXn")
      Rayfield:Notify({
         Title = "Copied",
         Content = "Discord link copied!",
         Duration = 3
      })
   end
})

-- ==============================
-- SETTING TAB
-- ==============================
local SettingTab = Window:CreateTab("⚙️ Setting", 4483345998)
SettingTab:CreateSection("General")

SettingTab:CreateButton({
   Name = "Rejoin",
   Callback = function()
      game:GetService("TeleportService"):Teleport(
         game.PlaceId,
         game.Players.LocalPlayer
      )
   end
})

-- ==============================
-- SERVER INFO
-- ==============================
SettingTab:CreateSection("Server Info")

local infoLabel = SettingTab:CreateParagraph({
   Title = "Details",
   Content = "Connecting..."
})

task.spawn(function()
   while task.wait(1) do
      pcall(function()
         local ping = math.floor(
            game:GetService("Stats")
            .Network.ServerStatsItem["Data Ping"]:GetValue()
         )
         local fps = math.floor(
            game:GetService("Stats")
            .Workspace.Heartbeat:GetValue()
         )

         infoLabel:Set({
            Title = "📡 Server Info",
            Content = string.format(
               "🌍 PlaceId: %d\n⚡ Ping: %d ms\n🔥 FPS: %d",
               game.PlaceId, ping, fps
            )
         })
      end)
   end
end)

-- ==============================
-- NOTIFY
-- ==============================
Rayfield:Notify({
   Title = "KatovnHub",
   Content = "Freemium Loaded Successfully!",
   Duration = 5,
   Image = 115055477301086
})
