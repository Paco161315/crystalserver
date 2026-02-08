local internalNpcName = "Asrak"
local npcType = Game.createNpcType(internalNpcName)
local npcConfig = {}

npcConfig.name = internalNpcName
npcConfig.description = internalNpcName

npcConfig.health = 100
npcConfig.maxHealth = npcConfig.health
npcConfig.walkInterval = 2000
npcConfig.walkRadius = 2

npcConfig.outfit = {
	lookType = 29,
	lookHead = 10,
	lookBody = 20,
	lookLegs = 30,
	lookFeet = 40,
	lookAddons = 0,
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

keywordHandler:addKeyword({ "spell" }, StdModule.say, { npcHandler = npcHandler, text = "I can teach you these spells: {Arrow Call}, {Conjure Arrow}, {Conjure Explosive Arrow}, {Cure Poison}, {Destroy Field Rune}, {Divine Healing}, {Find Fiend}, {Find Person}, {Great Light}, {Intense Healing}, {Lesser Ethereal Spear}, {Light}, {Light Healing}, {Magic Patch}, {Bruise Bane}, {Lesser Front Sweep} and {Wound Cleansing}." })

local node1 = keywordHandler:addKeyword({ "arrow call" }, StdModule.say, { npcHandler = npcHandler, onlyFocus = true, text = "Would you like to learn {arrow call} magic spell for free?" })
node1:addChildKeyword({ "yes" }, StdModule.learnSpell, { npcHandler = npcHandler, premium = false, spellName = "arrow call", vocation = { 3, 7 }, price = 0, level = 1 })

local node2 = keywordHandler:addKeyword({ "conjure arrow" }, StdModule.say, { npcHandler = npcHandler, onlyFocus = true, text = "Would you like to learn {conjure arrow} magic spell for 450 gold?" })
node2:addChildKeyword({ "yes" }, StdModule.learnSpell, { npcHandler = npcHandler, premium = false, spellName = "conjure arrow", vocation = { 3, 7 }, price = 450, level = 13 })

local node3 = keywordHandler:addKeyword({ "conjure explosive arrow" }, StdModule.say, { npcHandler = npcHandler, onlyFocus = true, text = "Would you like to learn {conjure explosive arrow} magic spell for 1000 gold?" })
node3:addChildKeyword({ "yes" }, StdModule.learnSpell, { npcHandler = npcHandler, premium = false, spellName = "conjure explosive arrow", vocation = { 3, 7 }, price = 1000, level = 25 })

local node4 = keywordHandler:addKeyword({ "cure poison" }, StdModule.say, { npcHandler = npcHandler, onlyFocus = true, text = "Would you like to learn {cure poison} magic spell for 150 gold?" })
node4:addChildKeyword({ "yes" }, StdModule.learnSpell, { npcHandler = npcHandler, premium = false, spellName = "cure poison", vocation = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 }, price = 150, level = 10 })

local node5 = keywordHandler:addKeyword({ "destroy field rune" }, StdModule.say, { npcHandler = npcHandler, onlyFocus = true, text = "Would you like to learn {destroy field rune} magic spell for 700 gold?" })
node5:addChildKeyword({ "yes" }, StdModule.learnSpell, { npcHandler = npcHandler, premium = false, spellName = "destroy field rune", vocation = { 1, 2, 3, 5, 6, 7, 9, 10 }, price = 700, level = 17 })

local node6 = keywordHandler:addKeyword({ "divine healing" }, StdModule.say, { npcHandler = npcHandler, onlyFocus = true, text = "Would you like to learn {divine healing} magic spell for 3000 gold?" })
node6:addChildKeyword({ "yes" }, StdModule.learnSpell, { npcHandler = npcHandler, premium = false, spellName = "divine healing", vocation = { 3, 7 }, price = 3000, level = 35 })

local node7 = keywordHandler:addKeyword({ "find fiend" }, StdModule.say, { npcHandler = npcHandler, onlyFocus = true, text = "Would you like to learn {find fiend} magic spell for 1000 gold?" })
node7:addChildKeyword({ "yes" }, StdModule.learnSpell, { npcHandler = npcHandler, premium = false, spellName = "find fiend", vocation = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 }, price = 1000, level = 25 })

