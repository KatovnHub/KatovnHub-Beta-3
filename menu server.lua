local Rayfield = loadstring(game:HttpGet("https://sirius.menu/rayfield"))()

local Window = Rayfield:CreateWindow({
   Name = "🔑 KatovnHub | Key System",
   LoadingTitle = "Checking Access...",
   LoadingSubtitle = "by Katovn Team",
   ConfigurationSaving = { Enabled = false },
   ImageId = "rbxassetid://115055477301086", -- LOGO FREE
   ImageSize = 32,
   Theme = "Default"
})

local KeyTab = Window:CreateTab("🗝️ Get Key", 4483345998)
KeyTab:CreateSection("Verify your account")

local KeyInput = ""

KeyTab:CreateInput({
   Name = "Enter Premium Key",
   PlaceholderText = "Paste key here...",
   Callback = function(Text)
       KeyInput = Text
   end,
})

KeyTab:CreateButton({
   Name = "Check Key",
   Callback = function()
       if KeyInput == "KatovnHub Newb" then -- đổi key tại đây
           Rayfield:Destroy()
           task.wait(0.3)
           loadstring(game:HttpGet("https://raw.githubusercontent.com/KatovnHub/KatovnHub-Beta-3/refs/heads/main/Premium.lua"))()
       else
           Rayfield:Notify({Title="Error", Content="Invalid Key!", Duration=3})
       end
   end,
})

KeyTab:CreateButton({
   Name = "Use Freemium (No Key)",
   Callback = function()
       Rayfield:Destroy()
       task.wait(0.3)
       loadstring(game:HttpGet("https://raw.githubusercontent.com/KatovnHub/KatovnHub-Beta-3/refs/heads/main/Freemium.lua"))()
   end,
})

KeyTab:CreateSection("Support")
KeyTab:CreateButton({
   Name = "Get Key Discord",
   Callback = function()
       setclipboard("https://discord.gg/uTxvVVYBwm")
       Rayfield:Notify({Title="Copied", Content="Discord link copied!", Duration=3})
   end,
})
