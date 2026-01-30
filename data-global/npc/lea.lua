local internalNpcName = "Lea"
local npcType = Game.createNpcType(internalNpcName)
local npcConfig = {}

npcConfig.name = internalNpcName
npcConfig.description = internalNpcName

npcConfig.health = 100
npcConfig.maxHealth = npcConfig.health
npcConfig.walkInterval = 2000
npcConfig.walkRadius = 2

npcConfig.outfit = {
	lookType = 138,
	lookHead = 59,
	lookBody = 95,
	lookLegs = 113,
	lookFeet = 113,
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

keywordHandler:addKeyword({ "spell" }, StdModule.say, {
	npcHandler = npcHandler,
	text = "I can teach you these spells: {Apprentice's Strike}, {Buzz}, {Creature Illusion}, {Cure Poison}, {Destroy Field Rune}, {Energy Beam}, {Energy Field  Rune}, {Energy Wall  Rune}, {Energy Wave}, {Explosion}, {Find Fiend}, {Find Person}, {Fire Bomb  Rune}, {Fire Field  Rune}, {Fire Wall  Rune}, {Fire Wave}, {Great Energy Beam}, {Great Fireball  Rune}, {Great Light}, {Heavy Magic Missile  Rune}, {Intense Healing}, {Invisibility}, {Light}, {Light Healing}, {Light Magic Missile  Rune}, {Magic Patch}, {Magic Shield}, {Poison Field  Rune}, {Poison Wall Rune}, {Scorch}, {Stalagmite Rune}, {Sudden Death Rune}, {Summon Creature} and {Ultimate Healing}.",
})

local node1 = keywordHandler:addKeyword({ "apprentice's strike" }, StdModule.say, { npcHandler = npcHandler, onlyFocus = true, text = "Would you like to learn {apprentice's strike} magic spell for free?" })
node1:addChildKeyword({ "yes" }, StdModule.learnSpell, { npcHandler = npcHandler, premium = false, spellName = "apprentice's strike", vocation = { 1, 2, 5, 6 }, price = 0, level = 8 })

local node2 = keywordHandler:addKeyword({ "buzz" }, StdModule.say, { npcHandler = npcHandler, onlyFocus = true, text = "Would you like to learn {buzz} magic spell for free?" })
node2:addChildKeyword({ "yes" }, StdModule.learnSpell, { npcHandler = npcHandler, premium = false, spellName = "buzz", vocation = { 1, 5 }, price = 0, level = 1 })

local node3 = keywordHandler:addKeyword({ "creature illusion" }, StdModule.say, { npcHandler = npcHandler, onlyFocus = true, text = "Would you like to learn {creature illusion} magic spell for 1000 gold?" })
node3:addChildKeyword({ "yes" }, StdModule.learnSpell, { npcHandler = npcHandler, premium = false, spellName = "creature illusion", vocation = { 1, 2, 5, 6 }, price = 1000, level = 23 })

local node4 = keywordHandler:addKeyword({ "cure poison" }, StdModule.say, { npcHandler = npcHandler, onlyFocus = true, text = "Would you like to learn {cure poison} magic spell for 150 gold?" })
node4:addChildKeyword({ "yes" }, StdModule.learnSpell, { npcHandler = npcHandler, premium = false, spellName = "cure poison", vocation = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 }, price = 150, level = 10 })

local node5 = keywordHandler:addKeyword({ "destroy field rune" }, StdModule.say, { npcHandler = npcHandler, onlyFocus = true, text = "Would you like to learn {destroy field rune} magic spell for 700 gold?" })
node5:addChildKeyword({ "yes" }, StdModule.learnSpell, { npcHandler = npcHandler, premium = false, spellName = "destroy field rune", vocation = { 1, 2, 3, 5, 6, 7, 9, 10 }, price = 700, level = 17 })

local node6= keywordHandler:addKeyword({ "great energy beam" }, StdModule.say, { npcHandler = npcHandler, onlyFocus = true, text = "Would you like to learn {great energy beam} magic spell for 1800 gold?" })
node6:addChildKeyword({ "yes" }, StdModule.learnSpell, { npcHandler = npcHandler, premium = false, spellName = "great energy beam", vocation = { 1, 5 }, price = 1800, level = 29 })

local node7 = keywordHandler:addKeyword({ "energy field rune" }, StdModule.say, { npcHandler = npcHandler, onlyFocus = true, text = "Would you like to learn {energy field} magic spell for 700 gold?" })
node7:addChildKeyword({ "yes" }, StdModule.learnSpell, { npcHandler = npcHandler, premium = false, spellName = "energy field rune", vocation = { 1, 2, 5, 6 }, price = 700, level = 18 })

