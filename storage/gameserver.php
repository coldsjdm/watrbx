<?php
    header("Content-type: text/plain");
    include_once(baseurl . "/config.php");
    
    if(isset($_GET["key"])){
        if(!$_GET["key"] == arbiterKeySite){
            die("");
        }
    } else {
        die();
    }
    
    $port = $_GET['port'] ?? 53640;
    $place = $_GET['pid'] ?? 1;
?>

function start(placeId, port, url)

apikey = "<?=rccapikey?>"

------------------- UTILITY FUNCTIONS --------------------------


function waitForChild(parent, childName)
	while true do
		local child = parent:findFirstChild(childName)
		if child then
			return child
		end
		parent.ChildAdded:wait()
	end
end

-----------------------------------END UTILITY FUNCTIONS -------------------------

-----------------------------------"CUSTOM" SHARED CODE----------------------------------

pcall(function() settings().Network.UseInstancePacketCache = true end)
pcall(function() settings().Network.UsePhysicsPacketCache = true end)
--pcall(function() settings()["Task Scheduler"].PriorityMethod = Enum.PriorityMethod.FIFO end)
pcall(function() settings()["Task Scheduler"].PriorityMethod = Enum.PriorityMethod.AccumulatedError end)

--settings().Network.PhysicsSend = 1 -- 1==RoundRobin
--settings().Network.PhysicsSend = Enum.PhysicsSendMethod.ErrorComputation2
settings().Network.PhysicsSend = Enum.PhysicsSendMethod.TopNErrors
settings().Network.ExperimentalPhysicsEnabled = true
settings().Network.WaitingForCharacterLogRate = 100
pcall(function() settings().Diagnostics:LegacyScriptMode() end)

-----------------------------------START GAME SHARED SCRIPT------------------------------

local assetId = placeId -- might be able to remove this now
local UserInputService = game:GetService('UserInputService')

local scriptContext = game:GetService('ScriptContext')
pcall(function() scriptContext:AddStarterScript(37801172) end)
scriptContext.ScriptsDisabled = true

game:SetPlaceID(placeId, false)
game:GetService("ChangeHistoryService"):SetEnabled(false)

-- establish this peer as the Server
local ns = game:GetService("NetworkServer")

pcall(function() game:GetService("NetworkServer"):SetIsPlayerAuthenticationRequired(true) end)

if url~=nil then
	pcall(function() game:GetService("Players"):SetAbuseReportUrl(url .. "/AbuseReport/InGameChatHandler.ashx") end)
	pcall(function() game:GetService("ScriptInformationProvider"):SetAssetUrl(url .. "/asset/") end)
	pcall(function() game:GetService("ContentProvider"):SetBaseUrl(url .. "/") end)
	pcall(function() game:GetService("Players"):SetChatFilterUrl(url .. "/Game/ChatFilter.ashx") end)
	pcall(function() game:GetService("Players"):SetSysStatsUrl(url .. "/report/systats/?apikey=" .. apikey) end)
	



	game:GetService("BadgeService"):SetPlaceId(placeId)

	game:GetService("BadgeService"):SetIsBadgeLegalUrl("")
	game:GetService("InsertService"):SetBaseSetsUrl(url .. "/game/Tools/InsertAsset.ashx?nsets=10&type=base")
	game:GetService("InsertService"):SetUserSetsUrl(url .. "/game/Tools/InsertAsset.ashx?nsets=20&type=user&userid=%d")
	game:GetService("InsertService"):SetCollectionUrl(url .. "/game/Tools/InsertAsset.ashx?sid=%d")
	game:GetService("InsertService"):SetAssetUrl(url .. "/asset/?id=%d")
	game:GetService("InsertService"):SetAssetVersionUrl(url .. "/asset/?assetversionid=%d")
	
	pcall(function() game:HttpGet(url .. "/game/LoadPlaceInfo.ashx?PlaceId=" .. placeId)() end)
	
	-- pcall(function() 
	--			if access then
	--				game:HttpGet(url .. "/game/PlaceSpecificScript.ashx?PlaceId=" .. placeId .. "&" .. access)()
	--			end
	--		end)
end

pcall(function() game:GetService("NetworkServer"):SetIsPlayerAuthenticationRequired(false) end)
settings().Diagnostics.LuaRamLimit = 0
--settings().Network:SetThroughputSensitivity(0.08, 0.01)
--settings().Network.SendRate = 35
--settings().Network.PhysicsSend = 0  -- 1==RoundRobin


game:GetService("Players").PlayerAdded:connect(function(player)
    print("Player " .. player.userId .. " added")
player.CharacterAdded:connect(function(c)
    game:GetObjects("rbxasset://fonts/characterCameraScript.rbxmx")[1].Parent = c
    game:GetObjects("rbxasset://fonts/characterControlScript.rbxmx")[1].Parent = c
    for i,v in pairs(c:GetChildren()) do
    end
    end)
end)

game:GetService("Players").PlayerRemoving:connect(function(player)
	print("Player " .. player.userId .. " leaving")
end)

if placeId~=nil and url~=nil then
	-- yield so that file load happens in the heartbeat thread
	wait()
	
	-- load the game
	game:Load(url .. "/asset/?id=" .. placeId .. "=" .. apikey)
end

-- Now start the connection
ns:Start(port) 


scriptContext:SetTimeout(10)
scriptContext.ScriptsDisabled = false



------------------------------END START GAME SHARED SCRIPT--------------------------
function onChatted(msg, speaker)
    
    source = string.lower(speaker.Name)
    msg = string.lower(msg)
    -- Note: This one is NOT caps sensitive

    if msg == ";ec" then
	local sound = Instance.new("Sound")
    	sound.SoundId = "http://www.www.watrbx.xyz/asset/?id=47"
    	sound.Parent = speaker.Character.Torso
    	sound.Volume = 0.5
    	sound:Play()
        speaker.Character.Humanoid.Health = 0
    end

    if msg == ";kick" then
	    speaker:Kick("GE-")
    end

    if msg == ";sit" then
		speaker.Character.Humanoid.Jump = true
        speaker.Character.Humanoid.Sit = true
    end
end

function onPlayerEntered(newPlayer)
        newPlayer.Chatted:connect(function(msg) onChatted(msg, newPlayer) end) 
end
 
game.Players.ChildAdded:connect(onPlayerEntered)


game:GetService("Players").PlayerAdded:connect(function(player)
	print("Player " .. player.userId .. " added")
	connecturl = "https://www.watrbx.xyz/matchmake/clientupdate?action=connect=" .. placeId .. "=" .. apikey .. "=" .. player.userId .. "=" .. jobid
	game:HttpGet(connecturl)
end)

game:GetService("Players").PlayerRemoving:connect(function(player)
	print("Player " .. player.userId .. " leaving")	
	disconnecturl = "https://www.watrbx.xyz/matchmake/clientupdate?action=disconnect=" .. placeId .. "=" .. apikey .. "=" .. player.userId .. "=" .. jobid
	game:HttpGet(disconnecturl)
end)


-- StartGame -- 
game:GetService("RunService"):Run()
game:HttpGet("https://www.watrbx.xyz/matchmake/serverstart?jobid=" .. jobid .. "apikey=" .. apikey)




end

start(<?=$place?>, <?=$port?>, "https://www.watrbx.xyz")

while wait(30) do
    if #game:GetService("Players"):GetPlayers() == 0 then
        game:HttpGet("https://www.watrbx.xyz/matchmake/serverend?jobid=" .. jobid .. "apikey=" .. apikey)
    end
end