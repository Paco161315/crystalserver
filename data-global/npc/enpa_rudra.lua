local internalNpcName = "Enpa Rudra"
local npcType = Game.createNpcType(internalNpcName)
local npcConfig = {}

npcConfig.name = internalNpcName
npcConfig.description = internalNpcName

npcConfig.health = 100
npcConfig.maxHealth = npcConfig.health
npcConfig.walkInterval = 2000
npcConfig.walkRadius = 2

npcConfig.outfit = {
	lookType = 1816,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 81,
	lookAddons = 3,
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

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new(), npcConfig.name, true, true, true)

npcType.onBuyItem = function(npc, player, itemId, subType, amount, ignore, inBackpacks, totalCost)
	npc:sellItem(player, itemId, amount, subType, 0, ignore, inBackpacks)
end

npcType.onSellItem = function(npc, player, itemId, subtype, amount, ignore, name, totalCost)
	player:sendTextMessage(MESSAGE_TRADE, string.format("Sold %ix %s for %i gold.", amount, name, totalCost))
end

keywordHandler:addKeyword(
	{ "spells" },
	StdModule.say,
	{
		npcHandler = npcHandler,
		text = "I can teach you these spells: {Magic Patch}, {Tiger Clash}, {Swift Jab}, {Light Healing}, {Find Person}, {Light}, {Magic Rope}, {Cure Poison}, {Levitate}, {Great Light}, {Haste}, {Double Jab}, {Restore Balance}, {Greater Tiger Clash}, {Intense Healing}, {Strong Haste}, {Find Fiend}, {Enlighten Party}, {Flurry of Blows}, {Sweeping Takedown}, {Chained Penance}, {Spirit Mend}, {Greater Flurry of Blows}, {Devastating Knockout}, {Mass Spirit Mend}, {Focus Serenity}, {Mentor Other}, {Balanced Brawl} and {Summon Monk Familiar}.",
	}
)

local node1 = keywordHandler:addKeyword({ "magic patch" }, StdModule.say, { npcHandler = npcHandler, onlyFocus = true, text = "Would you like to learn {magic patch} magic spell for free?" })
node1:addChildKeyword({ "yes" }, StdModule.learnSpell, { npcHandler = npcHandler, premium = false, spellName = "magic patch", vocation = { 1, 2, 3, 5, 6, 7, 9, 10 }, price = 0, level = 1 })

local node2 = keywordHandler:addKeyword({ "tiger clash" }, StdModule.say, { npcHandler = npcHandler, onlyFocus = true, text = "Would you like to learn {tiger clash} magic spell for free?" })
node2:addChildKeyword({ "yes" }, StdModule.learnSpell, { npcHandler = npcHandler, premium = false, spellName = "tiger clash", vocation = { 9, 10 }, price = 0, level = 1 })

local node3 = keywordHandler:addKeyword({ "swift jab" }, StdModule.say, { npcHandler = npcHandler, onlyFocus = true, text = "Would you like to learn {swift jab} magic spell for free?" })
node3:addChildKeyword({ "yes" }, StdModule.learnSpell, { npcHandler = npcHandler, premium = false, spellName = "swift jab", vocation = { 9, 10 }, price = 0, level = 1 })

local node4 = keywordHandler:addKeyword({ "light healing" }, StdModule.say, { npcHandler = npcHandler, onlyFocus = true, text = "Would you like to learn {light healing} magic spell for free?" })
node4:addChildKeyword({ "yes" }, StdModule.learnSpell, { npcHandler = npcHandler, premium = false, spellName = "light healing", vocation = { 1, 2, 3, 5, 6, 7, 9, 10 }, price = 0, level = 8 })

local node5 = keywordHandler:addKeyword({ "find person" }, StdModule.say, { npcHandler = npcHandler, onlyFocus = true, text = "Would you like to learn {find person} magic spell for 80 gold?" })
node5:addChildKeyword({ "yes" }, StdModule.learnSpell, { npcHandler = npcHandler, premium = false, spellName = "find person", vocation = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 }, price = 80, level = 8 })

local node6 = keywordHandler:addKeyword({ "magic rope" }, StdModule.say, { npcHandler = npcHandler, onlyFocus = true, text = "Would you like to learn {magic rope} magic spell for 200 gold?" })
node6:addChildKeyword({ "yes" }, StdModule.learnSpell, { npcHandler = npcHandler, premium = false, spellName = "magic rope", vocation = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 }, price = 200, level = 9 })

local node7 = keywordHandler:addKeyword({ "cure poison" }, StdModule.say, { npcHandler = npcHandler, onlyFocus = true, text = "Would you like to learn {cure poison} magic spell for 150 gold?" })
node7:addChildKeyword({ "yes" }, StdModule.learnSpell, { npcHandler = npcHandler, premium = false, spellName = "cure poison", vocation = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 }, price = 150, level = 10 })

