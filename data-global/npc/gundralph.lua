local internalNpcName = "Gundralph"
local npcType = Game.createNpcType(internalNpcName)
local npcConfig = {}

npcConfig.name = internalNpcName
npcConfig.description = internalNpcName

npcConfig.health = 100
npcConfig.maxHealth = npcConfig.health
npcConfig.walkInterval = 2000
npcConfig.walkRadius = 2

npcConfig.outfit = {
	lookType = 9,
}

npcConfig.flags = {
	floorchange = false,
}

npcConfig.voices = {
	interval = 15000,
	chance = 50,
	{ text = "Utevo vis lux!" },
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

keywordHandler:addKeyword(
	{ "spells" },
	StdModule.say,
	{
		npcHandler = npcHandler,
		text = "I can teach you these spells: {Animate Dead}, {Apprentice's Strike}, {Avalanche}, {Buzz}, {Cancel Magic Shield}, {Chameleon}, {Chill Out}, {Convince Creature}, {Creature Illusion}, {Cure Bleeding}, {Cure Burning}, {Cure Electrification}, {Cure Poison}, {Cure Poison Rune}, {Curse}, {Death Strike}, {Destroy Field}, {Disintegrate}, {Electrify}, {Energy Beam}, {Energy Bomb}, {Energy Field}, {Energy Strike}, {Energy Wall}, {Energy Wave}, {Envenom}, {Explosion}, {Expose Weakness}, {Find Fiend}, {Find Person}, {Fire Bomb}, {Fire Field}, {Fire Wall}, {Fire Wave}, {Fireball}, {Flame Strike}, {Food (Spell)}, {Great Energy Beam}, {Great Fire Wave}, {Great Fireball}, {Great Light}, {Haste}, {Heal Friend}, {Heavy Magic Missile}, {Ice Strike}, {Ice Wave}, {Icicle}, {Ignite}, {Intense Healing}, {Intense Healing Rune}, {Invisible}, {Levitate}, {Light}, {Light Healing}, {Light Magic Missile}, {Lightning}, {Magic Patch}, {Magic Rope}, {Magic Shield}, {Magic Wall}, {Mass Healing}, {Mud Attack}, {Nature's Embrace}, {Paralyse}, {Physical Strike}, {Poison Bomb}, {Poison Field}, {Poison Wall}, {Restoration}, {Sap Strength}, {Scorch}, {Soulfire}, {Stalagmite}, {Stone Shower}, {Strong Energy Strike}, {Strong Flame Strike}, {Strong Haste}, {Strong Ice Strike}, {Strong Ice Wave}, {Strong Terra Strike}, {Sudden Death}, {Summon Creature}, {Summon Druid Familiar}, {Summon Sorcerer Familiar}, {Terra Strike}, {Terra Wave}, {Thunderstorm}, {Ultimate Healing}, {Ultimate Healing Rune} and {Ultimate Light}.",
	}
)

local node1 = keywordHandler:addKeyword({ "animate dead" }, StdModule.say, { npcHandler = npcHandler, onlyFocus = true, text = "Would you like to learn {animate dead} magic spell for 1200 gold?" })
node1:addChildKeyword({ "yes" }, StdModule.learnSpell, { npcHandler = npcHandler, premium = false, spellName = "animate dead", vocation = { 1, 2, 5, 6 }, price = 1200, level = 27 })

local node2 = keywordHandler:addKeyword({ "apprentice's strike" }, StdModule.say, { npcHandler = npcHandler, onlyFocus = true, text = "Would you like to learn {apprentice's strike} magic spell for free?" })
node2:addChildKeyword({ "yes" }, StdModule.learnSpell, { npcHandler = npcHandler, premium = false, spellName = "apprentice's strike", vocation = { 1, 2, 5, 6 }, price = 0, level = 8 })

local node3 = keywordHandler:addKeyword({ "avalanche" }, StdModule.say, { npcHandler = npcHandler, onlyFocus = true, text = "Would you like to learn {avalanche} magic spell for 1200 gold?" })
node3:addChildKeyword({ "yes" }, StdModule.learnSpell, { npcHandler = npcHandler, premium = false, spellName = "avalanche", vocation = { 2, 6 }, price = 1200, level = 30 })

local node4 = keywordHandler:addKeyword({ "buzz" }, StdModule.say, { npcHandler = npcHandler, onlyFocus = true, text = "Would you like to learn {buzz} magic spell for free?" })
node4:addChildKeyword({ "yes" }, StdModule.learnSpell, { npcHandler = npcHandler, premium = false, spellName = "buzz", vocation = { 1, 5 }, price = 0, level = 1 })

local node5 = keywordHandler:addKeyword({ "cancel magic shield" }, StdModule.say, { npcHandler = npcHandler, onlyFocus = true, text = "Would you like to learn {cancel magic shield} magic spell for 450 gold?" })
node5:addChildKeyword({ "yes" }, StdModule.learnSpell, { npcHandler = npcHandler, premium = false, spellName = "cancel magic shield", vocation = { 1, 2, 5, 6 }, price = 450, level = 14 })

local node6 = keywordHandler:addKeyword({ "chameleon" }, StdModule.say, { npcHandler = npcHandler, onlyFocus = true, text = "Would you like to learn {chameleon} magic spell for 1300 gold?" })
node6:addChildKeyword({ "yes" }, StdModule.learnSpell, { npcHandler = npcHandler, premium = false, spellName = "chameleon", vocation = { 2, 6 }, price = 1300, level = 27 })

local node7 = keywordHandler:addKeyword({ "chill out" }, StdModule.say, { npcHandler = npcHandler, onlyFocus = true, text = "Would you like to learn {chill out} magic spell for free?" })
node7:addChildKeyword({ "yes" }, StdModule.learnSpell, { npcHandler = npcHandler, premium = false, spellName = "chill out", vocation = { 2, 6 }, price = 0, level = 1 })

local node8 = keywordHandler:addKeyword({ "convince creature" }, StdModule.say, { npcHandler = npcHandler, onlyFocus = true, text = "Would you like to learn {convince creature} magic spell for 800 gold?" })
node8:addChildKeyword({ "yes" }, StdModule.learnSpell, { npcHandler = npcHandler, premium = false, spellName = "convince creature", vocation = { 2, 6 }, price = 800, level = 16 })

local node9 = keywordHandler:addKeyword({ "creature illusion" }, StdModule.say, { npcHandler = npcHandler, onlyFocus = true, text = "Would you like to learn {creature illusion} magic spell for 1000 gold?" })
node9:addChildKeyword({ "yes" }, StdModule.learnSpell, { npcHandler = npcHandler, premium = false, spellName = "creature illusion", vocation = { 1, 2, 5, 6 }, price = 1000, level = 23 })

local node10 = keywordHandler:addKeyword({ "cure bleeding" }, StdModule.say, { npcHandler = npcHandler, onlyFocus = true, text = "Would you like to learn {cure bleeding} magic spell for 2500 gold?" })
node10:addChildKeyword({ "yes" }, StdModule.learnSpell, { npcHandler = npcHandler, premium = false, spellName = "cure bleeding", vocation = { 2, 4, 6, 8 }, price = 2500, level = 45 })

local node11 = keywordHandler:addKeyword({ "cure burning" }, StdModule.say, { npcHandler = npcHandler, onlyFocus = true, text = "Would you like to learn {cure burning} magic spell for 2000 gold?" })
node11:addChildKeyword({ "yes" }, StdModule.learnSpell, { npcHandler = npcHandler, premium = false, spellName = "cure burning", vocation = { 2, 6 }, price = 2000, level = 30 })

local node12 = keywordHandler:addKeyword({ "cure electrification" }, StdModule.say, { npcHandler = npcHandler, onlyFocus = true, text = "Would you like to learn {cure electrification} magic spell for 1000 gold?" })
node12:addChildKeyword({ "yes" }, StdModule.learnSpell, { npcHandler = npcHandler, premium = false, spellName = "cure electrification", vocation = { 2, 6 }, price = 1000, level = 22 })

local node13 = keywordHandler:addKeyword({ "cure poison" }, StdModule.say, { npcHandler = npcHandler, onlyFocus = true, text = "Would you like to learn {cure poison} magic spell for 150 gold?" })
node13:addChildKeyword({ "yes" }, StdModule.learnSpell, { npcHandler = npcHandler, premium = false, spellName = "cure poison", vocation = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 }, price = 150, level = 10 })