local node8 = keywordHandler:addKeyword({ "energy wall rune" }, StdModule.say, { npcHandler = npcHandler, onlyFocus = true, text = "Would you like to learn {energy wall rune} magic spell for 2500 gold?" })
node8:addChildKeyword({ "yes" }, StdModule.learnSpell, { npcHandler = npcHandler, premium = false, spellName = "energy wall rune", vocation = { 1, 2, 5, 6 }, price = 2500, level = 41 })

local node9 = keywordHandler:addKeyword({ "energy wave" }, StdModule.say, { npcHandler = npcHandler, onlyFocus = true, text = "Would you like to learn {energy wave} magic spell for 2500 gold?" })
node9:addChildKeyword({ "yes" }, StdModule.learnSpell, { npcHandler = npcHandler, premium = false, spellName = "energy wave", vocation = { 1, 5 }, price = 2500, level = 38 })

local node10 = keywordHandler:addKeyword({ "explosion" }, StdModule.say, { npcHandler = npcHandler, onlyFocus = true, text = "Would you like to learn {explosion} magic spell for 1800 gold?" })
node10:addChildKeyword({ "yes" }, StdModule.learnSpell, { npcHandler = npcHandler, premium = false, spellName = "explosion", vocation = { 1, 2, 5, 6 }, price = 1800, level = 31 })

local node11 = keywordHandler:addKeyword({ "find fiend" }, StdModule.say, { npcHandler = npcHandler, onlyFocus = true, text = "Would you like to learn {find fiend} magic spell for 1000 gold?" })
node11:addChildKeyword({ "yes" }, StdModule.learnSpell, { npcHandler = npcHandler, premium = false, spellName = "find fiend", vocation = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 }, price = 1000, level = 25 })

local node12 = keywordHandler:addKeyword({ "find person" }, StdModule.say, { npcHandler = npcHandler, onlyFocus = true, text = "Would you like to learn {find person} magic spell for 80 gold?" })
node12:addChildKeyword({ "yes" }, StdModule.learnSpell, { npcHandler = npcHandler, premium = false, spellName = "find person", vocation = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 }, price = 80, level = 8 })

local node13 = keywordHandler:addKeyword({ "fire bomb rune" }, StdModule.say, { npcHandler = npcHandler, onlyFocus = true, text = "Would you like to learn {fire bomb rune} magic spell for 1500 gold?" })
node13:addChildKeyword({ "yes" }, StdModule.learnSpell, { npcHandler = npcHandler, premium = false, spellName = "fire bomb rune", vocation = { 1, 2, 5, 6 }, price = 1500, level = 27 })

local node14 = keywordHandler:addKeyword({ "fire field rune" }, StdModule.say, { npcHandler = npcHandler, onlyFocus = true, text = "Would you like to learn {fire field rune} magic spell for 500 gold?" })
node14:addChildKeyword({ "yes" }, StdModule.learnSpell, { npcHandler = npcHandler, premium = false, spellName = "fire field rune", vocation = { 1, 2, 5, 6 }, price = 500, level = 15 })

local node15 = keywordHandler:addKeyword({ "fire wall rune" }, StdModule.say, { npcHandler = npcHandler, onlyFocus = true, text = "Would you like to learn {fire wall rune} magic spell for 2000 gold?" })
node15:addChildKeyword({ "yes" }, StdModule.learnSpell, { npcHandler = npcHandler, premium = false, spellName = "fire wall rune", vocation = { 1, 2, 5, 6 }, price = 2000, level = 33 })

local node16 = keywordHandler:addKeyword({ "fire wave" }, StdModule.say, { npcHandler = npcHandler, onlyFocus = true, text = "Would you like to learn {fire wave} magic spell for 850 gold?" })
node16:addChildKeyword({ "yes" }, StdModule.learnSpell, { npcHandler = npcHandler, premium = false, spellName = "fire wave", vocation = { 1, 5 }, price = 850, level = 18 })

local node17 = keywordHandler:addKeyword({ "energy beam" }, StdModule.say, { npcHandler = npcHandler, onlyFocus = true, text = "Would you like to learn {energy beam} magic spell for 1000 gold?" })
node17:addChildKeyword({ "yes" }, StdModule.learnSpell, { npcHandler = npcHandler, premium = false, spellName = "energy beam", vocation = { 1, 5 }, price = 1000, level = 23 })

