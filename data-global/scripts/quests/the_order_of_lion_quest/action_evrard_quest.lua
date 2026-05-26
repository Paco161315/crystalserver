local reward = {
	[47404] = 635,  -- parchment
	[47405] = 2822, -- map
}

local evrardItems = Action()

function evrardItems.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if player:getStorageValue(item.uid) ~= 1 then
		player:addItem(reward[item.uid], 1)
		player:setStorageValue(item.uid, 1)
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have found a " .. ItemType(reward[item.uid]):getName() .. ".")
	else
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "The chest is empty.")
	end
	return true
end

for uniqueId, _ in pairs(reward) do
	evrardItems:uid(uniqueId)
end

evrardItems:register()