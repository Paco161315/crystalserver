local internalNpcName = "Duria"
local npcType = Game.createNpcType(internalNpcName)
local npcConfig = {}

npcConfig.name = internalNpcName
npcConfig.description = internalNpcName

npcConfig.health = 100
npcConfig.maxHealth = npcConfig.health
npcConfig.walkInterval = 2000
npcConfig.walkRadius = 2

npcConfig.outfit = {
	lookType = 70,
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

keywordHandler:addKeyword({ "spells" }, StdModule.say, { npcHandler = npcHandler, text = "I can teach you these spells: {Find Person}, {Light}, {Cure Poison}, {Wound Cleansing} and {Great Light}." })

local node1 = keywordHandler:addKeyword({'find person'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Would you like to learn {find person} magic spell for 80 gold?'})
node1:addChildKeyword({'yes'}, StdModule.learnSpell, {npcHandler = npcHandler, premium = false, spellName = 'find person', vocation = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10}, price = 80, level = 8})

local node2 = keywordHandler:addKeyword({'light'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Would you like to learn {light} magic spell for free?'})
node2:addChildKeyword({'yes'}, StdModule.learnSpell, {npcHandler = npcHandler, premium = false, spellName = 'light', vocation = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10}, price = 0, level = 8})

local node3 = keywordHandler:addKeyword({'cure poison'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Would you like to learn {cure poison} magic spell for 150 gold?'})
node3:addChildKeyword({'yes'}, StdModule.learnSpell, {npcHandler = npcHandler, premium = false, spellName = 'cure poison', vocation = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10}, price = 150, level = 10})

local node4 = keywordHandler:addKeyword({'wound cleansing'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Would you like to learn {wound cleansing} magic spell for free?'})
node4:addChildKeyword({'yes'}, StdModule.learnSpell, {npcHandler = npcHandler, premium = false, spellName = 'wound cleansing', vocation = {4, 8}, price = 0, level = 8})

local node5 = keywordHandler:addKeyword({'great light'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Would you like to learn {great light} magic spell for 500 gold?'})
node5:addChildKeyword({'yes'}, StdModule.learnSpell, {npcHandler = npcHandler, premium = false, spellName = 'great light', vocation = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10}, price = 500, level = 13})

npcHandler:setMessage(MESSAGE_GREET, "Hiho, fellow knight |PLAYERNAME|!")
npcHandler:setMessage(MESSAGE_FAREWELL, "Goodbye.")
npcHandler:setMessage(MESSAGE_WALKAWAY, "Be carefull out there, jawoll.")

npcHandler:addModule(FocusModule:new(), npcConfig.name, true, true, true)

-- npcType registering the npcConfig table
npcType:register(npcConfig)