local node14 = keywordHandler:addKeyword({ "cure poison rune" }, StdModule.say, { npcHandler = npcHandler, onlyFocus = true, text = "Would you like to learn {cure poison rune} magic spell for 600 gold?" })
node14:addChildKeyword({ "yes" }, StdModule.learnSpell, { npcHandler = npcHandler, premium = false, spellName = "cure poison rune", vocation = { 2, 6 }, price = 600, level = 15 })

local node15 = keywordHandler:addKeyword({ "curse" }, StdModule.say, { npcHandler = npcHandler, onlyFocus = true, text = "Would you like to learn {curse} magic spell for 6000 gold?" })
node15:addChildKeyword({ "yes" }, StdModule.learnSpell, { npcHandler = npcHandler, premium = false, spellName = "curse", vocation = { 1, 5 }, price = 6000, level = 75 })

local node16 = keywordHandler:addKeyword({ "death strike" }, StdModule.say, { npcHandler = npcHandler, onlyFocus = true, text = "Would you like to learn {death strike} magic spell for 800 gold?" })
node16:addChildKeyword({ "yes" }, StdModule.learnSpell, { npcHandler = npcHandler, premium = false, spellName = "death strike", vocation = { 1, 5 }, price = 800, level = 16 })

local node17 = keywordHandler:addKeyword({ "destroy field" }, StdModule.say, { npcHandler = npcHandler, onlyFocus = true, text = "Would you like to learn {destroy field} magic spell for 700 gold?" })
node17:addChildKeyword({ "yes" }, StdModule.learnSpell, { npcHandler = npcHandler, premium = false, spellName = "destroy field", vocation = { 1, 2, 3, 5, 6, 7, 9, 10 }, price = 700, level = 17 })

local node18 = keywordHandler:addKeyword({ "disintegrate" }, StdModule.say, { npcHandler = npcHandler, onlyFocus = true, text = "Would you like to learn {disintegrate} magic spell for 900 gold?" })
node18:addChildKeyword({ "yes" }, StdModule.learnSpell, { npcHandler = npcHandler, premium = false, spellName = "disintegrate", vocation = { 1, 2, 5, 6 }, price = 900, level = 21 })

