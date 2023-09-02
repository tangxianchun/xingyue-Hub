local chiefInstantCook = true
local npcReach = true
local Client = game.Players.LocalPlayer
local PS = Client.PlayerScripts
local Module = require(PS.ClientMain.Replications.Workers.WalkDummy)
local Worker = require(PS.CookingNew.WorkerComponents.WorkerDefault)
local M1 = require(PS.ClientMain.Replications.Customers.GetNPCFolder)
if npcReach then
hookfunction(Module,function()
return task.wait()
end)
end
if chiefInstantCook then
Worker.event = function(...)
local args = {...}
local npc = M1.GetNPCFolder(args[1]).ClientWorkers:FindFirstChild(args[2])
local M2 = game.ReplicatedStorage.MiscModules.CookingSharedCharacter:FindFirstChild(args[4])
if M2 then
require(M2).finishInteract(npc,args[3],args[4])
end
return
end
end
