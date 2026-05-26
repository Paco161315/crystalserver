local drumeKill = CreatureEvent("DrumeKill")

local areaMin = Position(32358, 32465, 2)
local areaMax = Position(32398, 32485, 2)

function drumeKill.onKill(creature, target)
	if target:getName():lower() ~= "drume" then
		return true
	end

	local spectators = Game.getSpectators(areaMin, false, true, areaMax.x - areaMin.x, 0, areaMax.y - areaMin.y, 0)
	for _, spectator in pairs(spectators) do
		if spectator:isPlayer() then
			if spectator:getStorageValue(Storage.Quest.U12_40.TheOrderOfTheLion.KesarMission) == 4 then
				spectator:setStorageValue(Storage.Quest.U12_40.TheOrderOfTheLion.KesarMission, 5)
			end
		end
	end

	return true
end

drumeKill:register()
