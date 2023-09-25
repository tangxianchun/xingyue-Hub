setclipboard("https://discord.gg/FJFZMCu5JX")
repeat wait() until game:IsLoaded()

if game.PlaceId == 3398014311 then
    loadstring(game:HttpGet("https://raw.githubusercontent.com/iz037/Zeld-Hub/main/Script/Restaurant%20Tycoon%202.lua"))()
elseif game.PlaceId == 3411100258 then
    loadstring(game:HttpGet("https://raw.githubusercontent.com/iz037/Zeld-Hub/main/Script/prtty%20much%20evry%20bordr%20gam%20evr.lua"))()
elseif game.PlaceId == 7305309231 then
    loadstring(game:HttpGet("https://raw.githubusercontent.com/iz037/Zeld-Hub/main/Script/Taxi%20Boss.lua"))()
elseif game.PlaceId == 5096191125 then 
    loadstring(game:HttpGet("https://raw.githubusercontent.com/iz037/Zeld-Hub/main/Script/Field%20Trip%20Z.lua"))()
elseif game.PlaceId == 6441847031 then
    loadstring(game:HttpGet("https://raw.githubusercontent.com/iz037/Zeld-Hub/main/Script/Chaos.lua"))()
elseif game.PlaceId == 13772394625 then
    loadstring(game:HttpGet("https://raw.githubusercontent.com/iz037/Zeld-Hub/main/Script/Blade%20Ball.lua"))()
elseif game.PlaceId == 14732610803 then
    loadstring(game:HttpGet("https://raw.githubusercontent.com/iz037/Zeld-Hub/main/Script/Blade%20Ball.lua"))()
elseif game.PlaceId == 14795754298 then
    loadstring(game:HttpGet("https://raw.githubusercontent.com/iz037/Zeld-Hub/main/Script/The%20Russian%20Sleep%20Experiment.lua"))()
else

    game:GetService("StarterGui"):SetCore("SendNotification",
        {
            Title = "Game is not supported!",
            Text = "Use one of the game specific loadstrings in the discord! \n(Copied discord invite to clipboard)",
            Icon = "rbxassetid://12614663538"
        })
end
