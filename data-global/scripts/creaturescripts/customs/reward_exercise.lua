local winReward = CreatureEvent("WinReward")

function winReward.onLogin(player)
	if configManager.getBoolean(configKeys.TOGGLE_RECEIVE_REWARD) and player:getTown():getId() >= TOWNS_LIST.AB_DENDRIEL then
		-- check user won exercise weapon and send message
		if player:getStorageValue(tonumber(Storage.PlayerWeaponReward)) ~= 1 then
			player:sendTextMessage(MESSAGE_LOGIN, "Use !reward command everday to receive an exercise weapon and non-transferable Tibia Coins. It's Free!")
		end
	end
	return true
end

if configManager.getBoolean(configKeys.TOGGLE_RECEIVE_REWARD) then
	winReward:register()
end
