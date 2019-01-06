-- an odd way to get the mod name
-- but this is dumb and it hurts my brain theres gotta be a better way scoob
local kModName = string.match(Script.CallStack(), "lua/.*/Framework/Mod_Shared.lua"):gsub("lua/", ""):gsub("/Framework/Mod_Shared.lua", "")

Script.Load("lua/Class.lua")
Script.Load("lua/" .. kModName .. "/Framework/Framework.lua")
Mod:Initialise(kModName)

Mod:PrintDebug("Loading NewTech files", "all")
for i = 1, #Mod.config.modules do
	local path = Mod:FormatDir(Mod.config.modules[i], "NewTech")

	local NewTechFiles = {}
	Shared.GetMatchingFileNames(path, true, NewTechFiles)

	for i = 1, #NewTechFiles do
		Mod:PrintDebug("Loading new tech file: " .. NewTechFiles[i], "all")
	  	Script.Load(NewTechFiles[i])
	end
end

Mod:PrintDebug("NewTech files loaded.", "all")

Mod:PrintDebug("Loading Shared files", "all")

for i = 1, #Mod.config.modules do
	local path = Mod:FormatDir(Mod.config.modules[i], "Shared")

	local SharedFiles = {}
	Shared.GetMatchingFileNames(path, true, SharedFiles)

	for i = 1, #SharedFiles do
		Mod:PrintDebug("Loading shared file: " .. SharedFiles[i], "all")
	  	Script.Load(SharedFiles[i])
	end
end

Mod:PrintDebug("Shared files loaded.", "all")
