local deerKill = CreatureEvent("DeerKill")

function deerKill.onKill(creature, target)
	if not creature:isPlayer() then
		return true
	end

	local player = creature:getPlayer()

	if player:getStorageValue(Storage.Quest.U12_40.TheOrderOfTheLion.DalTask) == 1 then
		if target:getName():lower() == "deer" then
			local kills = player:getStorageValue(Storage.Quest.U12_40.TheOrderOfTheLion.DalKills)
			if kills < 20 then
				player:setStorageValue(Storage.Quest.U12_40.TheOrderOfTheLion.DalKills, kills + 1)
			end
		end
	end

	return true
end

deerKill:register()