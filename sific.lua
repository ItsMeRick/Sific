print(' Siffic - https://github.com/mazk5145/')
local HttpService = game:GetService("HttpService")
local StarterGui = game:GetService("StarterGui")
local LuaName = "Siffic"


_G.Key = "1", "2", "3"
_G.KeyInput = "string"


--* Configuration *--
local initialized = false
local sessionid = ""


StarterGui:SetCore("SendNotification", {
    Title = LuaName,
    Text = " Intializing...",
    Duration = 5
})


--* Application Details *--
Name = "App1" --* Application Name
Ownerid = "PNNfbN1zud" --* OwnerID
APPVersion = "1.0"     --* Application Version

local req = game:HttpGet('https://keyauth.win/api/1.1/?name=' .. Name .. '&ownerid=' .. Ownerid .. '&type=init&ver=' .. APPVersion)

if req == "KeyAuth_Invalid" then 
   print(" Error: Application not found.")

   StarterGui:SetCore("SendNotification", {
	   Title = LuaName,
	   Text = " Error: Application not found.",
	   Duration = 3
   })

   return false
end

local data = HttpService:JSONDecode(req)

if data.success == true then
   initialized = true
   sessionid = data.sessionid
   --print(req)
elseif (data.message == "invalidver") then
   print(" Error: Wrong application version..")

   StarterGui:SetCore("SendNotification", {
	   Title = LuaName,
	   Text = " Error: Wrong application version..",
	   Duration = 3
   })

   return false
else
   print(" Error: " .. data.message)
   return false
end

local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/PDCloud/Pivl-CDN/main/keyauth/robloxUI.lua"))()
local Player = game.Players.localPlayer
local Window = Library.CreateLib("Siffic Loader")

-- Tabs --
local Tab = Window:NewTab("Welcome")
local WelcomeSection = Tab:NewSection("Welcome")

local LoginTab = Window:NewTab("Premium")
local MainSection = LoginTab:NewSection("Login")

local freeTab = Window:NewTab("#free")
local freeSection = freeTab:NewSection("launch")

-- Configuration !! KEEP CLEAR !!--
local Username = ""
local Password = ""

MainSection.NewLabel("Application Details",  "PremiumDetails\nROBLOX_Username: "  ..Player.Name..  "\nNumber of users: " .. data.appinfo.numUsers .. "\nNumber of online users: " .. data.appinfo.numOnlineUsers .. "\n Number of keys: " .. data.appinfo.numKeys .. "\n Application Version: " .. data.appinfo.version)

WelcomeSection:NewLabel("Welcome to siffic " ..Player.Name) 

-- Text Boxes and Login Button --
MainSection:NewTextBox("Username", "Please provide Username.", function(state)
    if state then
        Username = state
    end
end)

MainSection:NewTextBox("Password", "Please provide Password.", function(state)
    if state then
        Password = state
    end
end)

freeSection:NewButton("Siffic", "ButtonInfo", function()
    local Rayfield = loadstring(game:HttpGet('https://raw.githubusercontent.com/shlexware/Rayfield/main/source'))()
    local Player = game.Players.localPlayer
    local Window = Rayfield:CreateWindow({
        Name = "script hub",
        LoadingTitle = "Vibehouse script",
        LoadingSubtitle = "by ItsMeRick#3111",
        ConfigurationSaving = {
           Enabled = true,
           FolderName = Siffic, -- Create a custom folder for your hub/game
           FileName = "Big Hub"
        },
        Discord = {
           Enabled = true,
           Invite = "sGUqSGC5Mz", -- The Discord invite code, do not include discord.gg/. E.g. discord.gg/ABCD would be ABCD.
           RememberJoins = true -- Set this to false to make them join the discord every time they load it up
        },
        KeySystem = true, -- Set this to true to use our key system
        KeySettings = {
           Title = "Sific",
           Subtitle = "Key System",
           Note = "Join the discord (https://discord.gg/sGUqSGC5Mz)",
           FileName = "SificK3y",
           SaveKey = false,
           GrabKeyFromSite = true, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
           Key = ('https://pastebin.com/raw/23pT8ZBZ') 
        }
     })
end)

