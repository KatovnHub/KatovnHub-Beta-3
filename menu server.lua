--// KATOVN HUB KEY SYSTEM - FULL VERSION
--// by Katovn Team 😎🔥

local Rayfield = loadstring(game:HttpGet("https://sirius.menu/rayfield"))()
local Players = game:GetService("Players")
local HttpService = game:GetService("HttpService")

-- ==============================
-- CONFIG
-- ==============================
local KEY_URL = "https://raw.githubusercontent.com/KatovnHub/KatovnHub-Beta-3/main/keys.txt"
local SAVE_FILE = "KatovnHub_Key.txt"

-- ==============================
-- KEY FUNCTIONS
-- ==============================
local function GetSavedKey()
    if isfile and isfile(SAVE_FILE) then
        return readfile(SAVE_FILE)
    end
    return nil
end

local function SaveKey(key)
    if writefile then
        writefile(SAVE_FILE, key)
    end
end

local function CheckKeyOnline(inputKey)
    local success, data = pcall(function()
        return game:HttpGet(KEY_URL)
    end)

    if not success then
        return false, "❌ Cannot connect to key server"
    end

    for key in string.gmatch(data, "[^\r\n]+") do
        if inputKey == key then
            return true, "✅ Valid Key"
        end
    end

    return false, "❌ Invalid Key"
end

-- ==============================
-- LOAD MENUS
-- ==============================
local function LoadPremium()
    Rayfield:Destroy()
    task.wait(0.3)
    loadstring(game:HttpGet("https://raw.githubusercontent.com/KatovnHub/KatovnHub-Beta-3/main/Premium.lua"))()
end

local function LoadFreemium()
    Rayfield:Destroy()
    task.wait(0.3)
    loadstring(game:HttpGet("https://raw.githubusercontent.com/KatovnHub/KatovnHub-Beta-3/main/Freemium.lua"))()
end

-- ==============================
-- WINDOW
-- ==============================
local Window = Rayfield:CreateWindow({
   Name = "🔑 KatovnHub | Key System",
   LoadingTitle = "Checking Access...",
   LoadingSubtitle = "by Katovn Team",
   ConfigurationSaving = { Enabled = false },
   Theme = "Default"
})

local KeyTab = Window:CreateTab("🗝️ Key System", 4483345998)
KeyTab:CreateSection("🔐 Verify Access")

local StatusLabel = KeyTab:CreateParagraph({
    Title = "Status",
    Content = "⏳ Waiting for key..."
})

local KeyInput = ""

KeyTab:CreateInput({
   Name = "Enter Premium Key",
   PlaceholderText = "Paste key here...",
   RemoveTextAfterFocusLost = false,
   Callback = function(Text)
       KeyInput = Text
   end,
})

-- ==============================
-- AUTO CHECK SAVED KEY
-- ==============================
task.spawn(function()
    local saved = GetSavedKey()
    if saved then
        StatusLabel:Set({
            Title = "Status",
            Content = "🔍 Checking saved key..."
        })

        local ok, msg = CheckKeyOnline(saved)
        task.wait(0.5)

        if ok then
            StatusLabel:Set({
                Title = "Status",
                Content = "✅ Auto login success!"
            })
            SaveKey(saved)
            task.wait(1)
            LoadPremium()
        else
            StatusLabel:Set({
                Title = "Status",
                Content = "❌ Saved key invalid"
            })
        end
    end
end)

-- ==============================
-- CHECK KEY BUTTON
-- ==============================
KeyTab:CreateButton({
   Name = "✅ Check Key",
   Callback = function()
       if KeyInput == "" then
           Rayfield:Notify({Title="Error",Content="Enter a key first!",Duration=3})
           return
       end

       StatusLabel:Set({
           Title = "Status",
           Content = "🔍 Checking key..."
       })

       local ok, msg = CheckKeyOnline(KeyInput)

       if ok then
           StatusLabel:Set({
               Title = "Status",
               Content = "✅ Key accepted! Loading Premium..."
           })
           SaveKey(KeyInput)
           task.wait(1)
           LoadPremium()
       else
           StatusLabel:Set({
               Title = "Status",
               Content = msg
           })
           Rayfield:Notify({Title="Key System",Content=msg,Duration=3})
       end
   end,
})

-- ==============================
-- FREEMIUM BUTTON
-- ==============================
KeyTab:CreateButton({
   Name = "▶ Use Freemium (No Key)",
   Callback = function()
       StatusLabel:Set({
           Title = "Status",
           Content = "ℹ Loading Freemium..."
       })
       task.wait(0.5)
       LoadFreemium()
   end,
})

-- ==============================
-- SUPPORT
-- ==============================
KeyTab:CreateSection("💬 Support")

KeyTab:CreateButton({
   Name = "🔗 Copy Discord",
   Callback = function()
       setclipboard("https://discord.gg/uTxvVVYBwm")
       Rayfield:Notify({Title="Copied",Content="Discord link copied!",Duration=3})
   end,
})

Rayfield:Notify({
   Title = "KatovnHub",
   Content = "Key System Loaded!",
   Duration = 4
})
