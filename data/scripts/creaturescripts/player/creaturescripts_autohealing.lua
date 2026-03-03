local AUTOHEAL_STORAGE = 65003
local AUTOHEAL_THRESHOLD_STORAGE = 65004

-- map vocation ids
local VOCATION_IDS = {
	-- base
	["sorcerer"] = 1,
	["druid"] = 2,
	["paladin"] = 3,
	["knight"] = 4,
	["monk"] = 9,

	-- promotion
	["master sorcerer"] = 5,
	["elder druid"] = 6,
	["royal paladin"] = 7,
	["elite knight"] = 8,
	["exalted monk"] = 10,
}

-- debug
local VOCATION_NAMES = {}
for name, id in pairs(VOCATION_IDS) do
	VOCATION_NAMES[id] = name
end

-- Safe formula calculation wrapper
local function calculateHealAmount(spell, player)
	if not player or not player:isPlayer() then
		return 0
	end

	local success, minv, maxv = pcall(function()
		local result = spell.formula(player)
		if type(result) == "number" then
			return result, result
		elseif type(result) == "table" then
			return result[1] or 0, result[2] or 0
		else
			return 0, 0
		end
	end)

	if not success then
		return 0
	end

	-- Ensure valid range for math.random
	minv = math.max(1, math.floor(minv))
	maxv = math.max(minv, math.floor(maxv)) -- Ensure max >= min
	return math.random(minv, maxv)
end