local node8 = keywordHandler:addKeyword({ "find person" }, StdModule.say, { npcHandler = npcHandler, onlyFocus = true, text = "Would you like to learn {find person} magic spell for 80 gold?" })
node8:addChildKeyword({ "yes" }, StdModule.learnSpell, { npcHandler = npcHandler, premium = false, spellName = "find person", vocation = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 }, price = 80, level = 8 })

local node9 = keywordHandler:addKeyword({ "great light" }, StdModule.say, { npcHandler = npcHandler, onlyFocus = true, text = "Would you like to learn {great light} magic spell for 500 gold?" })
node9:addChildKeyword({ "yes" }, StdModule.learnSpell, { npcHandler = npcHandler, premium = false, spellName = "great light", vocation = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 }, price = 500, level = 13 })

local node10 = keywordHandler:addKeyword({ "intense healing" }, StdModule.say, { npcHandler = npcHandler, onlyFocus = true, text = "Would you like to learn {intense healing} magic spell for 350 gold?" })
node10:addChildKeyword({ "yes" }, StdModule.learnSpell, { npcHandler = npcHandler, premium = false, spellName = "intense healing", vocation = { 1, 2, 3, 5, 6, 7, 9, 10 }, price = 350, level = 20 })

local node11 = keywordHandler:addKeyword({ "light healing" }, StdModule.say, { npcHandler = npcHandler, onlyFocus = true, text = "Would you like to learn {light healing} magic spell for free?" })
node11:addChildKeyword({ "yes" }, StdModule.learnSpell, { npcHandler = npcHandler, premium = false, spellName = "light healing", vocation = { 1, 2, 3, 5, 6, 7, 9, 10 }, price = 0, level = 8 })

local node12 = keywordHandler:addKeyword({ "light" }, StdModule.say, { npcHandler = npcHandler, onlyFocus = true, text = "Would you like to learn {light} magic spell for free?" })
node12:addChildKeyword({ "yes" }, StdModule.learnSpell, { npcHandler = npcHandler, premium = false, spellName = "light", vocation = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 }, price = 0, level = 8 })

local node13 = keywordHandler:addKeyword({ "magic patch" }, StdModule.say, { npcHandler = npcHandler, onlyFocus = true, text = "Would you like to learn {magic patch} magic spell for free?" })
node13:addChildKeyword({ "yes" }, StdModule.learnSpell, { npcHandler = npcHandler, premium = false, spellName = "magic patch", vocation = { 1, 2, 3, 5, 6, 7 }, price = 0, level = 1 })

local node14 = keywordHandler:addKeyword({ "bruise bane" }, StdModule.say, { npcHandler = npcHandler, onlyFocus = true, text = "Would you like to learn {bruise bane} magic spell for free?" })
node14:addChildKeyword({ "yes" }, StdModule.learnSpell, { npcHandler = npcHandler, premium = false, spellName = "bruise bane", vocation = { 4, 8 }, price = 0, level = 1 })

local node15 = keywordHandler:addKeyword({ "lesser front sweep" }, StdModule.say, { npcHandler = npcHandler, onlyFocus = true, text = "Would you like to learn {lesser front sweep} magic spell for free?" })
node15:addChildKeyword({ "yes" }, StdModule.learnSpell, { npcHandler = npcHandler, premium = false, spellName = "lesser front sweep", vocation = { 4, 8 }, price = 0, level = 1 })

local node16 = keywordHandler:addKeyword({ "wound cleansing" }, StdModule.say, { npcHandler = npcHandler, onlyFocus = true, text = "Would you like to learn {wound cleansing} magic spell for free?" })
node16:addChildKeyword({ "yes" }, StdModule.learnSpell, { npcHandler = npcHandler, premium = false, spellName = "wound cleansing", vocation = { 4, 8 }, price = 0, level = 8 })

local node17 = keywordHandler:addKeyword({ "lesser ethereal spear" }, StdModule.say, { npcHandler = npcHandler, onlyFocus = true, text = "Would you like to learn {lesser ethereal spear} magic spell for free?" })
node17:addChildKeyword({ "yes" }, StdModule.learnSpell, { npcHandler = npcHandler, premium = false, spellName = "lesser ethereal spear", vocation = { 3, 7 }, price = 0, level = 1 })

npcHandler:addModule(FocusModule:new(), npcConfig.name, true, true, true)

-- npcType registering the npcConfig table
npcType:register(npcConfig)
