local Rayfield = loadstring(game:HttpGet("https://sirius.menu/rayfield"))()

-- =========================
-- SERVICES
-- =========================
local HttpService = game:GetService("HttpService")

-- =========================
-- CONFIG
-- =========================
local KEY_URL = "https://raw.githubusercontent.com/KatovnHub/KatovnHub-Beta-3/main/keys.txt"
local SAVE_FILE = "KatovnHub_Key.json"

-- =========================
-- SAVE / LOAD KEY
-- =========================
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

-- =========================
-- CHECK KEY ONLINE
-- =========================
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

-- =========================
-- LOAD HUB
-- =========================
local function LoadPremium()
	Rayfield:Destroy()
	task.wait(0.3)
	loadstring(game:HttpGet("https://raw.githubusercontent.com/KatovnHub/KatovnHub-Beta-3/main/Premium.lua"))()
end

local function LoadFree()
	Rayfield:Destroy()
	task.wait(0.3)
	loadstring(game:HttpGet("https://raw.githubusercontent.com/KatovnHub/KatovnHub-Beta-3/main/Freemium.lua"))()
end

-- =========================
-- AUTO LOGIN
-- =========================
local savedKey = LoadKey()
if savedKey then
	local ok = IsKeyValid(savedKey)
	if ok then
		LoadPremium()
		return
	end
end

-- =========================
-- UI
-- =========================
local Window = Rayfield:CreateWindow({
	Name = "🔑 KatovnHub | Key System",
	LoadingTitle = "KatovnHub",
	LoadingSubtitle = "Checking Access...",
	ConfigurationSaving = {
		Enabled = false
	}
})

local KeyTab = Window:CreateTab("🗝 Key System", 4483345998)
KeyTab:CreateSection("Enter Premium Key")

local Status = KeyTab:CreateParagraph({
	Title = "Status",
	Content = "Waiting for key..."
})

local InputKey = ""

KeyTab:CreateInput({
	Name = "Enter Key",
	PlaceholderText = "Paste your key here",
	RemoveTextAfterFocusLost = false,
	Callback = function(Text)
		InputKey = Text
	end,
})

KeyTab:CreateButton({
	Name = "✅ Check Key",
	Callback = function()
		Status:Set({Title = "Status", Content = "Checking key..."})

		local valid, msg = IsKeyValid(InputKey)

		if valid then
			Status:Set({Title = "Status", Content = "✅ Premium Activated"})
			SaveKey(InputKey)
			task.wait(0.5)
			LoadPremium()
		else
			Status:Set({Title = "Status", Content = "❌ "..msg})
		end
	end,
})

KeyTab:CreateButton({
	Name = "▶ Use Freemium",
	Callback = function()
		LoadFree()
	end,
})

KeyTab:CreateSection("Support")

KeyTab:CreateButton({
	Name = "💬 Join Discord (Get Key)",
	Callback = function()
		setclipboard("https://discord.gg/WrnvdHtQXn")
		Rayfield:Notify({
			Title = "Discord",
			Content = "Link copied to clipboard!",
			Duration = 3
		})
	end,
})
