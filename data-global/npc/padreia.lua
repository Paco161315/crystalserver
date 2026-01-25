local internalNpcName = "Padreia"
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
	lookHead = 0,
	lookBody = 87,
	lookLegs = 85,
	lookFeet = 95,
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

local function creatureSayCallback(npc, creature, type, message)
	local player = Player(creature)
	local playerId = player:getId()

	if not npcHandler:checkInteraction(npc, creature) then
		return false
	end

	-- Tibia tales quest
	if MsgContains(message, "cough syrup") then
		npcHandler:say("Do you want to buy a bottle of cough syrup for 50 gold?", npc, creature)
		npcHandler:setTopic(playerId, 1)
	elseif MsgContains(message, "mission") then
		if player:getStorageValue(Storage.Quest.U8_1.TibiaTales.TheExterminator) == -1 then
			npcHandler:say({
				"Oh " .. player:getName() .. ", thank god you came to me. Last night, I had a vision about an upcoming plague here in Carlin. ...",
				"It will originate from slimes that will swarm out of the sewers and infect every citizen with a deadly disease. Are you willing to help me save Carlin?",
			}, npc, creature)
			npcHandler:setTopic(playerId, 2)
		elseif player:getStorageValue(Storage.Quest.U8_1.TibiaTales.TheExterminator) == 1 then
			npcHandler:say("You MUST find that slime pool immediately or life here in Carlin will not be the same anymore.", npc, creature)
		elseif player:getStorageValue(Storage.Quest.U8_1.TibiaTales.TheExterminator) == 2 then
			local itemId = { 3033, 3032, 3030, 3029 }
			for i = 1, #itemId do
				player:addItem(itemId[i], 1)
			end
			player:setStorageValue(Storage.Quest.U8_1.TibiaTales.TheExterminator, 3)
			npcHandler:say("You did it! Even if only few of the Carliners will ever know about that, you saved all of their lives. Here, take this as a reward. Farewell!", npc, creature)
		else
			npcHandler:say("Maybe the guards have something to do for you or know someone who could need some help.", npc, creature)
		end
	elseif MsgContains(message, "yes") then
		if npcHandler:getTopic(playerId) == 1 then
			if not player:removeMoneyBank(50) then
				npcHandler:say("You don't have enough money.", npc, creature)
				return true
			end

			npcHandler:say("Thank you. Here it is.", npc, creature)
			player:addItem(4828, 1)
		elseif npcHandler:getTopic(playerId) == 2 then
			player:addItem(135, 1)
			player:setStorageValue(Storage.Quest.U8_1.TibiaTales.TheExterminator, 1)
			npcHandler:say({
				"I knew I could count on you. Take this highly intensified vermin poison. In my vision, I saw some kind of 'pool' where these slimes came from. ...",
				"Pour the poison in the water to stop the demise of Carlin. Tell me about your mission after you fulfilled your task.",
			}, npc, creature)
		end
		npcHandler:setTopic(playerId, 0)
	elseif MsgContains(message, "no") then
		if npcHandler:getTopic(playerId) == 1 then
			npcHandler:say("Then no.", npc, creature)
			npcHandler:setTopic(playerId, 0)
		elseif npcHandler:getTopic(playerId) == 2 then
			npcHandler:say("Then the downfall of Carlin is inescapable. Please think about it. You know where to find me.", npc, creature)
			npcHandler:setTopic(playerId, 0)
		end
	end

	-- The paradox tower quest
	if MsgContains(message, "crunor's caress") then
		npcHandler:say("Don't ask. They were only an unimportant footnote of history.", npc, creature)
		npcHandler:setTopic(playerId, 0)
	elseif MsgContains(message, "footnote") then
		if player:getStorageValue(Storage.Quest.U7_24.TheParadoxTower.TheFearedHugo) == 2 then
			-- Questlog: The Feared Hugo (Lubo)
			player:setStorageValue(Storage.Quest.U7_24.TheParadoxTower.TheFearedHugo, 3)
		end
		npcHandler:say("They thought they had to bring Crunor to the people, if the people had not found Crunor on their own. To achieve this, they founded the inn called Crunor's Cottage, south of Mt. Sternum.", npc, creature)
		npcHandler:setTopic(playerId, 0)
	end
	return true
end

