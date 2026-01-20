local internalNpcName = "Faluae"
local npcType = Game.createNpcType(internalNpcName)
local npcConfig = {}

npcConfig.name = internalNpcName
npcConfig.description = internalNpcName

npcConfig.health = 100
npcConfig.maxHealth = npcConfig.health
npcConfig.walkInterval = 2000
npcConfig.walkRadius = 2

npcConfig.outfit = {
	lookType = 62,
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

keywordHandler:addKeyword({ "spell" }, StdModule.say, { npcHandler = npcHandler, text = "I can teach you these spells: {Find Fiend}, {Find Person}, {Great Light}, {Light} and {Food}."})

local node1 = keywordHandler:addKeyword({'find fiend'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Would you like to learn {find fiend} magic spell for 1000 gold?'})
node1:addChildKeyword({'yes'}, StdModule.learnSpell, {npcHandler = npcHandler, premium = false, spellName = 'find fiend', vocation = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10}, price = 1000, level = 25})
node1:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Demons and other fiends are best hunted with this spell.', reset = true})

local node2 = keywordHandler:addKeyword({'find person'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Would you like to learn {find person} magic spell for 80 gold?'})
node2:addChildKeyword({'yes'}, StdModule.learnSpell, {npcHandler = npcHandler, premium = false, spellName = 'find person', vocation = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10}, price = 80, level = 8})
node2:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Finding friends or enemies can be useful.', reset = true})

local node3 = keywordHandler:addKeyword({'great light'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Would you like to learn {great light} magic spell for 500 gold?'})
node3:addChildKeyword({'yes'}, StdModule.learnSpell, {npcHandler = npcHandler, premium = false, spellName = 'great light', vocation = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10}, price = 500, level = 13})
node3:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Dark places can be treacherous without proper light.', reset = true})

local node4 = keywordHandler:addKeyword({'light'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Would you like to learn {light} magic spell for free?'})
node4:addChildKeyword({'yes'}, StdModule.learnSpell, {npcHandler = npcHandler, premium = false, spellName = 'light', vocation = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10}, price = 0, level = 8})
node4:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'You will need light to explore dark places.', reset = true})

local node5 = keywordHandler:addKeyword({'food'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Would you like to learn {food} magic spell for 300 gold?'})
node5:addChildKeyword({'yes'}, StdModule.learnSpell, {npcHandler = npcHandler, premium = false, spellName = 'food', vocation = {2, 6}, price = 300, level = 14})
node5:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Create nourishment from nature.', reset = true})

-- Greeting message
keywordHandler:addGreetKeyword({ "ashari" }, { npcHandler = npcHandler, text = "Greetings, |PLAYERNAME|." })
--Farewell message
keywordHandler:addFarewellKeyword({ "asgha thrazi" }, { npcHandler = npcHandler, text = "Goodbye, |PLAYERNAME|." })

npcHandler:setMessage(MESSAGE_FAREWELL, "Good bye!")

npcHandler:addModule(FocusModule:new(), npcConfig.name, true, true, true)

-- npcType registering the npcConfig table
npcType:register(npcConfig)