local node19 = keywordHandler:addKeyword({ "electrify" }, StdModule.say, { npcHandler = npcHandler, onlyFocus = true, text = "Would you like to learn {electrify} magic spell for 2500 gold?" })
node19:addChildKeyword({ "yes" }, StdModule.learnSpell, { npcHandler = npcHandler, premium = false, spellName = "electrify", vocation = { 1, 5 }, price = 2500, level = 34 })

local node20 = keywordHandler:addKeyword({ "energy beam" }, StdModule.say, { npcHandler = npcHandler, onlyFocus = true, text = "Would you like to learn {energy beam} magic spell for 1000 gold?" })
node20:addChildKeyword({ "yes" }, StdModule.learnSpell, { npcHandler = npcHandler, premium = false, spellName = "energy beam", vocation = { 1, 5 }, price = 1000, level = 23 })

local node21 = keywordHandler:addKeyword({ "energy bomb" }, StdModule.say, { npcHandler = npcHandler, onlyFocus = true, text = "Would you like to learn {energy bomb} magic spell for 2300 gold?" })
node21:addChildKeyword({ "yes" }, StdModule.learnSpell, { npcHandler = npcHandler, premium = false, spellName = "energy bomb", vocation = { 1, 5 }, price = 2300, level = 37 })

local node22 = keywordHandler:addKeyword({ "energy field" }, StdModule.say, { npcHandler = npcHandler, onlyFocus = true, text = "Would you like to learn {energy field} magic spell for 700 gold?" })
node22:addChildKeyword({ "yes" }, StdModule.learnSpell, { npcHandler = npcHandler, premium = false, spellName = "energy field", vocation = { 1, 2, 5, 6 }, price = 700, level = 18 })

local node23 = keywordHandler:addKeyword({ "energy strike" }, StdModule.say, { npcHandler = npcHandler, onlyFocus = true, text = "Would you like to learn {energy strike} magic spell for 800 gold?" })
node23:addChildKeyword({ "yes" }, StdModule.learnSpell, { npcHandler = npcHandler, premium = false, spellName = "energy strike", vocation = { 1, 2, 5, 6 }, price = 800, level = 12 })

local node24 = keywordHandler:addKeyword({ "energy wall" }, StdModule.say, { npcHandler = npcHandler, onlyFocus = true, text = "Would you like to learn {energy wall} magic spell for 2500 gold?" })
node24:addChildKeyword({ "yes" }, StdModule.learnSpell, { npcHandler = npcHandler, premium = false, spellName = "energy wall", vocation = { 1, 2, 5, 6 }, price = 2500, level = 41 })

local node25 = keywordHandler:addKeyword({ "energy wave" }, StdModule.say, { npcHandler = npcHandler, onlyFocus = true, text = "Would you like to learn {energy wave} magic spell for 2500 gold?" })
node25:addChildKeyword({ "yes" }, StdModule.learnSpell, { npcHandler = npcHandler, premium = false, spellName = "energy wave", vocation = { 1, 5 }, price = 2500, level = 38 })

local node26 = keywordHandler:addKeyword({ "envenom" }, StdModule.say, { npcHandler = npcHandler, onlyFocus = true, text = "Would you like to learn {envenom} magic spell for 6000 gold?" })
node26:addChildKeyword({ "yes" }, StdModule.learnSpell, { npcHandler = npcHandler, premium = false, spellName = "envenom", vocation = { 2, 6 }, price = 6000, level = 50 })

local node27 = keywordHandler:addKeyword({ "explosion" }, StdModule.say, { npcHandler = npcHandler, onlyFocus = true, text = "Would you like to learn {explosion} magic spell for 1800 gold?" })
node27:addChildKeyword({ "yes" }, StdModule.learnSpell, { npcHandler = npcHandler, premium = false, spellName = "explosion", vocation = { 1, 2, 5, 6 }, price = 1800, level = 31 })

local node28 = keywordHandler:addKeyword({ "expose weakness" }, StdModule.say, { npcHandler = npcHandler, onlyFocus = true, text = "Would you like to learn {expose weakness} magic spell for 400000 gold?" })
node28:addChildKeyword({ "yes" }, StdModule.learnSpell, { npcHandler = npcHandler, premium = false, spellName = "expose weakness", vocation = { 1, 5 }, price = 400000, level = 275 })

local node29 = keywordHandler:addKeyword({ "find fiend" }, StdModule.say, { npcHandler = npcHandler, onlyFocus = true, text = "Would you like to learn {find fiend} magic spell for 1000 gold?" })
node29:addChildKeyword({ "yes" }, StdModule.learnSpell, { npcHandler = npcHandler, premium = false, spellName = "find fiend", vocation = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 }, price = 1000, level = 25 })

local node30 = keywordHandler:addKeyword({ "find person" }, StdModule.say, { npcHandler = npcHandler, onlyFocus = true, text = "Would you like to learn {find person} magic spell for 80 gold?" })
node30:addChildKeyword({ "yes" }, StdModule.learnSpell, { npcHandler = npcHandler, premium = false, spellName = "find person", vocation = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 }, price = 80, level = 8 })

