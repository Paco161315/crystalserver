local cryptWarriorKill = CreatureEvent("CryptWarriorKill")

function cryptWarriorKill.onKill(creature, target)
	if not creature:isPlayer() then
		return true
	end

	local player = creature:getPlayer()

	if player:getStorageValue(Storage.Quest.U12_40.TheOrderOfTheLion.OnfroiTask) == 1 then
		if target:getName():lower() == "crypt warrior" then
			local kills = player:getStorageValue(Storage.Quest.U12_40.TheOrderOfTheLion.OnfroiKills)
			if kills < 20 then
				player:setStorageValue(Storage.Quest.U12_40.TheOrderOfTheLion.OnfroiKills, kills + 1)
			end
		end
	end

	return true
end

cryptWarriorKill:register()