local node8 = keywordHandler:addKeyword({ "levitate" }, StdModule.say, { npcHandler = npcHandler, onlyFocus = true, text = "Would you like to learn {levitate} magic spell for 500 gold?" })
node8:addChildKeyword({ "yes" }, StdModule.learnSpell, { npcHandler = npcHandler, premium = false, spellName = "levitate", vocation = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 }, price = 500, level = 12 })

local node9 = keywordHandler:addKeyword({ "great light" }, StdModule.say, { npcHandler = npcHandler, onlyFocus = true, text = "Would you like to learn {great light} magic spell for 500 gold?" })
node9:addChildKeyword({ "yes" }, StdModule.learnSpell, { npcHandler = npcHandler, premium = false, spellName = "great light", vocation = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 }, price = 500, level = 13 })

local node10 = keywordHandler:addKeyword({ "light" }, StdModule.say, { npcHandler = npcHandler, onlyFocus = true, text = "Would you like to learn {light} magic spell for free?" })
node10:addChildKeyword({ "yes" }, StdModule.learnSpell, { npcHandler = npcHandler, premium = false, spellName = "light", vocation = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 }, price = 0, level = 8 })

local node11 = keywordHandler:addKeyword({ "double jab" }, StdModule.say, { npcHandler = npcHandler, onlyFocus = true, text = "Would you like to learn {double jab} magic spell for 1000 gold?" })
node11:addChildKeyword({ "yes" }, StdModule.learnSpell, { npcHandler = npcHandler, premium = false, spellName = "double jab", vocation = { 9, 10 }, price = 1000, level = 14 })

local node12 = keywordHandler:addKeyword({ "restore balance" }, StdModule.say, { npcHandler = npcHandler, onlyFocus = true, text = "Would you like to learn {restore balance} magic spell for 800 gold?" })
node12:addChildKeyword({ "yes" }, StdModule.learnSpell, { npcHandler = npcHandler, premium = false, spellName = "restore balance", vocation = { 9, 10 }, price = 800, level = 18 })

local node13 = keywordHandler:addKeyword({ "greater tiger clash" }, StdModule.say, { npcHandler = npcHandler, onlyFocus = true, text = "Would you like to learn {greater tiger clash} magic spell for 6000 gold?" })
node13:addChildKeyword({ "yes" }, StdModule.learnSpell, { npcHandler = npcHandler, premium = false, spellName = "greater tiger clash", vocation = { 9, 10 }, price = 6000, level = 18 })

local node14 = keywordHandler:addKeyword({ "intense healing" }, StdModule.say, { npcHandler = npcHandler, onlyFocus = true, text = "Would you like to learn {intense healing} magic spell for 350 gold?" })
node14:addChildKeyword({ "yes" }, StdModule.learnSpell, { npcHandler = npcHandler, premium = false, spellName = "intense healing", vocation = { 1, 2, 3, 5, 6, 7, 9, 10 }, price = 350, level = 20 })

local node15 = keywordHandler:addKeyword({ "strong haste" }, StdModule.say, { npcHandler = npcHandler, onlyFocus = true, text = "Would you like to learn {strong haste} magic spell for 1300 gold?" })
node15:addChildKeyword({ "yes" }, StdModule.learnSpell, { npcHandler = npcHandler, premium = false, spellName = "strong haste", vocation = { 1, 2, 5, 6, 9, 10 }, price = 1300, level = 20 })

local node16 = keywordHandler:addKeyword({ "haste" }, StdModule.say, { npcHandler = npcHandler, onlyFocus = true, text = "Would you like to learn {haste} magic spell for 600 gold?" })
node16:addChildKeyword({ "yes" }, StdModule.learnSpell, { npcHandler = npcHandler, premium = false, spellName = "haste", vocation = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 }, price = 600, level = 14 })

local node17 = keywordHandler:addKeyword({ "find fiend" }, StdModule.say, { npcHandler = npcHandler, onlyFocus = true, text = "Would you like to learn {find fiend} magic spell for 1000 gold?" })
node17:addChildKeyword({ "yes" }, StdModule.learnSpell, { npcHandler = npcHandler, premium = false, spellName = "find fiend", vocation = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 }, price = 1000, level = 25 })

local node18 = keywordHandler:addKeyword({ "enlighten party" }, StdModule.say, { npcHandler = npcHandler, onlyFocus = true, text = "Would you like to learn {enlighten party} magic spell for 4000 gold?" })
node18:addChildKeyword({ "yes" }, StdModule.learnSpell, { npcHandler = npcHandler, premium = false, spellName = "enlighten party", vocation = { 9, 10 }, price = 4000, level = 32 })