local node31 = keywordHandler:addKeyword({ "fire bomb" }, StdModule.say, { npcHandler = npcHandler, onlyFocus = true, text = "Would you like to learn {fire bomb} magic spell for 1500 gold?" })
node31:addChildKeyword({ "yes" }, StdModule.learnSpell, { npcHandler = npcHandler, premium = false, spellName = "fire bomb", vocation = { 1, 2, 5, 6 }, price = 1500, level = 27 })

local node32 = keywordHandler:addKeyword({ "fire field" }, StdModule.say, { npcHandler = npcHandler, onlyFocus = true, text = "Would you like to learn {fire field} magic spell for 500 gold?" })
node32:addChildKeyword({ "yes" }, StdModule.learnSpell, { npcHandler = npcHandler, premium = false, spellName = "fire field", vocation = { 1, 2, 5, 6 }, price = 500, level = 15 })

local node33 = keywordHandler:addKeyword({ "fire wall" }, StdModule.say, { npcHandler = npcHandler, onlyFocus = true, text = "Would you like to learn {fire wall} magic spell for 2000 gold?" })
node33:addChildKeyword({ "yes" }, StdModule.learnSpell, { npcHandler = npcHandler, premium = false, spellName = "fire wall", vocation = { 1, 2, 5, 6 }, price = 2000, level = 33 })

local node34 = keywordHandler:addKeyword({ "fire wave" }, StdModule.say, { npcHandler = npcHandler, onlyFocus = true, text = "Would you like to learn {fire wave} magic spell for 850 gold?" })
node34:addChildKeyword({ "yes" }, StdModule.learnSpell, { npcHandler = npcHandler, premium = false, spellName = "fire wave", vocation = { 1, 5 }, price = 850, level = 18 })

local node35 = keywordHandler:addKeyword({ "fireball" }, StdModule.say, { npcHandler = npcHandler, onlyFocus = true, text = "Would you like to learn {fireball} magic spell for 1600 gold?" })
node35:addChildKeyword({ "yes" }, StdModule.learnSpell, { npcHandler = npcHandler, premium = false, spellName = "fireball", vocation = { 1, 5 }, price = 1600, level = 27 })

local node36 = keywordHandler:addKeyword({ "flame strike" }, StdModule.say, { npcHandler = npcHandler, onlyFocus = true, text = "Would you like to learn {flame strike} magic spell for 800 gold?" })
node36:addChildKeyword({ "yes" }, StdModule.learnSpell, { npcHandler = npcHandler, premium = false, spellName = "flame strike", vocation = { 1, 2, 5, 6 }, price = 800, level = 14 })

local node37 = keywordHandler:addKeyword({ "food (spell)" }, StdModule.say, { npcHandler = npcHandler, onlyFocus = true, text = "Would you like to learn {food (spell)} magic spell for 300 gold?" })
node37:addChildKeyword({ "yes" }, StdModule.learnSpell, { npcHandler = npcHandler, premium = false, spellName = "food (spell)", vocation = { 2, 6 }, price = 300, level = 14 })

local node38 = keywordHandler:addKeyword({ "great energy beam" }, StdModule.say, { npcHandler = npcHandler, onlyFocus = true, text = "Would you like to learn {great energy beam} magic spell for 1800 gold?" })
node38:addChildKeyword({ "yes" }, StdModule.learnSpell, { npcHandler = npcHandler, premium = false, spellName = "great energy beam", vocation = { 1, 5 }, price = 1800, level = 29 })

local node39 = keywordHandler:addKeyword({ "great fire wave" }, StdModule.say, { npcHandler = npcHandler, onlyFocus = true, text = "Would you like to learn {great fire wave} magic spell for 25000 gold?" })
node39:addChildKeyword({ "yes" }, StdModule.learnSpell, { npcHandler = npcHandler, premium = false, spellName = "great fire wave", vocation = { 1, 5 }, price = 25000, level = 38 })

local node40 = keywordHandler:addKeyword({ "great fireball" }, StdModule.say, { npcHandler = npcHandler, onlyFocus = true, text = "Would you like to learn {great fireball} magic spell for 1200 gold?" })
node40:addChildKeyword({ "yes" }, StdModule.learnSpell, { npcHandler = npcHandler, premium = false, spellName = "great fireball", vocation = { 1, 5 }, price = 1200, level = 30 })

local node41 = keywordHandler:addKeyword({ "great light" }, StdModule.say, { npcHandler = npcHandler, onlyFocus = true, text = "Would you like to learn {great light} magic spell for 500 gold?" })
node41:addChildKeyword({ "yes" }, StdModule.learnSpell, { npcHandler = npcHandler, premium = false, spellName = "great light", vocation = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 }, price = 500, level = 13 })

local node42 = keywordHandler:addKeyword({ "haste" }, StdModule.say, { npcHandler = npcHandler, onlyFocus = true, text = "Would you like to learn {haste} magic spell for 600 gold?" })
node42:addChildKeyword({ "yes" }, StdModule.learnSpell, { npcHandler = npcHandler, premium = false, spellName = "haste", vocation = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 }, price = 600, level = 14 })