-- spells table with ids
local HEALING_SPELLS = {
	["Magic Patch"] = {
		words = "exura infir",
		level = 1,
		mana = 6,
		voc = { 2, 6, 3, 7, 1, 5, 9, 10 },
		formula = function(player)
			if not player or not player:isPlayer() then
				return 0, 0
			end
			local level = player:getLevel()
			local ml = player:getMagicLevel()
			local minv = (level * 0 + ml * 0.1614) + 8
			local maxv = (level * 0 + ml * 0.2468) + 15
			return minv, maxv
		end,
		cooldown = 3000,
		groupCooldown = 1000,
		effect = CONST_ME_MAGIC_BLUE,
		dispel = CONDITION_PARALYZE,
		priority = 1,
	},
	["Bruise Bane"] = {
		words = "exura infir ico",
		level = 1,
		mana = 10,
		voc = { 4, 8 },
		formula = function(player)
			if not player or not player:isPlayer() then
				return 0, 0
			end
			local level = player:getLevel()
			local ml = player:getMagicLevel()
			local minv = (level * 0.2 + ml * 1.795)
			local maxv = (level * 0.2 + ml * 1.795) + 5
			return math.max(1, minv), math.max(1, maxv)
		end,
		cooldown = 3000,
		groupCooldown = 1000,
		effect = CONST_ME_MAGIC_BLUE,
		dispel = CONDITION_PARALYZE,
		priority = 2,
	},
	["Divine Healing"] = {
		words = "exura san",
		level = 35,
		mana = 160,
		voc = { 3, 7 },
		formula = function(player)
			if not player or not player:isPlayer() then
				return 0, 0
			end
			local level = player:getLevel()
			local ml = player:getMagicLevel()
			local minv = (level * 0.2 + ml * 7.22) + 44
			local maxv = (level * 0.2 + ml * 12.79) + 79
			return minv, maxv
		end,
		cooldown = 3000,
		groupCooldown = 1000,
		effect = CONST_ME_MAGIC_BLUE,
		dispel = CONDITION_PARALYZE,
		priority = 6,
		premium = true,
	},
	["Fair Wound Cleansing"] = {
		words = "exura med ico",
		level = 300,
		mana = 90,
		voc = { 4, 8 },
		formula = function(player)
			if not player or not player:isPlayer() then
				return 0, 0
			end
			local level = player:getLevel()
			local ml = player:getMagicLevel()
			local minv = (level * 0.2 + ml * 4 + 25) * 2
			local maxv = (level * 0.2 + ml * 7.95 + 51) * 2
			return minv, maxv
		end,
		cooldown = 3000,
		groupCooldown = 1000,
		effect = CONST_ME_MAGIC_BLUE,
		dispel = CONDITION_PARALYZE,
		priority = 5,
		premium = true,
	},
	["Intense Healing"] = {
		words = "exura gran",
		level = 20,
		mana = 70,
		voc = { 2, 6, 3, 7, 1, 5, 9, 10 },
		formula = function(player)
			if not player or not player:isPlayer() then
				return 0, 0
			end
			local level = player:getLevel()
			local ml = player:getMagicLevel()
			local minv = (level * 0.2 + ml * 3.184) + 20
			local maxv = (level * 0.2 + ml * 5.59) + 35
			return minv, maxv
		end,
		cooldown = 3000,
		groupCooldown = 1000,
		effect = CONST_ME_MAGIC_BLUE,
		dispel = CONDITION_PARALYZE,
		priority = 5,
	},
	["Intense Wound Cleansing"] = {
		words = "exura gran ico",
		level = 80,
		mana = 200,
		voc = { 4, 8 },
		formula = function(player)
			if not player or not player:isPlayer() then
				return 0, 0
			end
			local level = player:getLevel()
			local ml = player:getMagicLevel()
			local minv = (level * 0.2 + ml * 70) + 438
			local maxv = (level * 0.2 + ml * 92) + 544
			return minv, maxv
		end,
		cooldown = 600000,
		groupCooldown = 1000,
		effect = CONST_ME_MAGIC_BLUE,
		dispel = CONDITION_PARALYZE,
		priority = 7,
		premium = true,
	},
	["Light Healing"] = {
		words = "exura",
		level = 8,
		mana = 20,
		voc = { 2, 6, 3, 7, 1, 5, 9, 10 },
		formula = function(player)
			if not player or not player:isPlayer() then
				return 0, 0
			end
			local level = player:getLevel()
			local ml = player:getMagicLevel()
			local minv = (level * 0.2 + ml * 1.4) + 8
			local maxv = (level * 0.2 + ml * 1.795) + 11
			return minv, maxv
		end,
		cooldown = 3000,
		groupCooldown = 1000,
		effect = CONST_ME_MAGIC_BLUE,
		dispel = CONDITION_PARALYZE,
		priority = 3,
	},
	["Salvation"] = {
		words = "exura gran san",
		level = 60,
		mana = 210,
		voc = { 3, 7 },
		formula = function(player)
			if not player or not player:isPlayer() then
				return 0, 0
			end
			local level = player:getLevel()
			local ml = player:getMagicLevel()
			local minv = (level * 0.2 + ml * 12) + 75
			local maxv = (level * 0.2 + ml * 20) + 125
			return minv, maxv
		end,
		cooldown = 3000,
		groupCooldown = 1000,
		effect = CONST_ME_MAGIC_BLUE,
		dispel = CONDITION_PARALYZE,
		priority = 8,
		premium = true,
	},
	["Practice Healing"] = {
		words = "exura dis",
		level = 1,
		mana = 5,
		voc = { 4, 8, 3, 7, 1, 5, 2, 6, 9, 10 },
		formula = function(player)
			return 5, 9
		end,
		cooldown = 3000,
		groupCooldown = 1000,
		effect = CONST_ME_MAGIC_BLUE,
		dispel = CONDITION_PARALYZE,
		priority = 1,
	},
	["Spirit Mend"] = {
		words = "exura gran tio",
		level = 80,
		mana = 210,
		voc = { 9, 10 },
		formula = function(player)
			if not player or not player:isPlayer() then
				return 0, 0
			end
			local level = player:getLevel()
			local ml = player:getMagicLevel()
			local minv = (level * 0.2 + ml * 12) + 75
			local maxv = (level * 0.2 + ml * 20) + 125
			return minv, maxv
		end,
		cooldown = 3000,
		groupCooldown = 1000,
		effect = CONST_ME_MAGIC_BLUE,
		dispel = CONDITION_PARALYZE,
		priority = 7,
		premium = true,
	},
	["Ultimate Healing"] = {
		words = "exura vita",
		level = 30,
		mana = 160,
		voc = { 2, 6, 1, 5 },
		formula = function(player)
			if not player or not player:isPlayer() then
				return 0, 0
			end
			local level = player:getLevel()
			local ml = player:getMagicLevel()
			local minv = (level / 5) + (ml * 6.8) + 42
			local maxv = (level / 5) + (ml * 12.9) + 90
			return minv, maxv
		end,
		cooldown = 3000,
		groupCooldown = 1000,
		effect = CONST_ME_MAGIC_BLUE,
		dispel = CONDITION_PARALYZE,
		priority = 7,
	},
	["Wound Cleansing"] = {
		words = "exura ico",
		level = 8,
		mana = 40,
		voc = { 4, 8 },
		formula = function(player)
			if not player or not player:isPlayer() then
				return 0, 0
			end
			local level = player:getLevel()
			local ml = player:getMagicLevel()
			local minv = (level * 0.2 + ml * 4) + 25
			local maxv = (level * 0.2 + ml * 7.95) + 51
			return minv, maxv
		end,
		cooldown = 3000,
		groupCooldown = 1000,
		effect = CONST_ME_MAGIC_BLUE,
		dispel = CONDITION_PARALYZE,
		priority = 3,
	},
	["Restoration"] = {
		words = "exura max vita",
		level = 300,
		mana = 260,
		voc = { 2, 6, 1, 5 },
		formula = function(player)
			if not player or not player:isPlayer() then
				return 0, 0
			end
			local level = player:getLevel()
			local ml = player:getMagicLevel()
			local minv = (level * 1.4 / 5) + (ml * 9.22 * 1.4) + 44 * 1.4
			local maxv = (level * 1.4 / 5) + (ml * 10.79 * 1.4) + 79 * 1.4
			return minv, maxv
		end,
		cooldown = 6000,
		groupCooldown = 1000,
		effect = CONST_ME_MAGIC_BLUE,
		dispel = CONDITION_PARALYZE,
		priority = 10,
	},
}