local node18 = keywordHandler:addKeyword({ "great fireball rune" }, StdModule.say, { npcHandler = npcHandler, onlyFocus = true, text = "Would you like to learn {great fireball rune} magic spell for 1200 gold?" })
node18:addChildKeyword({ "yes" }, StdModule.learnSpell, { npcHandler = npcHandler, premium = false, spellName = "great fireball rune", vocation = { 1, 5 }, price = 1200, level = 30 })

local node19 = keywordHandler:addKeyword({ "great light" }, StdModule.say, { npcHandler = npcHandler, onlyFocus = true, text = "Would you like to learn {great light} magic spell for 500 gold?" })
node19:addChildKeyword({ "yes" }, StdModule.learnSpell, { npcHandler = npcHandler, premium = false, spellName = "great light", vocation = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 }, price = 500, level = 13 })

local node20 = keywordHandler:addKeyword({ "heavy magic missile rune" }, StdModule.say, { npcHandler = npcHandler, onlyFocus = true, text = "Would you like to learn {heavy magic missile rune} magic spell for 1500 gold?" })
node20:addChildKeyword({ "yes" }, StdModule.learnSpell, { npcHandler = npcHandler, premium = false, spellName = "heavy magic missile rune", vocation = { 1, 2, 5, 6 }, price = 1500, level = 25 })

local node21 = keywordHandler:addKeyword({ "intense healing" }, StdModule.say, { npcHandler = npcHandler, onlyFocus = true, text = "Would you like to learn {intense healing} magic spell for 350 gold?" })
node21:addChildKeyword({ "yes" }, StdModule.learnSpell, { npcHandler = npcHandler, premium = false, spellName = "intense healing", vocation = { 1, 2, 3, 5, 6, 7, 9, 10 }, price = 350, level = 20 })

local node22 = keywordHandler:addKeyword({ "invisibility" }, StdModule.say, { npcHandler = npcHandler, onlyFocus = true, text = "Would you like to learn {invisibility} magic spell for 2000 gold?" })
node22:addChildKeyword({ "yes" }, StdModule.learnSpell, { npcHandler = npcHandler, premium = false, spellName = "invisibility", vocation = { 1, 2, 5, 6 }, price = 2000, level = 35 })

local node23 = keywordHandler:addKeyword({ "light healing" }, StdModule.say, { npcHandler = npcHandler, onlyFocus = true, text = "Would you like to learn {light healing} magic spell for free?" })
node23:addChildKeyword({ "yes" }, StdModule.learnSpell, { npcHandler = npcHandler, premium = false, spellName = "light healing", vocation = { 1, 2, 3, 5, 6, 7, 9, 10 }, price = 0, level = 8 })

local node24 = keywordHandler:addKeyword({ "light magic missile rune" }, StdModule.say, { npcHandler = npcHandler, onlyFocus = true, text = "Would you like to learn {light magic missile rune} magic spell for 500 gold?" })
node24:addChildKeyword({ "yes" }, StdModule.learnSpell, { npcHandler = npcHandler, premium = false, spellName = "light magic missile rune", vocation = { 1, 2, 5, 6 }, price = 500, level = 15 })

local node25 = keywordHandler:addKeyword({ "light" }, StdModule.say, { npcHandler = npcHandler, onlyFocus = true, text = "Would you like to learn {light} magic spell for free?" })
node25:addChildKeyword({ "yes" }, StdModule.learnSpell, { npcHandler = npcHandler, premium = false, spellName = "light", vocation = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 }, price = 0, level = 8 })

local node26 = keywordHandler:addKeyword({ "magic patch" }, StdModule.say, { npcHandler = npcHandler, onlyFocus = true, text = "Would you like to learn {magic patch} magic spell for free?" })
node26:addChildKeyword({ "yes" }, StdModule.learnSpell, { npcHandler = npcHandler, premium = false, spellName = "magic patch", vocation = { 1, 2, 3, 5, 6, 7 }, price = 0, level = 1 })

local node27 = keywordHandler:addKeyword({ "magic shield" }, StdModule.say, { npcHandler = npcHandler, onlyFocus = true, text = "Would you like to learn {magic shield} magic spell for 450 gold?" })
node27:addChildKeyword({ "yes" }, StdModule.learnSpell, { npcHandler = npcHandler, premium = false, spellName = "magic shield", vocation = { 1, 2, 5, 6 }, price = 450, level = 14 })

