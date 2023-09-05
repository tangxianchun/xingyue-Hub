local supported_games = {
	["3398014311"] = {
		["name"] = "Restaurant Tycoon 2",
		["script_url"] = "https://raw.githubusercontent.com/iz037/Zeld-Hub/main/Script/Restaurant%20Tycoon%202.lua"
			},
	["3411100258"] = {
		["name"] = "prtty much ervy bordr gam evr",
		["script_url"] = "https://raw.githubusercontent.com/iz037/Zeld-Hub/main/Script/prtty%20much%20evry%20bordr%20gam%20evr.lua"
			},
	["7305309231"] = {
		["name"] = "Taxi Boss",
		["script_url"] = "https://raw.githubusercontent.com/iz037/Zeld-Hub/main/Script/Taxi%20Boss.lua"
                        },
	["4954096313"] = {
		["name"] = "Field Trip Z",
		["script_url"] = "https://raw.githubusercontent.com/iz037/Zeld-Hub/main/Script/Field%20Trip%20Z.lua"
			},
	["6441847031"] = {
		["name"] = "Chaos",
		["script_url"] = "https://raw.githubusercontent.com/iz037/Zeld-Hub/main/Script/Chaos.lua",
	}
}
local supported_script = nil;
local closing_loader = false;

for _,v in pairs(game:GetService("CoreGui"):GetDescendants()) do
	if v:IsA('StringValue') and tostring(v.Name) == "zeld_hub" then
		v.Parent:Destroy();
	end
end

local gui = Instance.new("ScreenGui", game:GetService("CoreGui"));
gui.Enabled = true;
gui.ResetOnSpawn = false;
gui.DisplayOrder = 5;
gui.ZIndexBehavior = Enum.ZIndexBehavior.Global;
gui.Name = "zeld_hub_loader";

local str_v = Instance.new("StringValue", gui);
str_v.Name = "zeld_hub";

local main_frame = Instance.new("Frame", gui);
main_frame.BackgroundTransparency = 1;
main_frame.BackgroundColor3 = Color3.fromRGB(34, 34, 34);
main_frame.BorderSizePixel = 0;
main_frame.Name = "Main";
main_frame.Size = UDim2.new(0.19, 0, 0.275, 0);
main_frame.Position = UDim2.new(0.405, 0, 0.5, 0);
main_frame.Visible = false;
main_frame.ZIndex = 2;

local ui_c = Instance.new("UICorner", main_frame);
ui_c.CornerRadius = UDim.new(0, 8);

local shadow = Instance.new("Frame", main_frame);
shadow.BackgroundTransparency = 1;
shadow.BackgroundColor3 = Color3.fromRGB(29, 29, 29);
shadow.BorderSizePixel = 0;
shadow.Name = "Shadow";
shadow.Size = UDim2.new(1, 0, 1.028, 0);
shadow.Position = UDim2.new(0, 0, 0, 0);
shadow.Visible = false;
shadow.ZIndex = 1;

local ui_c2 = Instance.new("UICorner", shadow);
ui_c2.CornerRadius = UDim.new(0, 8);

local title = Instance.new("TextLabel", main_frame);
title.Active = false;
title.BackgroundTransparency = 1;
title.BorderSizePixel = 0;
title.Name = "title";
title.Font = Enum.Font.GothamSemibold;
title.TextColor3 = Color3.fromRGB(255, 255, 255);
title.TextScaled = true;
title.TextStrokeTransparency = 1;
title.TextTransparency = 1;
title.Text = "zeld hub";
title.Size = UDim2.new(0.955, 0, 0.075, 0);
title.Position = UDim2.new(0.023, 0, 0.027, 0);
title.ZIndex = 2;

local text_1 = Instance.new("TextLabel", main_frame);
text_1.Active = false;
text_1.BackgroundTransparency = 1;
text_1.BorderSizePixel = 0;
text_1.Name = "1";
text_1.Font = Enum.Font.GothamSemibold;
text_1.TextColor3 = Color3.fromRGB(255, 255, 255);
text_1.TextScaled = true;
text_1.TextStrokeTransparency = 1;
text_1.TextTransparency = 1;
text_1.Text = "Zeld Hub";
text_1.Size = UDim2.new(0.955, 0, 0.092, 0);
text_1.Position = UDim2.new(0.023, 0, 0.393, 0);
text_1.ZIndex = 2;

local text_2 = Instance.new("TextLabel", main_frame);
text_2.Active = false;
text_2.BackgroundTransparency = 1;
text_2.BorderSizePixel = 0;
text_2.Name = "2";
text_2.Font = Enum.Font.GothamSemibold;
text_2.TextColor3 = Color3.fromRGB(181, 181, 181);
text_2.TextScaled = true;
text_2.TextStrokeTransparency = 1;
text_2.TextTransparency = 1;
text_2.Text = "Executing...";
text_2.Size = UDim2.new(0.955, 0, 0.081, 0);
text_2.Position = UDim2.new(0.023, 0, 0.522, 0);
text_2.ZIndex = 2;