keywordHandler:addKeyword({ "spell" }, StdModule.say, {
	npcHandler = npcHandler,
	text = "I can teach you these spells: {Apprentice's Strike}, {Avalanche}, {Chameleon}, {Chill Out}, {Convince Creature}, {Creature Illusion}, {Cure Poison}, {Cure Poison Rune}, {Destroy Field}, {Energy Field}, {Energy Wall}, {Explosion}, {Find Fiend}, {Find Person}, {Fire Bomb}, {Fire Field}, {Fire Wall}, {Food}, {Great Light}, {Heavy Magic Missile}, {Ice Wave}, {Intense Healing}, {Intense Healing Rune}, {Invisible}, {Light}, {Light Healing}, {Light Magic Missile}, {Magic Patch}, {Magic Shield}, {Mud Attack}, {Poison Field}, {Poison Wall}, {Stalagmite}, {Summon Creature}, {Terra Wave}, {Ultimate Healing} and {Ultimate Healing Rune}.",
})

local node1 = keywordHandler:addKeyword({ "apprentice's strike" }, StdModule.say, { npcHandler = npcHandler, onlyFocus = true, text = "Would you like to learn {apprentice's strike} magic spell for free?" })
node1:addChildKeyword({ "yes" }, StdModule.learnSpell, { npcHandler = npcHandler, premium = false, spellName = "apprentice's strike", vocation = { 1, 2, 5, 6 }, price = 0, level = 8 })

local node2 = keywordHandler:addKeyword({ "avalanche" }, StdModule.say, { npcHandler = npcHandler, onlyFocus = true, text = "Would you like to learn {avalanche} magic spell for 1200 gold?" })
node2:addChildKeyword({ "yes" }, StdModule.learnSpell, { npcHandler = npcHandler, premium = false, spellName = "avalanche", vocation = { 2, 6 }, price = 1200, level = 30 })

local node3 = keywordHandler:addKeyword({ "chameleon" }, StdModule.say, { npcHandler = npcHandler, onlyFocus = true, text = "Would you like to learn {chameleon} magic spell for 1300 gold?" })
node3:addChildKeyword({ "yes" }, StdModule.learnSpell, { npcHandler = npcHandler, premium = false, spellName = "chameleon", vocation = { 2, 6 }, price = 1300, level = 27 })

local node4 = keywordHandler:addKeyword({ "chill out" }, StdModule.say, { npcHandler = npcHandler, onlyFocus = true, text = "Would you like to learn {chill out} magic spell for free?" })
node4:addChildKeyword({ "yes" }, StdModule.learnSpell, { npcHandler = npcHandler, premium = false, spellName = "chill out", vocation = { 2, 6 }, price = 0, level = 1 })

local node5 = keywordHandler:addKeyword({ "convince creature" }, StdModule.say, { npcHandler = npcHandler, onlyFocus = true, text = "Would you like to learn {convince creature} magic spell for 800 gold?" })
node5:addChildKeyword({ "yes" }, StdModule.learnSpell, { npcHandler = npcHandler, premium = false, spellName = "convince creature", vocation = { 2, 6 }, price = 800, level = 16 })

local node6 = keywordHandler:addKeyword({ "creature illusion" }, StdModule.say, { npcHandler = npcHandler, onlyFocus = true, text = "Would you like to learn {creature illusion} magic spell for 1000 gold?" })
node6:addChildKeyword({ "yes" }, StdModule.learnSpell, { npcHandler = npcHandler, premium = false, spellName = "creature illusion", vocation = { 1, 2, 5, 6 }, price = 1000, level = 23 })

local node7 = keywordHandler:addKeyword({ "cure poison rune" }, StdModule.say, { npcHandler = npcHandler, onlyFocus = true, text = "Would you like to learn {cure poison rune} magic spell for 600 gold?" })
node7:addChildKeyword({ "yes" }, StdModule.learnSpell, { npcHandler = npcHandler, premium = false, spellName = "cure poison rune", vocation = { 2, 6 }, price = 600, level = 15 })

local node8 = keywordHandler:addKeyword({ "cure poison" }, StdModule.say, { npcHandler = npcHandler, onlyFocus = true, text = "Would you like to learn {cure poison} magic spell for 150 gold?" })
node8:addChildKeyword({ "yes" }, StdModule.learnSpell, { npcHandler = npcHandler, premium = false, spellName = "cure poison", vocation = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 }, price = 150, level = 10 })

local node9 = keywordHandler:addKeyword({ "destroy field" }, StdModule.say, { npcHandler = npcHandler, onlyFocus = true, text = "Would you like to learn {destroy field} magic spell for 700 gold?" })
node9:addChildKeyword({ "yes" }, StdModule.learnSpell, { npcHandler = npcHandler, premium = false, spellName = "destroy field", vocation = { 1, 2, 3, 5, 6, 7, 9, 10 }, price = 700, level = 17 })

