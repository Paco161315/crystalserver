local RAID_STORAGE = 120226
local waveEvent = nil

local spawnArea = {
	from = Position(32438, 32231, 7),
	to = Position(32442, 32238, 7),
}

local function spawnStableHorses()
	local horsesToSpawn = {
		{ name = "Horse", amount = 3 },
		{ name = "Grey Horse", amount = 1 },
		{ name = "Brown Horse", amount = 2 },
	}

	for _, horseInfo in ipairs(horsesToSpawn) do
		for i = 1, horseInfo.amount do
			local spawnPos = Position(math.random(spawnArea.from.x, spawnArea.to.x), math.random(spawnArea.from.y, spawnArea.to.y), spawnArea.from.z)
			Game.createMonster(horseInfo.name, spawnPos, true, true)
		end
	end
end

local horseStable = MoveEvent()

function horseStable.onStepIn(creature, item, position, fromPosition)
	if not creature:isMonster() then
		return true
	end

	if creature:getName() == "Horse" or creature:getName() == "Grey Horse" or creature:getName() == "Brown Horse" or creature:getName() == "Wild Horse" then
		creature:remove()

		local currentStorage = Game.getStorageValue(RAID_STORAGE) or 0

		if currentStorage > os.time() then
			if math.random(30) == 1 then
				Game.setStorageValue(RAID_STORAGE, 0)
				if waveEvent then
					stopEvent(waveEvent)
					waveEvent = nil
				end
				spawnStableHorses()
				position:sendMagicEffect(CONST_ME_POFF)
				Game.broadcastMessage("The wild horses have been calmed down and returned to the stable!", MESSAGE_STATUS_WARNING)
			else
				position:sendMagicEffect(CONST_ME_POFF)
			end
		else
			position:sendMagicEffect(CONST_ME_POFF)
		end
	end
	return true
end

horseStable:type("stepin")
horseStable:id(31159)
horseStable:register()