local game_name = Instance.new("TextLabel", main_frame);
game_name.Active = false;
game_name.BackgroundTransparency = 1;
game_name.BorderSizePixel = 0;
game_name.Name = "game_name";
game_name.Font = Enum.Font.GothamSemibold;
game_name.TextColor3 = Color3.fromRGB(255, 255, 255);
game_name.TextScaled = true;
game_name.TextStrokeTransparency = 1;
game_name.TextTransparency = 1;
game_name.Text = "...";
game_name.Size = UDim2.new(0.955, 0, 0.075, 0);
game_name.Position = UDim2.new(0.021, 0, 0.9, 0);
game_name.ZIndex = 2;

spawn(function()
	if supported_games[tostring(game.PlaceId)] ~= nil then
		game_name.Text = supported_games[tostring(game.PlaceId)]["name"];
	elseif supported_games[tostring(game.PlaceId)] == nil then
		text_1.Text = "Couldn't find your game!"
		text_2.Text = "Closing loader...";
		game_name.Text = "...";
	end
end)

local text_anim = coroutine.resume(coroutine.create(function()
	while wait(1) do
		if closing_loader then coroutine.yield(); end
		
		if text_2.Text == "Executing" then
			text_2.Text = "Executing.";
		elseif text_2.Text == "Executing." then
			text_2.Text = "Executing..";
		elseif text_2.Text == "Executing.." then
			text_2.Text = "Executing...";
		elseif text_2.Text == "Executing..." then
			text_2.Text = "Executing";
		elseif text_2.Text == "Closing loader" then
			text_2.Text = "Closing loader.";
		elseif text_2.Text == "Closing loader." then
			text_2.Text = "Closing loader..";
		elseif text_2.Text == "Closing loader.." then
			text_2.Text = "Closing loader...";
		elseif text_2.Text == "Closing loader..." then
			text_2.Text = "Closing loader";
		end
	end
end))

pcall(function()
	main_frame.Visible = true;
	shadow.Visible = true;
	local tween1 = game:GetService("TweenService"):Create(main_frame, TweenInfo.new(0.65, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {BackgroundTransparency = 0});
	local tween2 = game:GetService("TweenService"):Create(shadow, TweenInfo.new(0.65, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {BackgroundTransparency = 0});
	local tween3 = game:GetService("TweenService"):Create(title, TweenInfo.new(0.65, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {TextTransparency = 0});
	local tween4 = game:GetService("TweenService"):Create(text_1, TweenInfo.new(0.65, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {TextTransparency = 0});
	local tween5 = game:GetService("TweenService"):Create(text_2, TweenInfo.new(0.65, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {TextTransparency = 0});
	local tween6 = game:GetService("TweenService"):Create(game_name, TweenInfo.new(0.65, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {TextTransparency = 0});
	main_frame:TweenPosition(UDim2.new(0.405, 0, 0.362, 0), Enum.EasingDirection.InOut, Enum.EasingStyle.Sine, 0.65, true, nil);
	tween1:Play();
	tween2:Play();
	tween3:Play();
	tween4:Play();
	tween5:Play();
	tween6:Play();
end)

pcall(function()
	local tween1 = game:GetService("TweenService"):Create(main_frame, TweenInfo.new(0.65, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {BackgroundTransparency = 1}); 
	local tween2 = game:GetService("TweenService"):Create(shadow, TweenInfo.new(0.65, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {BackgroundTransparency = 1}); 
	local tween3 = game:GetService("TweenService"):Create(title, TweenInfo.new(0.65, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {TextTransparency = 1});
	local tween4 = game:GetService("TweenService"):Create(text_1, TweenInfo.new(0.65, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {TextTransparency = 1});
	local tween5 = game:GetService("TweenService"):Create(text_2, TweenInfo.new(0.65, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {TextTransparency = 1});
	local tween6 = game:GetService("TweenService"):Create(game_name, TweenInfo.new(0.65, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {TextTransparency = 1});
	wait(5);
	main_frame:TweenPosition(UDim2.new(0.405, 0, 0.5, 0), Enum.EasingDirection.InOut, Enum.EasingStyle.Sine, 0.65, true, nil);
	tween1:Play();
	tween2:Play();
	tween3:Play();
	tween4:Play();
	tween5:Play();
	tween6:Play();
	closing_loader = true;
	wait(1);
	gui:Destroy();
	if supported_games[tostring(game.PlaceId)] ~= nil then
		loadstring(game:HttpGet((tostring(supported_games[tostring(game.PlaceId)]["script_url"]))))();
	end
end)