local node10 = keywordHandler:addKeyword({ "energy field" }, StdModule.say, { npcHandler = npcHandler, onlyFocus = true, text = "Would you like to learn {energy field} magic spell for 700 gold?" })
node10:addChildKeyword({ "yes" }, StdModule.learnSpell, { npcHandler = npcHandler, premium = false, spellName = "energy field", vocation = { 1, 2, 5, 6 }, price = 700, level = 18 })

local node11 = keywordHandler:addKeyword({ "energy wall" }, StdModule.say, { npcHandler = npcHandler, onlyFocus = true, text = "Would you like to learn {energy wall} magic spell for 2500 gold?" })
node11:addChildKeyword({ "yes" }, StdModule.learnSpell, { npcHandler = npcHandler, premium = false, spellName = "energy wall", vocation = { 1, 2, 5, 6 }, price = 2500, level = 41 })

local node12 = keywordHandler:addKeyword({ "explosion" }, StdModule.say, { npcHandler = npcHandler, onlyFocus = true, text = "Would you like to learn {explosion} magic spell for 1800 gold?" })
node12:addChildKeyword({ "yes" }, StdModule.learnSpell, { npcHandler = npcHandler, premium = false, spellName = "explosion", vocation = { 1, 2, 5, 6 }, price = 1800, level = 31 })

local node13 = keywordHandler:addKeyword({ "find fiend" }, StdModule.say, { npcHandler = npcHandler, onlyFocus = true, text = "Would you like to learn {find fiend} magic spell for 1000 gold?" })
node13:addChildKeyword({ "yes" }, StdModule.learnSpell, { npcHandler = npcHandler, premium = false, spellName = "find fiend", vocation = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 }, price = 1000, level = 25 })

local node14 = keywordHandler:addKeyword({ "find person" }, StdModule.say, { npcHandler = npcHandler, onlyFocus = true, text = "Would you like to learn {find person} magic spell for 80 gold?" })
node14:addChildKeyword({ "yes" }, StdModule.learnSpell, { npcHandler = npcHandler, premium = false, spellName = "find person", vocation = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 }, price = 80, level = 8 })

local node15 = keywordHandler:addKeyword({ "fire bomb" }, StdModule.say, { npcHandler = npcHandler, onlyFocus = true, text = "Would you like to learn {fire bomb} magic spell for 1500 gold?" })
node15:addChildKeyword({ "yes" }, StdModule.learnSpell, { npcHandler = npcHandler, premium = false, spellName = "fire bomb", vocation = { 1, 2, 5, 6 }, price = 1500, level = 27 })

local node16 = keywordHandler:addKeyword({ "fire field" }, StdModule.say, { npcHandler = npcHandler, onlyFocus = true, text = "Would you like to learn {fire field} magic spell for 500 gold?" })
node16:addChildKeyword({ "yes" }, StdModule.learnSpell, { npcHandler = npcHandler, premium = false, spellName = "fire field", vocation = { 1, 2, 5, 6 }, price = 500, level = 15 })

local node17 = keywordHandler:addKeyword({ "fire wall" }, StdModule.say, { npcHandler = npcHandler, onlyFocus = true, text = "Would you like to learn {fire wall} magic spell for 2000 gold?" })
node17:addChildKeyword({ "yes" }, StdModule.learnSpell, { npcHandler = npcHandler, premium = false, spellName = "fire wall", vocation = { 1, 2, 5, 6 }, price = 2000, level = 33 })

local node18 = keywordHandler:addKeyword({ "food" }, StdModule.say, { npcHandler = npcHandler, onlyFocus = true, text = "Would you like to learn {food} magic spell for 300 gold?" })
node18:addChildKeyword({ "yes" }, StdModule.learnSpell, { npcHandler = npcHandler, premium = false, spellName = "food", vocation = { 2, 6 }, price = 300, level = 14 })

local node19 = keywordHandler:addKeyword({ "great light" }, StdModule.say, { npcHandler = npcHandler, onlyFocus = true, text = "Would you like to learn {great light} magic spell for 500 gold?" })
node19:addChildKeyword({ "yes" }, StdModule.learnSpell, { npcHandler = npcHandler, premium = false, spellName = "great light", vocation = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 }, price = 500, level = 13 })

local node20 = keywordHandler:addKeyword({ "heavy magic missile" }, StdModule.say, { npcHandler = npcHandler, onlyFocus = true, text = "Would you like to learn {heavy magic missile} magic spell for 1500 gold?" })
node20:addChildKeyword({ "yes" }, StdModule.learnSpell, { npcHandler = npcHandler, premium = false, spellName = "heavy magic missile", vocation = { 1, 2, 5, 6 }, price = 1500, level = 25 })

