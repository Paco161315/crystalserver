local fugueKill = CreatureEvent("FugueKill")

function fugueKill.onKill(creature, target)
	if not creature:isPlayer() then
		return true
	end

	if target:getName():lower() ~= "fugue" then
		return true
	end

	local player = creature:getPlayer()

	if player:getStorageValue(Storage.Quest.U12_40.TheOrderOfTheLion.KesarMission) == 2 then
		player:setStorageValue(Storage.Quest.U12_40.TheOrderOfTheLion.KesarMission, 3)
	end

	player:setStorageValue(Storage.Quest.U12_40.TheOrderOfTheLion.FugueSpawned, 0)

	return true
end

fugueKill:register()