local node28 = keywordHandler:addKeyword({ "poison field rune" }, StdModule.say, { npcHandler = npcHandler, onlyFocus = true, text = "Would you like to learn {poison field rune} magic spell for 300 gold?" })
node28:addChildKeyword({ "yes" }, StdModule.learnSpell, { npcHandler = npcHandler, premium = false, spellName = "poison field rune", vocation = { 1, 2, 5, 6 }, price = 300, level = 14 })

local node29 = keywordHandler:addKeyword({ "poison wall rune" }, StdModule.say, { npcHandler = npcHandler, onlyFocus = true, text = "Would you like to learn {poison wall rune} magic spell for 1600 gold?" })
node29:addChildKeyword({ "yes" }, StdModule.learnSpell, { npcHandler = npcHandler, premium = false, spellName = "poison wall rune", vocation = { 1, 2, 5, 6 }, price = 1600, level = 29 })

local node30 = keywordHandler:addKeyword({ "scorch" }, StdModule.say, { npcHandler = npcHandler, onlyFocus = true, text = "Would you like to learn {scorch} magic spell for free?" })
node30:addChildKeyword({ "yes" }, StdModule.learnSpell, { npcHandler = npcHandler, premium = false, spellName = "scorch", vocation = { 1, 5 }, price = 0, level = 1 })

local node31 = keywordHandler:addKeyword({ "stalagmite rune" }, StdModule.say, { npcHandler = npcHandler, onlyFocus = true, text = "Would you like to learn {stalagmite rune} magic spell for 1400 gold?" })
node31:addChildKeyword({ "yes" }, StdModule.learnSpell, { npcHandler = npcHandler, premium = false, spellName = "stalagmite rune", vocation = { 1, 2, 5, 6 }, price = 1400, level = 24 })

local node32 = keywordHandler:addKeyword({ "sudden death rune" }, StdModule.say, { npcHandler = npcHandler, onlyFocus = true, text = "Would you like to learn {sudden death rune} magic spell for 3000 gold?" })
node32:addChildKeyword({ "yes" }, StdModule.learnSpell, { npcHandler = npcHandler, premium = false, spellName = "sudden death rune", vocation = { 1, 5 }, price = 3000, level = 45 })

local node33 = keywordHandler:addKeyword({ "summon creature" }, StdModule.say, { npcHandler = npcHandler, onlyFocus = true, text = "Would you like to learn {summon creature} magic spell for 2000 gold?" })
node33:addChildKeyword({ "yes" }, StdModule.learnSpell, { npcHandler = npcHandler, premium = false, spellName = "summon creature", vocation = { 1, 2, 5, 6 }, price = 2000, level = 25 })

local node34 = keywordHandler:addKeyword({ "ultimate healing" }, StdModule.say, { npcHandler = npcHandler, onlyFocus = true, text = "Would you like to learn {ultimate healing} magic spell for 1000 gold?" })
node34:addChildKeyword({ "yes" }, StdModule.learnSpell, { npcHandler = npcHandler, premium = false, spellName = "ultimate healing", vocation = { 1, 2, 5, 6 }, price = 1000, level = 30 })

keywordHandler:addKeyword({ "job" }, StdModule.say, { npcHandler = npcHandler, text = "I am the archsorcerer of Carlin. I keep the secrets of our order." })
keywordHandler:addKeyword({ "name" }, StdModule.say, { npcHandler = npcHandler, text = "My name is Lea." })
--keywordHandler:addKeyword({'spell'}, StdModule.say, {npcHandler = npcHandler, text = "Sorry, I only sell spells to sorcerers."})
keywordHandler:addKeyword({ "time" }, StdModule.say, { npcHandler = npcHandler, text = "Time is a force we sorcerers will master one day." })
keywordHandler:addKeyword({ "sorcerer" }, StdModule.say, { npcHandler = npcHandler, text = "Any sorcerer dedicates his whole life to the study of the arcane arts." })
keywordHandler:addKeyword({ "power" }, StdModule.say, { npcHandler = npcHandler, text = "We sorcerers wield arcane powers beyond comprehension of men." })
keywordHandler:addKeyword({ "arcane" }, StdModule.say, { npcHandler = npcHandler, text = "We sorcerers wield arcane powers beyond comprehension of men." })

npcHandler:setMessage(MESSAGE_GREET, "Greetings, |PLAYERNAME|.")
npcHandler:setMessage(MESSAGE_FAREWELL, "Take care on your journeys.")
npcHandler:addModule(FocusModule:new(), npcConfig.name, true, true, true)

-- npcType registering the npcConfig table
npcType:register(npcConfig)