local node21 = keywordHandler:addKeyword({ "ice wave" }, StdModule.say, { npcHandler = npcHandler, onlyFocus = true, text = "Would you like to learn {ice wave} magic spell for 850 gold?" })
node21:addChildKeyword({ "yes" }, StdModule.learnSpell, { npcHandler = npcHandler, premium = false, spellName = "ice wave", vocation = { 2, 6 }, price = 850, level = 18 })

local node22 = keywordHandler:addKeyword({ "intense healing rune" }, StdModule.say, { npcHandler = npcHandler, onlyFocus = true, text = "Would you like to learn {intense healing rune} magic spell for 600 gold?" })
node22:addChildKeyword({ "yes" }, StdModule.learnSpell, { npcHandler = npcHandler, premium = false, spellName = "intense healing rune", vocation = { 2, 6 }, price = 600, level = 15 })

local node23 = keywordHandler:addKeyword({ "intense healing" }, StdModule.say, { npcHandler = npcHandler, onlyFocus = true, text = "Would you like to learn {intense healing} magic spell for 350 gold?" })
node23:addChildKeyword({ "yes" }, StdModule.learnSpell, { npcHandler = npcHandler, premium = false, spellName = "intense healing", vocation = { 1, 2, 3, 5, 6, 7, 9, 10 }, price = 350, level = 20 })

local node24 = keywordHandler:addKeyword({ "invisible" }, StdModule.say, { npcHandler = npcHandler, onlyFocus = true, text = "Would you like to learn {invisible} magic spell for 2000 gold?" })
node24:addChildKeyword({ "yes" }, StdModule.learnSpell, { npcHandler = npcHandler, premium = false, spellName = "invisible", vocation = { 1, 2, 5, 6 }, price = 2000, level = 35 })

local node25 = keywordHandler:addKeyword({ "light healing" }, StdModule.say, { npcHandler = npcHandler, onlyFocus = true, text = "Would you like to learn {light healing} magic spell for free?" })
node25:addChildKeyword({ "yes" }, StdModule.learnSpell, { npcHandler = npcHandler, premium = false, spellName = "light healing", vocation = { 1, 2, 3, 5, 6, 7, 9, 10 }, price = 0, level = 8 })

local node26 = keywordHandler:addKeyword({ "light magic missile" }, StdModule.say, { npcHandler = npcHandler, onlyFocus = true, text = "Would you like to learn {light magic missile} magic spell for 500 gold?" })
node26:addChildKeyword({ "yes" }, StdModule.learnSpell, { npcHandler = npcHandler, premium = false, spellName = "light magic missile", vocation = { 1, 2, 5, 6 }, price = 500, level = 15 })

local node27 = keywordHandler:addKeyword({ "light" }, StdModule.say, { npcHandler = npcHandler, onlyFocus = true, text = "Would you like to learn {light} magic spell for free?" })
node27:addChildKeyword({ "yes" }, StdModule.learnSpell, { npcHandler = npcHandler, premium = false, spellName = "light", vocation = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 }, price = 0, level = 8 })

local node28 = keywordHandler:addKeyword({ "magic patch" }, StdModule.say, { npcHandler = npcHandler, onlyFocus = true, text = "Would you like to learn {magic patch} magic spell for free?" })
node28:addChildKeyword({ "yes" }, StdModule.learnSpell, { npcHandler = npcHandler, premium = false, spellName = "magic patch", vocation = { 2, 3, 6, 7 }, price = 0, level = 1 })

local node29 = keywordHandler:addKeyword({ "magic shield" }, StdModule.say, { npcHandler = npcHandler, onlyFocus = true, text = "Would you like to learn {magic shield} magic spell for 450 gold?" })
node29:addChildKeyword({ "yes" }, StdModule.learnSpell, { npcHandler = npcHandler, premium = false, spellName = "magic shield", vocation = { 1, 2, 5, 6 }, price = 450, level = 14 })

local node30 = keywordHandler:addKeyword({ "mud attack" }, StdModule.say, { npcHandler = npcHandler, onlyFocus = true, text = "Would you like to learn {mud attack} magic spell for free?" })
node30:addChildKeyword({ "yes" }, StdModule.learnSpell, { npcHandler = npcHandler, premium = false, spellName = "mud attack", vocation = { 2, 6 }, price = 0, level = 1 })

