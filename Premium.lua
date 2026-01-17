local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

-- ==============================
-- WINDOW (ĐÚNG CHUẨN)
-- ==============================
local Window = Rayfield:CreateWindow({
   Name = "👑 KatovnHub | PREMIUM VIP 👑",
   Icon = 95214547594099, -- ✅ LOGO PREMIUM (đúng: Icon)
   LoadingTitle = "🌟 Katovn Premium System 🌟",
   LoadingSubtitle = "High-End Experience",
   Theme = "AmberGlow",
   ConfigurationSaving = {
      Enabled = false
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
         Title = "Info",
         Content = "Coming soon bro 😎",
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
      for _,v in pairs(workspace:GetDescendants()) do
         if v:IsA("BasePart") then
            v.Material = Enum.Material.SmoothPlastic
            v.Reflectance = 0
         elseif v:IsA("Decal") or v:IsA("Texture") then
            v:Destroy()
         end
      end
      game:GetService("Lighting"):ClearAllChildren()

      Rayfield:Notify({
         Title = "FPS Booster",
         Content = "Boost applied!",
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
         Content = "Add script here bro 😏",
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
         Content = "Just kidding bro 😂",
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
         Content = "Paste TSB script here",
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

      game:GetService("Players").LocalPlayer.Idled:Connect(function()
         vu:Button2Down(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
         task.wait(1)
         vu:Button2Up(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
      end)

      Rayfield:Notify({
         Title = "Anti AFK",
         Content = "Enabled!",
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
         Title = "Success",
         Content = "Discord copied!",
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
   Name = "Rejoin Server",
   Callback = function()
      game:GetService("TeleportService"):Teleport(game.PlaceId, game.Players.LocalPlayer)
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
         local ping = math.floor(game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValue())
         local fps = math.floor(game:GetService("Stats").Workspace.Heartbeat:GetValue())

         infoLabel:Set({
            Title = "📡 Server Info",
            Content = string.format(
               "⚡ Ping: %d ms\n🔥 FPS: %d\n🌍 PlaceId: %d",
               ping, fps, game.PlaceId
            )
         })
      end)
   end
end)

-- ==============================
-- NOTIFY
-- ==============================
Rayfield:Notify({
   Title = "👑 KATOVN PREMIUM 👑",
   Content = "Menu Loaded Successfully!",
   Duration = 5,
   Image = 95214547594099
})
