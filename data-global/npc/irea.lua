local internalNpcName = "Irea"
local npcType = Game.createNpcType(internalNpcName)
local npcConfig = {}

npcConfig.name = internalNpcName
npcConfig.description = internalNpcName

npcConfig.health = 100
npcConfig.maxHealth = npcConfig.health
npcConfig.walkInterval = 2000
npcConfig.walkRadius = 2

npcConfig.outfit = {
	lookType = 64,
}

npcConfig.flags = {
	floorchange = false,
}

local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)

npcType.onThink = function(npc, interval)
	npcHandler:onThink(npc, interval)
end

npcType.onAppear = function(npc, creature)
	npcHandler:onAppear(npc, creature)
end

npcType.onDisappear = function(npc, creature)
	npcHandler:onDisappear(npc, creature)
end

npcType.onMove = function(npc, creature, fromPosition, toPosition)
	npcHandler:onMove(npc, creature, fromPosition, toPosition)
end

npcType.onSay = function(npc, creature, type, message)
	npcHandler:onSay(npc, creature, type, message)
end

npcType.onCloseChannel = function(npc, creature)
	npcHandler:onCloseChannel(npc, creature)
end

-- Greeting message
keywordHandler:addGreetKeyword({ "ashari" }, { npcHandler = npcHandler, text = "Greetings, |PLAYERNAME|." })
--Farewell message
keywordHandler:addFarewellKeyword({ "asgha thrazi" }, { npcHandler = npcHandler, text = "Goodbye, |PLAYERNAME|." })

npcHandler:setMessage(MESSAGE_FAREWELL, "Good bye!")

npcHandler:addModule(FocusModule:new(), npcConfig.name, true, true, true)

npcConfig.shop = {
	{ itemName = "arrow", clientId = 3447, buy = 3 },
	{ itemName = "blue quiver", clientId = 35848, buy = 400 },
	{ itemName = "bolt", clientId = 3446, buy = 4 },
	{ itemName = "bow", clientId = 3350, buy = 400 },
	{ itemName = "crossbow", clientId = 3349, buy = 500 },
	{ itemName = "quiver", clientId = 35562, buy = 400 },
	{ itemName = "red quiver", clientId = 35849, buy = 400 },
	{ itemName = "spear", clientId = 3277, buy = 10 },
}

keywordHandler:addKeyword({ "spell" }, StdModule.say, { npcHandler = npcHandler, text = "I can teach you these spells: {Arrow Call}, {Conjure Arrow}, {Conjure Explosive Arrow} and {Divine Healing}."})

local node1 = keywordHandler:addKeyword({'arrow call'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Would you like to learn {arrow call} magic spell for free?'})
node1:addChildKeyword({'yes'}, StdModule.learnSpell, {npcHandler = npcHandler, premium = false, spellName = 'arrow call', vocation = {3, 7}, price = 0, level = 1})

local node2 = keywordHandler:addKeyword({'conjure arrow'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Would you like to learn {conjure arrow} magic spell for 450 gold?'})
node2:addChildKeyword({'yes'}, StdModule.learnSpell, {npcHandler = npcHandler, premium = false, spellName = 'conjure arrow', vocation = {3, 7}, price = 450, level = 13})

local node3 = keywordHandler:addKeyword({'conjure explosive arrow'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Would you like to learn {conjure explosive arrow} magic spell for 1000 gold?'})
node3:addChildKeyword({'yes'}, StdModule.learnSpell, {npcHandler = npcHandler, premium = false, spellName = 'conjure explosive arrow', vocation = {3, 7}, price = 1000, level = 25})

local node4 = keywordHandler:addKeyword({'divine healing'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Would you like to learn {divine healing} magic spell for 3000 gold?'})
node4:addChildKeyword({'yes'}, StdModule.learnSpell, {npcHandler = npcHandler, premium = false, spellName = 'divine healing', vocation = {3, 7}, price = 3000, level = 35})

-- On buy npc shop message
npcType.onBuyItem = function(npc, player, itemId, subType, amount, ignore, inBackpacks, totalCost)
	npc:sellItem(player, itemId, amount, subType, 0, ignore, inBackpacks)
end
-- On sell npc shop message
npcType.onSellItem = function(npc, player, itemId, subtype, amount, ignore, name, totalCost)
	player:sendTextMessage(MESSAGE_TRADE, string.format("Sold %ix %s for %i gold.", amount, name, totalCost))
end
-- On check npc shop message (look item)
npcType.onCheckItem = function(npc, player, clientId, subType) end

npcType:register(npcConfig)
