local config = {
	items = {
		{ id = 28557, charges = 250 },
		{ id = 28556, charges = 250 },
		{ id = 28555, charges = 250 },
		{ id = 28554, charges = 250 },
		{ id = 28553, charges = 250 },
		{ id = 28552, charges = 250 },
		{ id = 44065, charges = 250 },
		{ id = 50293, charges = 250 },
	},
	storage = 67891, -- Character cooldown storage
	accountStorage = 67890, -- Account lock storage
	cooldownDays = 1,
	coinReward = {
		enabled = true,
		amount = 15,
	},
}

local function sendExerciseRewardModal(player)
	local window = ModalWindow({
		title = "Reward Menu",
		message = "Choose a Reward",
	})

	for _, it in pairs(config.items) do
		local iType = ItemType(it.id)
		if iType then
			window:addChoice(iType:getName(), function(player, button, choice)
				if button.name ~= "Select" then
					return true
				end

				-- Inventory checks
				local inbox = player:getStoreInbox()
				if not inbox or #inbox:getItems() >= inbox:getMaxCapacity() or player:getFreeCapacity() < iType:getWeight() then
					player:sendCancelMessage("You don't have enough capacity or empty slots to receive the reward.")
					return true
				end

				-- Add item
				local item = inbox:addItem(it.id, it.charges)
				if not item then
					player:sendCancelMessage("Failed to add the reward.")
					return true
				end

				item:setActionId(IMMOVABLE_ACTION_ID)
				item:setAttribute(ITEM_ATTRIBUTE_STORE, systemTime())

				-- Account lock
				if config.coinReward.enabled then
					if Player.getAccountStorage(player, config.accountStorage, true) < 1 then
						player:addTibiaCoins(config.coinReward.amount)
						player:sendTextMessage(MESSAGE_EVENT_ADVANCE, string.format("You received %d Tibia Coins.", config.coinReward.amount))

						-- Permanent account lock
						player:setStorageValue(config.accountStorage, 1)
					else
						player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You already claimed your Tibia Coins reward.")
					end
				end

				player:sendTextMessage(MESSAGE_EVENT_ADVANCE, string.format("You received a %s with %d charges.", iType:getName(), it.charges))
				player:setStorageValue(config.storage, os.time()) -- Character cooldown
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

	-- Character cooldown check (for items only)
	local lastClaimTime = player:getStorageValue(config.storage)
	local currentTime = os.time()
	local cooldownSeconds = config.cooldownDays * 24 * 60 * 60

	if lastClaimTime > 0 and (currentTime - lastClaimTime) < cooldownSeconds then
		local remaining = cooldownSeconds - (currentTime - lastClaimTime)
		local hoursLeft = math.ceil(remaining / 3600)
		player:sendCancelMessage(string.format("You can claim another reward in %d hours.", hoursLeft))
		return true
	end

	sendExerciseRewardModal(player)
	return true
end

exerciseRewardModal:separator(" ")
exerciseRewardModal:groupType("normal")
exerciseRewardModal:register()