local node43 = keywordHandler:addKeyword({ "heal friend" }, StdModule.say, { npcHandler = npcHandler, onlyFocus = true, text = "Would you like to learn {heal friend} magic spell for 800 gold?" })
node43:addChildKeyword({ "yes" }, StdModule.learnSpell, { npcHandler = npcHandler, premium = false, spellName = "heal friend", vocation = { 2, 6 }, price = 800, level = 18 })

local node44 = keywordHandler:addKeyword({ "heavy magic missile" }, StdModule.say, { npcHandler = npcHandler, onlyFocus = true, text = "Would you like to learn {heavy magic missile} magic spell for 1500 gold?" })
node44:addChildKeyword({ "yes" }, StdModule.learnSpell, { npcHandler = npcHandler, premium = false, spellName = "heavy magic missile", vocation = { 1, 2, 5, 6 }, price = 1500, level = 25 })

local node45 = keywordHandler:addKeyword({ "ice strike" }, StdModule.say, { npcHandler = npcHandler, onlyFocus = true, text = "Would you like to learn {ice strike} magic spell for 800 gold?" })
node45:addChildKeyword({ "yes" }, StdModule.learnSpell, { npcHandler = npcHandler, premium = false, spellName = "ice strike", vocation = { 1, 2, 5, 6 }, price = 800, level = 15 })

local node46 = keywordHandler:addKeyword({ "ice wave" }, StdModule.say, { npcHandler = npcHandler, onlyFocus = true, text = "Would you like to learn {ice wave} magic spell for 850 gold?" })
node46:addChildKeyword({ "yes" }, StdModule.learnSpell, { npcHandler = npcHandler, premium = false, spellName = "ice wave", vocation = { 2, 6 }, price = 850, level = 18 })

local node47 = keywordHandler:addKeyword({ "icicle" }, StdModule.say, { npcHandler = npcHandler, onlyFocus = true, text = "Would you like to learn {icicle} magic spell for 1700 gold?" })
node47:addChildKeyword({ "yes" }, StdModule.learnSpell, { npcHandler = npcHandler, premium = false, spellName = "icicle", vocation = { 2, 6 }, price = 1700, level = 28 })

local node48 = keywordHandler:addKeyword({ "ignite" }, StdModule.say, { npcHandler = npcHandler, onlyFocus = true, text = "Would you like to learn {ignite} magic spell for 1500 gold?" })
node48:addChildKeyword({ "yes" }, StdModule.learnSpell, { npcHandler = npcHandler, premium = false, spellName = "ignite", vocation = { 1, 5 }, price = 1500, level = 26 })

local node49 = keywordHandler:addKeyword({ "intense healing" }, StdModule.say, { npcHandler = npcHandler, onlyFocus = true, text = "Would you like to learn {intense healing} magic spell for 350 gold?" })
node49:addChildKeyword({ "yes" }, StdModule.learnSpell, { npcHandler = npcHandler, premium = false, spellName = "intense healing", vocation = { 1, 2, 3, 5, 6, 7, 9, 10 }, price = 350, level = 20 })

local node50 = keywordHandler:addKeyword({ "intense healing rune" }, StdModule.say, { npcHandler = npcHandler, onlyFocus = true, text = "Would you like to learn {intense healing rune} magic spell for 600 gold?" })
node50:addChildKeyword({ "yes" }, StdModule.learnSpell, { npcHandler = npcHandler, premium = false, spellName = "intense healing rune", vocation = { 2, 6 }, price = 600, level = 15 })

local node51 = keywordHandler:addKeyword({ "invisible" }, StdModule.say, { npcHandler = npcHandler, onlyFocus = true, text = "Would you like to learn {invisible} magic spell for 2000 gold?" })
node51:addChildKeyword({ "yes" }, StdModule.learnSpell, { npcHandler = npcHandler, premium = false, spellName = "invisible", vocation = { 1, 2, 5, 6 }, price = 2000, level = 35 })

local node52 = keywordHandler:addKeyword({ "levitate" }, StdModule.say, { npcHandler = npcHandler, onlyFocus = true, text = "Would you like to learn {levitate} magic spell for 500 gold?" })
node52:addChildKeyword({ "yes" }, StdModule.learnSpell, { npcHandler = npcHandler, premium = false, spellName = "levitate", vocation = { 1, 2, 5, 6 }, price = 500, level = 12 })

local node53 = keywordHandler:addKeyword({ "light" }, StdModule.say, { npcHandler = npcHandler, onlyFocus = true, text = "Would you like to learn {light} magic spell for free?" })
node53:addChildKeyword({ "yes" }, StdModule.learnSpell, { npcHandler = npcHandler, premium = false, spellName = "light", vocation = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 }, price = 0, level = 8 })

local node54 = keywordHandler:addKeyword({ "light healing" }, StdModule.say, { npcHandler = npcHandler, onlyFocus = true, text = "Would you like to learn {light healing} magic spell for free?" })
node54:addChildKeyword({ "yes" }, StdModule.learnSpell, { npcHandler = npcHandler, premium = false, spellName = "light healing", vocation = { 1, 2, 3, 5, 6, 7, 9, 10 }, price = 0, level = 8 })

