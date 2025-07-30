local config = {
	items = {
		{ id = 35284, charges = 1800 },
		{ id = 35279, charges = 1800 },
		{ id = 35281, charges = 1800 },
		{ id = 35283, charges = 1800 },
		{ id = 35282, charges = 1800 },
		{ id = 35280, charges = 1800 },
		{ id = 44066, charges = 1800 },
		{ id = 50294, charges = 1800 },
	},
	storage = tonumber(Storage.PlayerWeaponReward),
	cooldownDays = 14,
	coinReward = {
		enabled = true,
		amount = 250,
	},
}

local function sendExerciseRewardModal(player)
	local window = ModalWindow({
		title = "Reward Menu",
		message = "Choose a reward",
	})
	for _, it in pairs(config.items) do
		local iType = ItemType(it.id)
		if iType then
			window:addChoice(iType:getName(), function(player, button, choice)
				if button.name ~= "Select" then
					return true
				end

				local inbox = player:getStoreInbox()
				if not inbox or #inbox:getItems() >= inbox:getMaxCapacity() or player:getFreeCapacity() < iType:getWeight() then
					player:sendCancelMessage("You don't have enough capacity or empty slots to receive the reward.")
					return true
				end

				local item = inbox:addItem(it.id, it.charges)
				if not item then
					player:sendCancelMessage("Failed to add the reward.")
					return true
				end

				item:setActionId(IMMOVABLE_ACTION_ID)
				item:setAttribute(ITEM_ATTRIBUTE_STORE, systemTime())

				if config.coinReward.enabled then
					if player.addTibiaCoins then
						player:addTibiaCoins(config.coinReward.amount)
						player:sendTextMessage(MESSAGE_EVENT_ADVANCE, string.format("You have received %d Tibia coins.", config.coinReward.amount))
					else
						player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "The Tibia Coin reward system is currently unavailable.")
					end
				end

				player:sendTextMessage(MESSAGE_EVENT_ADVANCE, string.format("You received a %s with %d charges in your store inbox.", iType:getName(), it.charges))
				player:setStorageValue(config.storage, os.time())
				return true
			end)
		end
	end
	window:addButton("Select")
	window:addButton("Close")
	window:setDefaultEnterButton(0)
	window:setDefaultEscapeButton(1)
	window:sendToPlayer(player)
end

local exerciseRewardModal = TalkAction("!reward")
function exerciseRewardModal.onSay(player, words, param)
	if not configManager.getBoolean(configKeys.TOGGLE_RECEIVE_REWARD) or player:getTown():getId() < TOWNS_LIST.AB_DENDRIEL then
		player:sendCancelMessage("The reward system is currently disabled.")
		return true
	end

	local lastClaimTime = player:getStorageValue(config.storage)
	local currentTime = os.time()
	local cooldownSeconds = config.cooldownDays * 24 * 60 * 60

	if lastClaimTime > 0 and (lastClaimTime + cooldownSeconds) > currentTime then
		local timeRemaining = (lastClaimTime + cooldownSeconds) - currentTime
		local daysLeft = math.floor(timeRemaining / (24 * 60 * 60))
		local hoursLeft = math.floor((timeRemaining % (24 * 60 * 60)) / (60 * 60))
		player:sendCancelMessage(string.format("You can claim another reward in %d days and %d hours.", daysLeft, hoursLeft))
		return true
	end

	sendExerciseRewardModal(player)
	return true
end

exerciseRewardModal:separator(" ")
exerciseRewardModal:groupType("normal")
exerciseRewardModal:register()
