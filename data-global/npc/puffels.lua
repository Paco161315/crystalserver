local internalNpcName = "Puffels"
local npcType = Game.createNpcType(internalNpcName)
local npcConfig = {}

npcConfig.name = internalNpcName
npcConfig.description = internalNpcName

npcConfig.health = 100
npcConfig.maxHealth = npcConfig.health
npcConfig.walkInterval = 2000
npcConfig.walkRadius = 2

npcConfig.outfit = {
	lookType = 21,
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

keywordHandler:addKeyword({ "spells" }, StdModule.say, { npcHandler = npcHandler, text = "I can teach you these spells: {Annihilation}, {Berserk}, {Bruise Bane}, {Brutal Strike}, {Charge}, {Chivalrous Challenge}, {Cure Bleeding}, {Cure Poison}, {Fair Wound Cleansing}, {Fierce Berserk}, {Find Fiend}, {Find Person}, {Front Sweep}, {Great Light}, {Groundshaker}, {Haste}, {Inflict Wound}, {Intense Recovery}, {Intense Wound Cleansing}, {Lesser Front Sweep}, {Levitate}, {Light}, {Magic Rope}, {Recovery}, {Summon Knight Familiar}, {Whirlwind Throw} and {Wound Cleansing}." })

local node1 = keywordHandler:addKeyword({'annihilation'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Would you like to learn {annihilation} magic spell for 20000 gold?'})
node1:addChildKeyword({'yes'}, StdModule.learnSpell, {npcHandler = npcHandler, premium = false, spellName = 'annihilation', vocation = {4, 8}, price = 20000, level = 110})

local node2 = keywordHandler:addKeyword({'berserk'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Would you like to learn {berserk} magic spell for 2500 gold?'})
node2:addChildKeyword({'yes'}, StdModule.learnSpell, {npcHandler = npcHandler, premium = false, spellName = 'berserk', vocation = {4, 8}, price = 2500, level = 35})

local node3 = keywordHandler:addKeyword({'bruise bane'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Would you like to learn {bruise bane} magic spell for free?'})
node3:addChildKeyword({'yes'}, StdModule.learnSpell, {npcHandler = npcHandler, premium = false, spellName = 'bruise bane', vocation = {4, 8}, price = 0, level = 1})

local node4 = keywordHandler:addKeyword({'brutal strike'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Would you like to learn {brutal strike} magic spell for 1000 gold?'})
node4:addChildKeyword({'yes'}, StdModule.learnSpell, {npcHandler = npcHandler, premium = false, spellName = 'brutal strike', vocation = {4, 8}, price = 1000, level = 16})

local node5 = keywordHandler:addKeyword({'charge'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Would you like to learn {charge} magic spell for 1300 gold?'})
node5:addChildKeyword({'yes'}, StdModule.learnSpell, {npcHandler = npcHandler, premium = false, spellName = 'charge', vocation = {4, 8}, price = 1300, level = 25})

local node6 = keywordHandler:addKeyword({'chivalrous challenge'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Would you like to learn {chivalrous challenge} magic spell for 250000 gold?'})
node6:addChildKeyword({'yes'}, StdModule.learnSpell, {npcHandler = npcHandler, premium = false, spellName = 'chivalrous challenge', vocation = {4, 8}, price = 250000, level = 150})

local node7 = keywordHandler:addKeyword({'cure bleeding'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Would you like to learn {cure bleeding} magic spell for 2500 gold?'})
node7:addChildKeyword({'yes'}, StdModule.learnSpell, {npcHandler = npcHandler, premium = false, spellName = 'cure bleeding', vocation = {4, 8}, price = 2500, level = 45})

local node8 = keywordHandler:addKeyword({'cure poison'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Would you like to learn {cure poison} magic spell for 150 gold?'})
node8:addChildKeyword({'yes'}, StdModule.learnSpell, {npcHandler = npcHandler, premium = false, spellName = 'cure poison', vocation = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10}, price = 150, level = 10})

local node9 = keywordHandler:addKeyword({'fair wound cleansing'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Would you like to learn {fair wound cleansing} magic spell for 500000 gold?'})
node9:addChildKeyword({'yes'}, StdModule.learnSpell, {npcHandler = npcHandler, premium = false, spellName = 'fair wound cleansing', vocation = {4, 8}, price = 500000, level = 300})

local node10 = keywordHandler:addKeyword({'fierce berserk'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Would you like to learn {fierce berserk} magic spell for 7500 gold?'})
node10:addChildKeyword({'yes'}, StdModule.learnSpell, {npcHandler = npcHandler, premium = false, spellName = 'fierce berserk', vocation = {4, 8}, price = 7500, level = 90})

local node11 = keywordHandler:addKeyword({'find fiend'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Would you like to learn {find fiend} magic spell for 1000 gold?'})
node11:addChildKeyword({'yes'}, StdModule.learnSpell, {npcHandler = npcHandler, premium = false, spellName = 'find fiend', vocation = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10}, price = 1000, level = 25})

local node12 = keywordHandler:addKeyword({'find person'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Would you like to learn {find person} magic spell for 80 gold?'})
node12:addChildKeyword({'yes'}, StdModule.learnSpell, {npcHandler = npcHandler, premium = false, spellName = 'find person', vocation = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10}, price = 80, level = 8})

local node13 = keywordHandler:addKeyword({'front sweep'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Would you like to learn {front sweep} magic spell for 4000 gold?'})
node13:addChildKeyword({'yes'}, StdModule.learnSpell, {npcHandler = npcHandler, premium = false, spellName = 'front sweep', vocation = {4, 8}, price = 4000, level = 70})

local node14 = keywordHandler:addKeyword({'great light'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Would you like to learn {great light} magic spell for 500 gold?'})
node14:addChildKeyword({'yes'}, StdModule.learnSpell, {npcHandler = npcHandler, premium = false, spellName = 'great light', vocation = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10}, price = 500, level = 13})

local node15 = keywordHandler:addKeyword({'groundshaker'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Would you like to learn {groundshaker} magic spell for 1500 gold?'})
node15:addChildKeyword({'yes'}, StdModule.learnSpell, {npcHandler = npcHandler, premium = false, spellName = 'groundshaker', vocation = {4, 8}, price = 1500, level = 33})

local node16 = keywordHandler:addKeyword({'haste'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Would you like to learn {haste} magic spell for 600 gold?'})
node16:addChildKeyword({'yes'}, StdModule.learnSpell, {npcHandler = npcHandler, premium = false, spellName = 'haste', vocation = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10}, price = 600, level = 14})

local node17 = keywordHandler:addKeyword({'inflict wound'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Would you like to learn {inflict wound} magic spell for 2500 gold?'})
node17:addChildKeyword({'yes'}, StdModule.learnSpell, {npcHandler = npcHandler, premium = false, spellName = 'inflict wound', vocation = {4, 8, 9, 10}, price = 2500, level = 40})

local node18 = keywordHandler:addKeyword({'intense recovery'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Would you like to learn {intense recovery} magic spell for 10000 gold?'})
node18:addChildKeyword({'yes'}, StdModule.learnSpell, {npcHandler = npcHandler, premium = false, spellName = 'intense recovery', vocation = {3, 4, 7, 8}, price = 10000, level = 100})

local node19 = keywordHandler:addKeyword({'intense wound cleansing'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Would you like to learn {intense wound cleansing} magic spell for 6000 gold?'})
node19:addChildKeyword({'yes'}, StdModule.learnSpell, {npcHandler = npcHandler, premium = false, spellName = 'intense wound cleansing', vocation = {4, 8}, price = 6000, level = 80})

local node20 = keywordHandler:addKeyword({'lesser front sweep'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Would you like to learn {lesser front sweep} magic spell for free?'})
node20:addChildKeyword({'yes'}, StdModule.learnSpell, {npcHandler = npcHandler, premium = false, spellName = 'lesser front sweep', vocation = {4, 8}, price = 0, level = 1})

local node21 = keywordHandler:addKeyword({'levitate'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Would you like to learn {levitate} magic spell for 500 gold?'})
node21:addChildKeyword({'yes'}, StdModule.learnSpell, {npcHandler = npcHandler, premium = false, spellName = 'levitate', vocation = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10}, price = 500, level = 12})

local node22 = keywordHandler:addKeyword({'light'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Would you like to learn {light} magic spell for free?'})
node22:addChildKeyword({'yes'}, StdModule.learnSpell, {npcHandler = npcHandler, premium = false, spellName = 'light', vocation = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10}, price = 0, level = 8})

local node23 = keywordHandler:addKeyword({'magic rope'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Would you like to learn {magic rope} magic spell for 200 gold?'})
node23:addChildKeyword({'yes'}, StdModule.learnSpell, {npcHandler = npcHandler, premium = false, spellName = 'magic rope', vocation = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10}, price = 200, level = 9})

local node24 = keywordHandler:addKeyword({'recovery'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Would you like to learn {recovery} magic spell for 4000 gold?'})
node24:addChildKeyword({'yes'}, StdModule.learnSpell, {npcHandler = npcHandler, premium = false, spellName = 'recovery', vocation = {3, 4, 7, 8}, price = 4000, level = 50})

local node25 = keywordHandler:addKeyword({'summon knight familiar'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Would you like to learn {summon knight familiar} magic spell for 50000 gold?'})
node25:addChildKeyword({'yes'}, StdModule.learnSpell, {npcHandler = npcHandler, premium = false, spellName = 'summon knight familiar', vocation = {4, 8}, price = 50000, level = 200})

local node26 = keywordHandler:addKeyword({'whirlwind throw'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Would you like to learn {whirlwind throw} magic spell for 1500 gold?'})
node26:addChildKeyword({'yes'}, StdModule.learnSpell, {npcHandler = npcHandler, premium = false, spellName = 'whirlwind throw', vocation = {4, 8}, price = 1500, level = 28})

local node27 = keywordHandler:addKeyword({'wound cleansing'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Would you like to learn {wound cleansing} magic spell for free?'})
node27:addChildKeyword({'yes'}, StdModule.learnSpell, {npcHandler = npcHandler, premium = false, spellName = 'wound cleansing', vocation = {4, 8}, price = 0, level = 8})

npcHandler:setMessage(MESSAGE_GREET, "Yeah, another fool {disturbing} me, what a joy.")
npcHandler:setMessage(MESSAGE_FAREWELL, "Whatever.")
npcHandler:setMessage(MESSAGE_WALKAWAY, "Whatever.")

npcHandler:addModule(FocusModule:new(), npcConfig.name, true, true, true)

-- npcType registering the npcConfig table
npcType:register(npcConfig)