local node55 = keywordHandler:addKeyword({ "light magic missile" }, StdModule.say, { npcHandler = npcHandler, onlyFocus = true, text = "Would you like to learn {light magic missile} magic spell for 500 gold?" })
node55:addChildKeyword({ "yes" }, StdModule.learnSpell, { npcHandler = npcHandler, premium = false, spellName = "light magic missile", vocation = { 1, 2, 5, 6 }, price = 500, level = 15 })

local node56 = keywordHandler:addKeyword({ "lightning" }, StdModule.say, { npcHandler = npcHandler, onlyFocus = true, text = "Would you like to learn {lightning} magic spell for 5000 gold?" })
node56:addChildKeyword({ "yes" }, StdModule.learnSpell, { npcHandler = npcHandler, premium = false, spellName = "lightning", vocation = { 1, 5 }, price = 5000, level = 55 })

local node57 = keywordHandler:addKeyword({ "magic patch" }, StdModule.say, { npcHandler = npcHandler, onlyFocus = true, text = "Would you like to learn {magic patch} magic spell for free?" })
node57:addChildKeyword({ "yes" }, StdModule.learnSpell, { npcHandler = npcHandler, premium = false, spellName = "magic patch", vocation = { 1, 2, 5, 6 }, price = 0, level = 1 })

local node58 = keywordHandler:addKeyword({ "magic rope" }, StdModule.say, { npcHandler = npcHandler, onlyFocus = true, text = "Would you like to learn {magic rope} magic spell for 200 gold?" })
node58:addChildKeyword({ "yes" }, StdModule.learnSpell, { npcHandler = npcHandler, premium = false, spellName = "magic rope", vocation = { 1, 2, 5, 6 }, price = 200, level = 9 })

local node59 = keywordHandler:addKeyword({ "magic shield" }, StdModule.say, { npcHandler = npcHandler, onlyFocus = true, text = "Would you like to learn {magic shield} magic spell for 450 gold?" })
node59:addChildKeyword({ "yes" }, StdModule.learnSpell, { npcHandler = npcHandler, premium = false, spellName = "magic shield", vocation = { 1, 2, 5, 6 }, price = 450, level = 14 })

local node60 = keywordHandler:addKeyword({ "magic wall" }, StdModule.say, { npcHandler = npcHandler, onlyFocus = true, text = "Would you like to learn {magic wall} magic spell for 2100 gold?" })
node60:addChildKeyword({ "yes" }, StdModule.learnSpell, { npcHandler = npcHandler, premium = false, spellName = "magic wall", vocation = { 1, 5 }, price = 2100, level = 32 })

local node61 = keywordHandler:addKeyword({ "mass healing" }, StdModule.say, { npcHandler = npcHandler, onlyFocus = true, text = "Would you like to learn {mass healing} magic spell for 2200 gold?" })
node61:addChildKeyword({ "yes" }, StdModule.learnSpell, { npcHandler = npcHandler, premium = false, spellName = "mass healing", vocation = { 2, 6 }, price = 2200, level = 36 })

local node62 = keywordHandler:addKeyword({ "mud attack" }, StdModule.say, { npcHandler = npcHandler, onlyFocus = true, text = "Would you like to learn {mud attack} magic spell for free?" })
node62:addChildKeyword({ "yes" }, StdModule.learnSpell, { npcHandler = npcHandler, premium = false, spellName = "mud attack", vocation = { 2, 6 }, price = 0, level = 1 })

local node63 = keywordHandler:addKeyword({ "nature's embrace" }, StdModule.say, { npcHandler = npcHandler, onlyFocus = true, text = "Would you like to learn {nature's embrace} magic spell for 500000 gold?" })
node63:addChildKeyword({ "yes" }, StdModule.learnSpell, { npcHandler = npcHandler, premium = false, spellName = "nature's embrace", vocation = { 2, 6 }, price = 500000, level = 300 })

local node64 = keywordHandler:addKeyword({ "paralyse" }, StdModule.say, { npcHandler = npcHandler, onlyFocus = true, text = "Would you like to learn {paralyse} magic spell for 1900 gold?" })
node64:addChildKeyword({ "yes" }, StdModule.learnSpell, { npcHandler = npcHandler, premium = false, spellName = "paralyse", vocation = { 2, 6 }, price = 1900, level = 54 })

local node65 = keywordHandler:addKeyword({ "physical strike" }, StdModule.say, { npcHandler = npcHandler, onlyFocus = true, text = "Would you like to learn {physical strike} magic spell for 800 gold?" })
node65:addChildKeyword({ "yes" }, StdModule.learnSpell, { npcHandler = npcHandler, premium = false, spellName = "physical strike", vocation = { 2, 6 }, price = 800, level = 16 })

local node66 = keywordHandler:addKeyword({ "poison bomb" }, StdModule.say, { npcHandler = npcHandler, onlyFocus = true, text = "Would you like to learn {poison bomb} magic spell for 1000 gold?" })
node66:addChildKeyword({ "yes" }, StdModule.learnSpell, { npcHandler = npcHandler, premium = false, spellName = "poison bomb", vocation = { 2, 6 }, price = 1000, level = 25 })

local node67 = keywordHandler:addKeyword({ "poison field" }, StdModule.say, { npcHandler = npcHandler, onlyFocus = true, text = "Would you like to learn {poison field} magic spell for 300 gold?" })
node67:addChildKeyword({ "yes" }, StdModule.learnSpell, { npcHandler = npcHandler, premium = false, spellName = "poison field", vocation = { 1, 2, 5, 6 }, price = 300, level = 14 })

