local djinnslamp = Action();
function djinnslamp.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if player:getStorageValue(3121990) == 1 then
		toPosition:sendMagicEffect(CONST_ME_POFF)
		return true;
	end

	item:remove(1)
	player:setStorageValue(3121990, 1)
	player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You may now call a Trader Djinn using the !callshop command.")
	player:say("I will grant you whishes.", TALKTYPE_MONSTER_SAY)
	toPosition:sendMagicEffect(CONST_ME_POFF)
	return true
end

djinnslamp:id(3247)
djinnslamp:register()
