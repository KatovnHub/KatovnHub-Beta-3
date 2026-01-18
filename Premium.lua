local Rayfield = loadstring(game:HttpGet("https://sirius.menu/rayfield"))()

-- ==============================
-- WINDOW
-- ==============================
local Window = Rayfield:CreateWindow({
   Name = "👑 KatovnHub | PREMIUM VIP 👑",
   Icon = 95214547594099, -- LOGO PREMIUM
   LoadingTitle = "🌟 Katovn Premium System 🌟",
   LoadingSubtitle = "High-End Experience",
   Theme = "AmberGlow",

   ConfigurationSaving = {
      Enabled = true,
      FolderName = "KatovnHub",
      FileName = "Premium"
   }
})

-- ==============================
-- TECH TAB
-- ==============================
local TechTab = Window:CreateTab("⚡ Tech VIP", 4483345998)
TechTab:CreateSection("⚔️ Premium Combat")

TechTab:CreateButton({
   Name = "🔥 Supa Tech V3",
   Callback = function()
      Rayfield:Notify({
         Title = "KatovnHub",
         Content = "Tech script coming soon 😎",
         Duration = 3
      })
   end
})

-- ==============================
-- FPS TAB
-- ==============================
local FpsTab = Window:CreateTab("🚀 FPS Booster", 4483345998)
FpsTab:CreateSection("⚡ Performance")

FpsTab:CreateButton({
   Name = "Boost FPS",
   Callback = function()
      for _, v in ipairs(workspace:GetDescendants()) do
         if v:IsA("BasePart") then
            v.Material = Enum.Material.SmoothPlastic
            v.Reflectance = 0
         elseif v:IsA("Decal") or v:IsA("Texture") then
            v:Destroy()
         end
      end

      local Lighting = game:GetService("Lighting")
      for _, v in ipairs(Lighting:GetChildren()) do
         v:Destroy()
      end

      Rayfield:Notify({
         Title = "FPS Booster",
         Content = "Boost applied successfully!",
         Duration = 3
      })
   end
})

-- ==============================
-- MOVESET TAB
-- ==============================
local MoveTab = Window:CreateTab("🎭 Moveset", 4483345998)
MoveTab:CreateSection("🥋 Skills")

MoveTab:CreateButton({
   Name = "Load Moveset",
   Callback = function()
      Rayfield:Notify({
         Title = "Moveset",
         Content = "Moveset script not added yet 😏",
         Duration = 3
      })
   end
})

-- ==============================
-- TROLL TAB
-- ==============================
local TrollTab = Window:CreateTab("💀 Troll Player", 4483345998)
TrollTab:CreateSection("🤡 Fun")

TrollTab:CreateButton({
   Name = "Fake Kick",
   Callback = function()
      Rayfield:Notify({
         Title = "LOL",
         Content = "Relax bro, just trolling 😂",
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
   Name = "Load TSB Script",
   Callback = function()
      Rayfield:Notify({
         Title = "TSB",
         Content = "TSB script will be added soon",
         Duration = 3
      })
   end
})

-- ==============================
-- SECURITY TAB
-- ==============================
local AntiTab = Window:CreateTab("🛡️ Security", 4483345998)
AntiTab:CreateSection("🔐 Protection")

local AntiAFKEnabled = false

AntiTab:CreateButton({
   Name = "Enable Anti AFK",
   Callback = function()
      if AntiAFKEnabled then
         Rayfield:Notify({
            Title = "Anti AFK",
            Content = "Already enabled!",
            Duration = 2
         })
         return
      end

      AntiAFKEnabled = true
      local vu = game:GetService("VirtualUser")
      local Players = game:GetService("Players")

      Players.LocalPlayer.Idled:Connect(function()
         vu:Button2Down(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
         task.wait(1)
         vu:Button2Up(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
      end)

      Rayfield:Notify({
         Title = "Anti AFK",
         Content = "Anti AFK enabled!",
         Duration = 3
      })
   end
})

-- ==============================
-- DISCORD TAB
-- ==============================
local DiscordTab = Window:CreateTab("💬 Discord", 4483345998)
DiscordTab:CreateSection("👥 VIP Community")

DiscordTab:CreateButton({
   Name = "🔗 Copy Discord Link",
   Callback = function()
      setclipboard("https://discord.gg/WrnvdHtQXn")
      Rayfield:Notify({
         Title = "Discord",
         Content = "Invite link copied!",
         Duration = 3
      })
   end
})

-- ==============================
-- SETTINGS TAB
-- ==============================
local SettingTab = Window:CreateTab("⚙️ Setting", 4483345998)
SettingTab:CreateSection("General")

SettingTab:CreateButton({
   Name = "Rejoin Server",
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
   Content = "Loading..."
})

task.spawn(function()
   while task.wait(1) do
      pcall(function()
         local Stats = game:GetService("Stats")
         local ping = math.floor(Stats.Network.ServerStatsItem["Data Ping"]:GetValue())

         infoLabel:Set({
            Title = "📡 Server Info",
            Content = string.format(
               "🌍 PlaceId: %d\n⚡ Ping: %d ms",
               game.PlaceId, ping
            )
         })
      end)
   end
end)

-- ==============================
-- LOADED NOTIFY
-- ==============================
Rayfield:Notify({
   Title = "👑 KatovnHub Premium",
   Content = "Menu Loaded Successfully!",
   Duration = 5
})