local node68 = keywordHandler:addKeyword({ "poison wall" }, StdModule.say, { npcHandler = npcHandler, onlyFocus = true, text = "Would you like to learn {poison wall} magic spell for 1600 gold?" })
node68:addChildKeyword({ "yes" }, StdModule.learnSpell, { npcHandler = npcHandler, premium = false, spellName = "poison wall", vocation = { 1, 2, 5, 6 }, price = 1600, level = 29 })

local node69 = keywordHandler:addKeyword({ "restoration" }, StdModule.say, { npcHandler = npcHandler, onlyFocus = true, text = "Would you like to learn {restoration} magic spell for 500000 gold?" })
node69:addChildKeyword({ "yes" }, StdModule.learnSpell, { npcHandler = npcHandler, premium = false, spellName = "restoration", vocation = { 1, 2, 5, 6 }, price = 500000, level = 300 })

local node70 = keywordHandler:addKeyword({ "sap strength" }, StdModule.say, { npcHandler = npcHandler, onlyFocus = true, text = "Would you like to learn {sap strength} magic spell for 200000 gold?" })
node70:addChildKeyword({ "yes" }, StdModule.learnSpell, { npcHandler = npcHandler, premium = false, spellName = "sap strength", vocation = { 1, 5 }, price = 200000, level = 175 })

local node71 = keywordHandler:addKeyword({ "scorch" }, StdModule.say, { npcHandler = npcHandler, onlyFocus = true, text = "Would you like to learn {scorch} magic spell for free?" })
node71:addChildKeyword({ "yes" }, StdModule.learnSpell, { npcHandler = npcHandler, premium = false, spellName = "scorch", vocation = { 1, 5 }, price = 0, level = 1 })

local node72 = keywordHandler:addKeyword({ "soulfire" }, StdModule.say, { npcHandler = npcHandler, onlyFocus = true, text = "Would you like to learn {soulfire} magic spell for 1800 gold?" })
node72:addChildKeyword({ "yes" }, StdModule.learnSpell, { npcHandler = npcHandler, premium = false, spellName = "soulfire", vocation = { 1, 2, 5, 6 }, price = 1800, level = 27 })

local node73 = keywordHandler:addKeyword({ "stalagmite" }, StdModule.say, { npcHandler = npcHandler, onlyFocus = true, text = "Would you like to learn {stalagmite} magic spell for 1400 gold?" })
node73:addChildKeyword({ "yes" }, StdModule.learnSpell, { npcHandler = npcHandler, premium = false, spellName = "stalagmite", vocation = { 1, 2, 5, 6 }, price = 1400, level = 24 })

local node74 = keywordHandler:addKeyword({ "stone shower" }, StdModule.say, { npcHandler = npcHandler, onlyFocus = true, text = "Would you like to learn {stone shower} magic spell for 1100 gold?" })
node74:addChildKeyword({ "yes" }, StdModule.learnSpell, { npcHandler = npcHandler, premium = false, spellName = "stone shower", vocation = { 2, 6 }, price = 1100, level = 28 })

local node75 = keywordHandler:addKeyword({ "strong energy strike" }, StdModule.say, { npcHandler = npcHandler, onlyFocus = true, text = "Would you like to learn {strong energy strike} magic spell for 7500 gold?" })
node75:addChildKeyword({ "yes" }, StdModule.learnSpell, { npcHandler = npcHandler, premium = false, spellName = "strong energy strike", vocation = { 1, 5 }, price = 7500, level = 80 })

local node76 = keywordHandler:addKeyword({ "strong flame strike" }, StdModule.say, { npcHandler = npcHandler, onlyFocus = true, text = "Would you like to learn {strong flame strike} magic spell for 6000 gold?" })
node76:addChildKeyword({ "yes" }, StdModule.learnSpell, { npcHandler = npcHandler, premium = false, spellName = "strong flame strike", vocation = { 1, 5 }, price = 6000, level = 70 })

local node77 = keywordHandler:addKeyword({ "strong haste" }, StdModule.say, { npcHandler = npcHandler, onlyFocus = true, text = "Would you like to learn {strong haste} magic spell for 1300 gold?" })
node77:addChildKeyword({ "yes" }, StdModule.learnSpell, { npcHandler = npcHandler, premium = false, spellName = "strong haste", vocation = { 1, 2, 5, 6, 9, 10 }, price = 1300, level = 20 })

local node78 = keywordHandler:addKeyword({ "strong ice strike" }, StdModule.say, { npcHandler = npcHandler, onlyFocus = true, text = "Would you like to learn {strong ice strike} magic spell for 6000 gold?" })
node78:addChildKeyword({ "yes" }, StdModule.learnSpell, { npcHandler = npcHandler, premium = false, spellName = "strong ice strike", vocation = { 2, 6 }, price = 6000, level = 80 })

local node79 = keywordHandler:addKeyword({ "strong ice wave" }, StdModule.say, { npcHandler = npcHandler, onlyFocus = true, text = "Would you like to learn {strong ice wave} magic spell for 7500 gold?" })
node79:addChildKeyword({ "yes" }, StdModule.learnSpell, { npcHandler = npcHandler, premium = false, spellName = "strong ice wave", vocation = { 2, 6 }, price = 7500, level = 40 })