MainSection:NewButton("Login to Application ?", "Please provide Password.", function(state)
    if Username == "" then
        StarterGui:SetCore("SendNotification", {
            Title = LuaName,
            Text = " Error: Username is empty.",
            Duration = 3
        })
        return false
    end
    if Password == "" then
        StarterGui:SetCore("SendNotification", {
            Title = LuaName,
            Text = " Error: Password is empty.",
            Duration = 3
        })
        return false
    end

    

    local req = game:HttpGet('https://keyauth.win/api/1.1/?name=' .. Name .. '&ownerid=' .. Ownerid .. '&type=login&username=' .. Username .. '&pass=' .. Password ..'&ver=' .. APPVersion .. '&sessionid=' .. sessionid)
    local data = HttpService:JSONDecode(req)
    
    
    if data.success == false then 
        print(" Error: " .. data.message )
    
       StarterGui:SetCore("SendNotification", {
           Title = LuaName,
           Text = " Error: " .. data.message,
           Duration = 5
       })
    
        return false
    end
    
    StarterGui:SetCore("SendNotification", {
        Title = LuaName,
        Text = " Successfully Authorized :)",
        Duration = 5
    })

    Library.Destroy()

    -- Your Code --

    -- Example Code --
    local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/PDCloud/Pivl-CDN/main/keyauth/robloxUI.lua"))()
    local Window = Library.CreateLib("Sific Premium Loader")


    local Tab = Window:NewTab("Dashboard")
    local Dashboard = Tab:NewSection("Dashboard")

    Dashboard.NewLabel("User Data", "Username: " .. data.info.username ..  "\nROBLOX_Username: "  ..Player.Name..  "\nIP Address: " .. data.info.ip .."\nCreated at: " .. data.info.createdate .. "\nLast login at:" .. data.info.lastlogin)
    
    Dashboard:NewButton("launch", "start sific premium", function()
     local Rayfield = loadstring(game:HttpGet('https://raw.githubusercontent.com/shlexware/Rayfield/main/source'))()
     local Player = game.Players.localPlayer
     local Window = Rayfield:CreateWindow({
        Name = "script hub Premium",
        LoadingTitle = "Vibehouse script",
        LoadingSubtitle = "by ItsMeRick#3111",
        ConfigurationSaving = {
           Enabled = true,
           FolderName = Siffic, -- Create a custom folder for your hub/game
           FileName = "Big Hub"
        },
        Discord = {
           Enabled = true,
           Invite = "sGUqSGC5Mz", -- The Discord invite code, do not include discord.gg/. E.g. discord.gg/ABCD would be ABCD.
           RememberJoins = true -- Set this to false to make them join the discord every time they load it up
        },
        KeySystem = false, -- Set this to true to use our key system
        KeySettings = {
           Title = "Sific",
           Subtitle = "Key System",
           Note = "Join the discord (https://discord.gg/sGUqSGC5Mz)",
           FileName = "SificK3y",
           SaveKey = false,
           GrabKeyFromSite = true, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
           Key = ('https://pastebin.com/raw/23pT8ZBZ') 
        }
     })

     local Tab = Window:CreateTab("Welcome", 4483362458) -- Title, Image
     local Label = Tab:CreateLabel("Welcom to the script hub from Vibehouse")
     local Paragraph = Tab:CreateParagraph({Title = "Discord", Content = "https://discord.gg/sGUqSGC5Mz"})
     local Label = Tab:CreateLabel("User Data", "Username: " .. data.info.username .. "\nIP Address: " .. data.info.ip .."\nCreated at: " .. data.info.createdate .. "\nLast login at:" .. data.info.lastlogin)
     local Paragraph = Tab:CreateParagraph({Title = "Terms Of Use", Content = "hi"})






     local Tab = Window:CreateTab("StandAlone", 4483362458) -- Title, Image
     local Button = Tab:CreateButton({
        Name = "Button Example",
        Callback = function()
        -- The function that takes place when the button is pressed
        end,
     })
     
     local Tab = Window:CreateTab("community scripts", 4483362458) -- Title, Image

     
     local Tab = Window:CreateTab("#Ad", 4483362458) -- Title, Image


     local Tab = Window:CreateTab("Game1", 4483362458) -- Title, Image

    end)
end)