local node31 = keywordHandler:addKeyword({ "poison field" }, StdModule.say, { npcHandler = npcHandler, onlyFocus = true, text = "Would you like to learn {poison field} magic spell for 300 gold?" })
node31:addChildKeyword({ "yes" }, StdModule.learnSpell, { npcHandler = npcHandler, premium = false, spellName = "poison field", vocation = { 1, 2, 5, 6 }, price = 300, level = 14 })

local node32 = keywordHandler:addKeyword({ "poison wall" }, StdModule.say, { npcHandler = npcHandler, onlyFocus = true, text = "Would you like to learn {poison wall} magic spell for 1600 gold?" })
node32:addChildKeyword({ "yes" }, StdModule.learnSpell, { npcHandler = npcHandler, premium = false, spellName = "poison wall", vocation = { 1, 2, 5, 6 }, price = 1600, level = 29 })

local node33 = keywordHandler:addKeyword({ "stalagmite" }, StdModule.say, { npcHandler = npcHandler, onlyFocus = true, text = "Would you like to learn {stalagmite} magic spell for 1400 gold?" })
node33:addChildKeyword({ "yes" }, StdModule.learnSpell, { npcHandler = npcHandler, premium = false, spellName = "stalagmite", vocation = { 2, 6 }, price = 1400, level = 24 })

local node34 = keywordHandler:addKeyword({ "summon creature" }, StdModule.say, { npcHandler = npcHandler, onlyFocus = true, text = "Would you like to learn {summon creature} magic spell for 2000 gold?" })
node34:addChildKeyword({ "yes" }, StdModule.learnSpell, { npcHandler = npcHandler, premium = false, spellName = "summon creature", vocation = { 2, 6 }, price = 2000, level = 25 })

local node35 = keywordHandler:addKeyword({ "terra wave" }, StdModule.say, { npcHandler = npcHandler, onlyFocus = true, text = "Would you like to learn {terra wave} magic spell for 2500 gold?" })
node35:addChildKeyword({ "yes" }, StdModule.learnSpell, { npcHandler = npcHandler, premium = false, spellName = "terra wave", vocation = { 2, 6 }, price = 2500, level = 38 })

local node36 = keywordHandler:addKeyword({ "ultimate healing rune" }, StdModule.say, { npcHandler = npcHandler, onlyFocus = true, text = "Would you like to learn {ultimate healing rune} magic spell for 1500 gold?" })
node36:addChildKeyword({ "yes" }, StdModule.learnSpell, { npcHandler = npcHandler, premium = false, spellName = "ultimate healing rune", vocation = { 2, 6 }, price = 1500, level = 24 })

local node37 = keywordHandler:addKeyword({ "ultimate healing" }, StdModule.say, { npcHandler = npcHandler, onlyFocus = true, text = "Would you like to learn {ultimate healing} magic spell for 1000 gold?" })
node37:addChildKeyword({ "yes" }, StdModule.learnSpell, { npcHandler = npcHandler, premium = false, spellName = "ultimate healing", vocation = { 1, 2, 5, 6 }, price = 1000, level = 30 })

keywordHandler:addKeyword({ "job" }, StdModule.say, { npcHandler = npcHandler, text = "I am the grand druid of Carlin. I am responsible for the guild, the fields, and our citizens' health." })
keywordHandler:addKeyword({ "magic" }, StdModule.say, { npcHandler = npcHandler, text = "Every druid is able to learn the numerous spells of our craft." })
--keywordHandler:addKeyword({'spell'}, StdModule.say, {npcHandler = npcHandler, text = "Sorry, I don't teach spells for your vocation."})
keywordHandler:addKeyword({ "name" }, StdModule.say, { npcHandler = npcHandler, text = "I am Padreia, grand druid of our fine city." })
keywordHandler:addKeyword({ "time" }, StdModule.say, { npcHandler = npcHandler, text = "Time is just a crystal pillar - the centre of creation and life." })
keywordHandler:addKeyword({ "druids" }, StdModule.say, { npcHandler = npcHandler, text = "We are druids, preservers of life. Our magic is about defence, healing, and nature." })
keywordHandler:addKeyword({ "sorcerers" }, StdModule.say, { npcHandler = npcHandler, text = "Sorcerers are destructive. Their power lies in destruction and pain." })

npcHandler:setMessage(MESSAGE_GREET, "Welcome to our humble guild, wanderer. May I be of any assistance to you?")
npcHandler:setMessage(MESSAGE_FAREWELL, "Farewell.")
npcHandler:setMessage(MESSAGE_WALKAWAY, "Farewell.")

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new(), npcConfig.name, true, true, true)

-- npcType registering the npcConfig table
npcType:register(npcConfig)