local node80 = keywordHandler:addKeyword({ "strong terra strike" }, StdModule.say, { npcHandler = npcHandler, onlyFocus = true, text = "Would you like to learn {strong terra strike} magic spell for 6000 gold?" })
node80:addChildKeyword({ "yes" }, StdModule.learnSpell, { npcHandler = npcHandler, premium = false, spellName = "strong terra strike", vocation = { 2, 6 }, price = 6000, level = 70 })

local node81 = keywordHandler:addKeyword({ "sudden death" }, StdModule.say, { npcHandler = npcHandler, onlyFocus = true, text = "Would you like to learn {sudden death} magic spell for 3000 gold?" })
node81:addChildKeyword({ "yes" }, StdModule.learnSpell, { npcHandler = npcHandler, premium = false, spellName = "sudden death", vocation = { 1, 5 }, price = 3000, level = 45 })

local node82 = keywordHandler:addKeyword({ "summon creature" }, StdModule.say, { npcHandler = npcHandler, onlyFocus = true, text = "Would you like to learn {summon creature} magic spell for 2000 gold?" })
node82:addChildKeyword({ "yes" }, StdModule.learnSpell, { npcHandler = npcHandler, premium = false, spellName = "summon creature", vocation = { 1, 2, 5, 6 }, price = 2000, level = 25 })

local node83 = keywordHandler:addKeyword({ "summon druid familiar" }, StdModule.say, { npcHandler = npcHandler, onlyFocus = true, text = "Would you like to learn {summon druid familiar} magic spell for 50000 gold?" })
node83:addChildKeyword({ "yes" }, StdModule.learnSpell, { npcHandler = npcHandler, premium = false, spellName = "summon druid familiar", vocation = { 2, 6 }, price = 50000, level = 200 })

local node84 = keywordHandler:addKeyword({ "summon sorcerer familiar" }, StdModule.say, { npcHandler = npcHandler, onlyFocus = true, text = "Would you like to learn {summon sorcerer familiar} magic spell for 50000 gold?" })
node84:addChildKeyword({ "yes" }, StdModule.learnSpell, { npcHandler = npcHandler, premium = false, spellName = "summon sorcerer familiar", vocation = { 1, 5 }, price = 50000, level = 200 })

local node85 = keywordHandler:addKeyword({ "terra strike" }, StdModule.say, { npcHandler = npcHandler, onlyFocus = true, text = "Would you like to learn {terra strike} magic spell for 800 gold?" })
node85:addChildKeyword({ "yes" }, StdModule.learnSpell, { npcHandler = npcHandler, premium = false, spellName = "terra strike", vocation = { 1, 2, 5, 6 }, price = 800, level = 13 })

local node86 = keywordHandler:addKeyword({ "terra wave" }, StdModule.say, { npcHandler = npcHandler, onlyFocus = true, text = "Would you like to learn {terra wave} magic spell for 2500 gold?" })
node86:addChildKeyword({ "yes" }, StdModule.learnSpell, { npcHandler = npcHandler, premium = false, spellName = "terra wave", vocation = { 2, 6 }, price = 2500, level = 38 })

local node87 = keywordHandler:addKeyword({ "thunderstorm" }, StdModule.say, { npcHandler = npcHandler, onlyFocus = true, text = "Would you like to learn {thunderstorm} magic spell for 1100 gold?" })
node87:addChildKeyword({ "yes" }, StdModule.learnSpell, { npcHandler = npcHandler, premium = false, spellName = "thunderstorm", vocation = { 1, 5 }, price = 1100, level = 28 })

local node88 = keywordHandler:addKeyword({ "ultimate healing" }, StdModule.say, { npcHandler = npcHandler, onlyFocus = true, text = "Would you like to learn {ultimate healing} magic spell for 1000 gold?" })
node88:addChildKeyword({ "yes" }, StdModule.learnSpell, { npcHandler = npcHandler, premium = false, spellName = "ultimate healing", vocation = { 1, 2, 5, 6 }, price = 1000, level = 30 })

local node89 = keywordHandler:addKeyword({ "ultimate healing rune" }, StdModule.say, { npcHandler = npcHandler, onlyFocus = true, text = "Would you like to learn {ultimate healing rune} magic spell for 1500 gold?" })
node89:addChildKeyword({ "yes" }, StdModule.learnSpell, { npcHandler = npcHandler, premium = false, spellName = "ultimate healing rune", vocation = { 2, 6 }, price = 1500, level = 24 })

local node90 = keywordHandler:addKeyword({ "ultimate light" }, StdModule.say, { npcHandler = npcHandler, onlyFocus = true, text = "Would you like to learn {ultimate light} magic spell for 1600 gold?" })
node90:addChildKeyword({ "yes" }, StdModule.learnSpell, { npcHandler = npcHandler, premium = false, spellName = "ultimate light", vocation = { 1, 2, 5, 6 }, price = 1600, level = 26 })

npcHandler:addModule(FocusModule:new(), npcConfig.name, true, true, true)

-- npcType registering the npcConfig table
npcType:register(npcConfig)
