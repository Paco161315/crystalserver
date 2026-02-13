local spawnArea = {
	from = Position(32438, 32231, 7),
	to = Position(32442, 32238, 7),
}

local RAID_STORAGE = 120226

local function spawnStartupHorses()
	if Game.getStorageValue(RAID_STORAGE) > os.time() then
		return
	end

	local horsesToSpawn = {
		{ name = "Horse", amount = 3 },
		{ name = "Grey Horse", amount = 1 },
		{ name = "Brown Horse", amount = 2 },
	}

	for _, horseInfo in ipairs(horsesToSpawn) do
		for i = 1, horseInfo.amount do
			local x = math.random(spawnArea.from.x, spawnArea.to.x)
			local y = math.random(spawnArea.from.y, spawnArea.to.y)
			local spawnPos = Position(x, y, spawnArea.from.z)
			Game.createMonster(horseInfo.name, spawnPos, true, true)
		end
	end
end

local horseStartup = GlobalEvent("HorseStartup")
function horseStartup.onStartup()
	spawnStartupHorses()
	return true
end

horseStartup:register()