local node19 = keywordHandler:addKeyword({ "flurry of blows" }, StdModule.say, { npcHandler = npcHandler, onlyFocus = true, text = "Would you like to learn {flurry of blows} magic spell for 1500 gold?" })
node19:addChildKeyword({ "yes" }, StdModule.learnSpell, { npcHandler = npcHandler, premium = false, spellName = "flurry of blows", vocation = { 9, 10 }, price = 1500, level = 35 })

local node20 = keywordHandler:addKeyword({ "sweeping takedown" }, StdModule.say, { npcHandler = npcHandler, onlyFocus = true, text = "Would you like to learn {sweeping takedown} magic spell for 8000 gold?" })
node20:addChildKeyword({ "yes" }, StdModule.learnSpell, { npcHandler = npcHandler, premium = false, spellName = "sweeping takedown", vocation = { 9, 10 }, price = 8000, level = 60 })

local node21 = keywordHandler:addKeyword({ "chained penance" }, StdModule.say, { npcHandler = npcHandler, onlyFocus = true, text = "Would you like to learn {chained penance} magic spell for 8000 gold?" })
node21:addChildKeyword({ "yes" }, StdModule.learnSpell, { npcHandler = npcHandler, premium = false, spellName = "chained penance", vocation = { 9, 10 }, price = 8000, level = 70 })

local node22 = keywordHandler:addKeyword({ "spirit mend" }, StdModule.say, { npcHandler = npcHandler, onlyFocus = true, text = "Would you like to learn {spirit mend} magic spell for 9000 gold?" })
node22:addChildKeyword({ "yes" }, StdModule.learnSpell, { npcHandler = npcHandler, premium = false, spellName = "spirit mend", vocation = { 9, 10 }, price = 9000, level = 80 })

local node23 = keywordHandler:addKeyword({ "greater flurry of blows" }, StdModule.say, { npcHandler = npcHandler, onlyFocus = true, text = "Would you like to learn {greater flurry of blows} magic spell for 11000 gold?" })
node23:addChildKeyword({ "yes" }, StdModule.learnSpell, { npcHandler = npcHandler, premium = false, spellName = "greater flurry of blows", vocation = { 9, 10 }, price = 11000, level = 90 })

local node24 = keywordHandler:addKeyword({ "devastating knockout" }, StdModule.say, { npcHandler = npcHandler, onlyFocus = true, text = "Would you like to learn {devastating knockout} magic spell for 20000 gold?" })
node24:addChildKeyword({ "yes" }, StdModule.learnSpell, { npcHandler = npcHandler, premium = false, spellName = "devastating knockout", vocation = { 9, 10 }, price = 20000, level = 125 })

local node25 = keywordHandler:addKeyword({ "mass spirit mend" }, StdModule.say, { npcHandler = npcHandler, onlyFocus = true, text = "Would you like to learn {mass spirit mend} magic spell for 20000 gold?" })
node25:addChildKeyword({ "yes" }, StdModule.learnSpell, { npcHandler = npcHandler, premium = false, spellName = "mass spirit mend", vocation = { 9, 10 }, price = 20000, level = 150 })

local node26 = keywordHandler:addKeyword({ "focus serenity" }, StdModule.say, { npcHandler = npcHandler, onlyFocus = true, text = "Would you like to learn {focus serenity} magic spell for 125000 gold?" })
node26:addChildKeyword({ "yes" }, StdModule.learnSpell, { npcHandler = npcHandler, premium = false, spellName = "focus serenity", vocation = { 9, 10 }, price = 125000, level = 150 })

local node27 = keywordHandler:addKeyword({ "mentor other" }, StdModule.say, { npcHandler = npcHandler, onlyFocus = true, text = "Would you like to learn {mentor other} magic spell for 175000 gold?" })
node27:addChildKeyword({ "yes" }, StdModule.learnSpell, { npcHandler = npcHandler, premium = false, spellName = "mentor other", vocation = { 9, 10 }, price = 175000, level = 150 })

local node28 = keywordHandler:addKeyword({ "balanced brawl" }, StdModule.say, { npcHandler = npcHandler, onlyFocus = true, text = "Would you like to learn {balanced brawl} magic spell for 250000 gold?" })
node28:addChildKeyword({ "yes" }, StdModule.learnSpell, { npcHandler = npcHandler, premium = false, spellName = "balanced brawl", vocation = { 9, 10 }, price = 250000, level = 175 })

local node29 = keywordHandler:addKeyword({ "summon monk familiar" }, StdModule.say, { npcHandler = npcHandler, onlyFocus = true, text = "Would you like to learn {summon monk familiar} magic spell for 50000 gold?" })
node29:addChildKeyword({ "yes" }, StdModule.learnSpell, { npcHandler = npcHandler, premium = false, spellName = "summon monk familiar", vocation = { 9, 10 }, price = 50000, level = 200 })

npcType.onCheckItem = function(npc, player, clientId, subType) end

npcType:register(npcConfig)