-- cooldowns
local spellCooldowns = {}
local groupCooldowns = {}

local function getTimestamp()
	return os.mtime and os.mtime() or (os.time() * 1000)
end

local function isSpellOnCooldown(player, spell)
	if not player or not player:isPlayer() then
		return true
	end

	local pid = player:getId()
	local now = getTimestamp()

	if spellCooldowns[pid] and spellCooldowns[pid][spell.words] then
		if now < spellCooldowns[pid][spell.words] + spell.cooldown then
			return true
		end
	end

	if groupCooldowns[pid] then
		if now < groupCooldowns[pid] + spell.groupCooldown then
			return true
		end
	end

	return false
end

local function setSpellCooldown(player, spell)
	if not player or not player:isPlayer() then
		return
	end

	local pid = player:getId()
	local now = getTimestamp()

	if not spellCooldowns[pid] then
		spellCooldowns[pid] = {}
	end

	spellCooldowns[pid][spell.words] = now
	groupCooldowns[pid] = now
end

local function hasCondition(player, condType)
	if not player or not player:isPlayer() then
		return false
	end
	return player:hasCondition(condType) or player:getCondition(condType) ~= nil
end

local function canUseSpell(player, spell)
	if not player or not player:isPlayer() then
		return false
	end

	local vocation = player:getVocation()
	if not vocation then
		return false
	end

	local playerVocId = vocation:getId()

	local allowed = false
	for _, allowedVocId in ipairs(spell.voc) do
		if playerVocId == allowedVocId then
			allowed = true
			break
		end
	end

	if not allowed then
		return false
	end

	if player:getLevel() < spell.level then
		return false
	end

	if player:getMana() < spell.mana then
		return false
	end

	if isSpellOnCooldown(player, spell) then
		return false
	end

	if spell.premium and not player:isPremium() then
		return false
	end

	return true
end

local function getAvailableHealingSpells(player)
	if not player or not player:isPlayer() then
		return {}
	end

	local hp = player:getHealth()
	local maxHp = player:getMaxHealth()

	if maxHp <= 0 then
		return {}
	end

	-- Safe threshold calculation
	local customThreshold = player:getStorageValue(AUTOHEAL_THRESHOLD_STORAGE)
	local healthThreshold = 0.20 -- Default

	if customThreshold > 0 and customThreshold <= 100 then
		healthThreshold = customThreshold / 100
	end

	if hp > maxHp * healthThreshold then
		return {}
	end

	local availableSpells = {}

	for name, spell in pairs(HEALING_SPELLS) do
		if canUseSpell(player, spell) then
			local healAmount = calculateHealAmount(spell, player)
			if healAmount > 0 then
				local spellData = {
					spell = spell,
					name = name,
					priority = spell.priority,
					healAmount = healAmount,
				}

				-- priority bonus if condition active
				if spell.dispel and hasCondition(player, spell.dispel) then
					spellData.priority = spellData.priority + 5
				end

				table.insert(availableSpells, spellData)
			end
		end
	end

	-- order priority
	table.sort(availableSpells, function(a, b)
		if a.priority == b.priority then
			return a.healAmount > b.healAmount
		end
		return a.priority > b.priority
	end)

	return availableSpells
end

-- find best spell available
local function tryHealingSpell(player)
	if not player or not player:isPlayer() then
		return
	end

	if player:getStorageValue(AUTOHEAL_STORAGE) ~= 1 then
		return
	end

	local availableSpells = getAvailableHealingSpells(player)
	if #availableSpells == 0 then
		return
	end

	-- use best spell available
	local bestSpellData = availableSpells[1]
	local spell = bestSpellData.spell

	setSpellCooldown(player, spell)
	player:addMana(-spell.mana)
	player:addHealth(bestSpellData.healAmount)

	if spell.dispel and hasCondition(player, spell.dispel) then
		player:removeCondition(spell.dispel)
	end

	-- emote spells config
	local talkType = TALKTYPE_MONSTER_SAY
	if not configManager.getBoolean(configKeys.EMOTE_SPELLS) then
		talkType = TALKTYPE_SAY
	end

	player:say(spell.words, talkType)
	player:getPosition():sendMagicEffect(spell.effect)
	player:sendTextMessage(MESSAGE_HEALED, string.format("You heal yourself for %d hitpoints.", bestSpellData.healAmount))
end

local autoHealingEvent = GlobalEvent("autohealing")
function autoHealingEvent.onThink(interval)
	for _, player in ipairs(Game.getPlayers()) do
		if player and player:isPlayer() then
			tryHealingSpell(player)
		end
	end
	return true
end
autoHealingEvent:interval(1500)
autoHealingEvent:register()
