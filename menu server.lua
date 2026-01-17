local Rayfield = loadstring(game:HttpGet("https://sirius.menu/rayfield"))()
local HttpService = game:GetService("HttpService")

-- Config
local KEY_URL = "https://raw.githubusercontent.com/KatovnHub/KatovnHub-Beta-3/main/keys.txt"
local SAVE_FILE = "KatovnHub_Key.json"

-- Save / Load Key
local function SaveKey(key)
    if writefile then
        writefile(SAVE_FILE, HttpService:JSONEncode({Key = key}))
    end
end

local function LoadKey()
    if readfile and isfile and isfile(SAVE_FILE) then
        local data = HttpService:JSONDecode(readfile(SAVE_FILE))
        return data.Key
    end
    return nil
end

-- Online key check
local function IsKeyValid(inputKey)
    local success, result = pcall(function()
        return game:HttpGet(KEY_URL)
    end)
    if not success then
        return false, "Cannot connect to key server"
    end

    for key in string.gmatch(result, "[^\r\n]+") do
        if key == inputKey then
            return true
        end
    end
    return false, "Invalid key"
end

-- Load menus
local function LoadPremium()
    Rayfield:Destroy()
    task.wait(0.5)
    loadstring(game:HttpGet("https://raw.githubusercontent.com/KatovnHub/KatovnHub-Beta-3/main/Premium.lua"))()
end

local function LoadFree()
    Rayfield:Destroy()
    task.wait(0.5)
    loadstring(game:HttpGet("https://raw.githubusercontent.com/KatovnHub/KatovnHub-Beta-3/main/Freemium.lua"))()
end

-- Auto login if saved key valid
local savedKey = LoadKey()
if savedKey then
    local ok = IsKeyValid(savedKey)
    if ok then
        LoadPremium()
        return
    end
end

-- UI Key System
local Window = Rayfield:CreateWindow({
    Name = "🔑 KatovnHub | Key System",
    Icon = 115055477301086, -- logo của bro
    LoadingTitle = "KatovnHub",
    LoadingSubtitle = "Enter your key",
    Theme = "Default",
    ConfigurationSaving = { Enabled = false }
})

-- Key tab
local KeyTab = Window:CreateTab("🗝 Key System", 4483345998)

KeyTab:CreateSection("Verify Premium Key")

local Status = KeyTab:CreateParagraph({
    Title = "Status",
    Content = "Waiting for key..."
})

local InputKey = ""

KeyTab:CreateInput({
    Name = "Enter Key",
    PlaceholderText = "Paste your key here",
    RemoveTextAfterFocusLost = false,
    Callback = function(text)
        InputKey = text
    end,
})

KeyTab:CreateButton({
    Name = "✅ Check Key",
    Callback = function()
        Status:Set({Title="Status",Content="Checking key..."})
        local valid, msg = IsKeyValid(InputKey)
        if valid then
            Status:Set({Title="Status",Content="✅ Premium Activated"})
            SaveKey(InputKey)
            task.wait(0.5)
            LoadPremium()
        else
            Status:Set({Title="Status",Content="❌ "..msg})
        end
    end,
})

KeyTab:CreateButton({
    Name = "▶ Use Freemium",
    Callback = function()
        LoadFree()
    end,
})

-- Support
KeyTab:CreateSection("Support")
KeyTab:CreateButton({
    Name = "💬 Join Discord (Get Key)",
    Callback = function()
        setclipboard("https://discord.gg/WrnvdHtQXn")
        Rayfield:Notify({
            Title = "Discord",
            Content = "Discord link copied!",
            Duration = 3
        })
    end
})
